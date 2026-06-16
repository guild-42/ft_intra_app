import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ft_intra/core/notifications/eval_fetcher.dart';
import 'package:ft_intra/core/notifications/notification_router.dart';
import 'package:ft_intra/firebase_options.dart';

/// Background isolate handler for data-only pushes (the eval "alarm clock").
/// Must be a top-level function annotated for AOT entry. The isolate is fresh,
/// so Firebase must be initialized here before doing any work.
@pragma('vm:entry-point')
Future<void> ftFirebaseBackgroundHandler(RemoteMessage message) async {
  if (message.data['type'] != 'eval_wake') return;
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (_) {
    // Already initialized in this isolate, or init failed — fetch may still work.
  }
  await EvalFetcher.fetchAndNotify();
}

class FcmService {
  static final FlutterLocalNotificationsPlugin _localNotifs =
      FlutterLocalNotificationsPlugin();

  /// Injected by main.dart so core never imports the router (dependency
  /// direction: features → modules → core).
  static void Function(String route)? _onNavigate;

  static Future<void> initialize({
    void Function(String route)? onNavigate,
  }) async {
    if (kIsWeb) return;
    _onNavigate = onNavigate;

    final messaging = FirebaseMessaging.instance;

    // Data-only `eval_wake` pushes arriving while the app is backgrounded /
    // terminated are handled in a separate isolate (top-level handler).
    FirebaseMessaging.onBackgroundMessage(ftFirebaseBackgroundHandler);

    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    const initSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    // Tapping a foreground notification (re-shown below) carries a `route:`
    // payload — route to the matching screen.
    await _localNotifs.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        final route = routeFromPayload(response.payload);
        if (route != null) _onNavigate?.call(route);
      },
    );

    FirebaseMessaging.onMessage.listen(_handleForeground);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleOpenedApp);

    // Tap on a push while the app was terminated: FCM launches the app and
    // hands the message here instead of through onMessageOpenedApp.
    final initial = await messaging.getInitialMessage();
    if (initial != null) _handleOpenedApp(initial);
  }

  static Future<String?> getToken() async {
    if (kIsWeb) return null;
    final messaging = FirebaseMessaging.instance;
    try {
      // On Apple platforms getToken() throws `apns-token-not-set` until APNS
      // has delivered the device token, which lags a moment after launch /
      // permission grant. Wait for it (short poll) before asking for the FCM
      // token; fail soft (null) rather than throwing if it never arrives
      // (e.g. simulator, or push not configured).
      if (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.macOS) {
        var apns = await messaging.getAPNSToken();
        for (var i = 0; apns == null && i < 5; i++) {
          await Future.delayed(const Duration(seconds: 1));
          apns = await messaging.getAPNSToken();
        }
        if (apns == null) {
          debugPrint('FcmService: APNS token not available yet — skipping FCM token');
          return null;
        }
      }
      return await messaging.getToken();
    } catch (e) {
      debugPrint('FcmService.getToken failed: $e');
      return null;
    }
  }

  static void _handleForeground(RemoteMessage message) {
    // Data-only eval wake: fetch our own /me data and post a local notification.
    if (message.data['type'] == 'eval_wake') {
      EvalFetcher.fetchAndNotify();
      return;
    }
    final notification = message.notification;
    if (notification == null) return;

    final route = routeForNotificationData(message.data);
    _localNotifs.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'ft_intra_channel',
          'ft_intra Notifications',
          importance: Importance.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      payload: route == null ? null : routePayload(route),
    );
  }

  static void _handleOpenedApp(RemoteMessage message) {
    debugPrint('Notification tapped: ${message.data}');
    final route = routeForNotificationData(message.data);
    if (route != null) _onNavigate?.call(route);
  }
}
