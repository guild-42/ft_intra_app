/// Maps an FCM push `data` payload to the in-app route the tap should open.
///
/// Payload contract (backend pollers):
///   review_poller    → {"type": "review", "scale_team_id": "..."}
///   notification_poller → {"type": "evalpo_sale" | "new_event", "source_date": "..."}
///   friend_poller    → {"type": "friend_online", "user_id": "..."}
String? routeForNotificationData(Map<String, dynamic> data) {
  switch (data['type']) {
    case 'review':
      return '/evaluations';
    case 'evalpo_sale':
    case 'new_event':
      return '/notifications';
    case 'friend_online':
      return '/campus';
    default:
      return null;
  }
}

/// Prefix used to smuggle a route through a local-notification payload string
/// (foreground FCM messages are re-shown as local notifications, whose tap
/// callback only carries a string payload).
const String routePayloadPrefix = 'route:';

String routePayload(String route) => '$routePayloadPrefix$route';

String? routeFromPayload(String? payload) {
  if (payload == null || !payload.startsWith(routePayloadPrefix)) return null;
  return payload.substring(routePayloadPrefix.length);
}
