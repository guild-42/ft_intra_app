import 'package:flutter_test/flutter_test.dart';
import 'package:ft_intra/core/notifications/notification_router.dart';

void main() {
  group('routeForNotificationData', () {
    test('review push opens evaluations', () {
      expect(
        routeForNotificationData({'type': 'review', 'scale_team_id': '123'}),
        '/evaluations',
      );
    });

    test('evalpo sale and new event open notifications', () {
      expect(
        routeForNotificationData({'type': 'evalpo_sale', 'source_date': ''}),
        '/notifications',
      );
      expect(
        routeForNotificationData({'type': 'new_event', 'source_date': ''}),
        '/notifications',
      );
    });

    test('friend online opens campus', () {
      expect(
        routeForNotificationData({'type': 'friend_online', 'user_id': '1'}),
        '/campus',
      );
    });

    test('unknown or missing type routes nowhere', () {
      expect(routeForNotificationData({'type': 'mystery'}), isNull);
      expect(routeForNotificationData({}), isNull);
    });
  });

  group('route payload round-trip', () {
    test('encodes and decodes a route', () {
      expect(routeFromPayload(routePayload('/evaluations')), '/evaluations');
    });

    test('rejects non-route payloads (e.g. checkin campus id)', () {
      expect(routeFromPayload('26'), isNull);
      expect(routeFromPayload(null), isNull);
    });
  });
}
