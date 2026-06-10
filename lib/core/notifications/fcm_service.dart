import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ft_intra/core/checkin/checkin_notifications.dart';
import 'package:ft_intra/core/checkin/geofence_callbacks.dart';
import 'package:ft_intra/core/notifications/notification_router.dart';

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

    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    const initSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _localNotifs.initialize(initSettings);

    // Registered last so its background action handler wins (the FCM init above
    // passes none). Drives the location check-in "Check in" notification action.
    // The foreground wrapper also routes taps on locally re-shown FCM
    // notifications (the plugin allows only one tap handler per isolate).
    await initCheckinNotifications(
      onForeground: (response) {
        checkinNotificationForegroundHandler(response);
        final route = routeFromPayload(response.payload);
        if (route != null) _onNavigate?.call(route);
      },
      onBackground: checkinNotificationBackgroundHandler,
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
