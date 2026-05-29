import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ft_intra/l10n/strings.dart';

const String checkinChannelId = 'ft_intra_checkin';
const String checkinChannelName = 'Campus check-in';
const String checkinCategoryId = 'CHECKIN_CATEGORY'; // iOS Darwin category
const String checkinActionId = 'checkin_yes'; // "Check in" action button
const int checkinPromptNotificationId = 4242;
const int checkinConfirmNotificationId = 4243;

/// Dedicated plugin instance for check-in. A FlutterLocalNotificationsPlugin
/// must be initialized once per isolate, so this is initialized both in the
/// main isolate (via FcmService) and in the geofence/notification background
/// isolate (via the geofence callback) before use.
final FlutterLocalNotificationsPlugin checkinNotifsPlugin =
    FlutterLocalNotificationsPlugin();

bool _initialized = false;

/// Initialize the check-in notification plugin with the iOS action category and
/// the foreground/background tap handlers. Safe to call multiple times.
Future<void> initCheckinNotifications({
  required void Function(NotificationResponse) onForeground,
  required void Function(NotificationResponse) onBackground,
}) async {
  if (_initialized) return;

  final initSettings = InitializationSettings(
    android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      notificationCategories: [
        DarwinNotificationCategory(
          checkinCategoryId,
          actions: [
            DarwinNotificationAction.plain(checkinActionId, 'Check in'),
          ],
        ),
      ],
    ),
  );

  await checkinNotifsPlugin.initialize(
    initSettings,
    onDidReceiveNotificationResponse: onForeground,
    onDidReceiveBackgroundNotificationResponse: onBackground,
  );
  _initialized = true;
}

AppStrings _stringsFromPrefs(SharedPreferences prefs) =>
    AppStrings(prefs.getString('app_locale') ?? 'en');

Future<void> showCheckinPrompt(int campusId) async {
  final s = _stringsFromPrefs(await SharedPreferences.getInstance());
  await checkinNotifsPlugin.show(
    checkinPromptNotificationId,
    s.get('checkin_prompt_title'),
    s.get('checkin_prompt_body'),
    NotificationDetails(
      android: AndroidNotificationDetails(
        checkinChannelId,
        checkinChannelName,
        importance: Importance.high,
        priority: Priority.high,
        actions: [
          AndroidNotificationAction(
            checkinActionId,
            s.get('checkin_action'),
            showsUserInterface: false,
            cancelNotification: true,
          ),
        ],
      ),
      iOS: const DarwinNotificationDetails(
        categoryIdentifier: checkinCategoryId,
      ),
    ),
    payload: campusId.toString(),
  );
}

Future<void> showCheckinConfirmation() async {
  final s = _stringsFromPrefs(await SharedPreferences.getInstance());
  await checkinNotifsPlugin.show(
    checkinConfirmNotificationId,
    s.get('checkin_confirmed_title'),
    s.get('checkin_confirmed_body'),
    NotificationDetails(
      android: AndroidNotificationDetails(
        checkinChannelId,
        checkinChannelName,
        importance: Importance.defaultImportance,
      ),
      iOS: const DarwinNotificationDetails(),
    ),
  );
}
