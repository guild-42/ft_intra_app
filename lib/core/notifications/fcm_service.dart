import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ft_intra/core/checkin/checkin_notifications.dart';
import 'package:ft_intra/core/checkin/geofence_callbacks.dart';

class FcmService {
  static final FlutterLocalNotificationsPlugin _localNotifs =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    if (kIsWeb) return;

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
    await initCheckinNotifications(
      onForeground: checkinNotificationForegroundHandler,
      onBackground: checkinNotificationBackgroundHandler,
    );

    FirebaseMessaging.onMessage.listen(_handleForeground);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleOpenedApp);
  }

  static Future<String?> getToken() async {
    if (kIsWeb) return null;
    return await FirebaseMessaging.instance.getToken();
  }

  static void _handleForeground(RemoteMessage message) {
    final notification = message.notification;
    if (notification == null) return;

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
    );
  }

  static void _handleOpenedApp(RemoteMessage message) {
    debugPrint('Notification tapped: ${message.data}');
  }
}
