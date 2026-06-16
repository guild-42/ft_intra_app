import 'package:ft_intra/core/models/user.dart';
import 'package:ft_intra/core/models/scale_team.dart';
import 'package:ft_intra/core/models/feedback.dart';
import 'package:ft_intra/core/models/slot.dart';
import 'package:ft_intra/core/models/campus.dart';
import 'package:ft_intra/core/models/event.dart';
import 'package:ft_intra/core/checkin/checkin_models.dart';
import 'package:ft_intra/core/db/app_database.dart';

/// Bundled sample data for demo mode. No real people — all logins are obvious
/// placeholders so screenshots/review are safe. Freezed models are built via
/// fromJson to stay in lock-step with their schemas.
class DemoData {
  DemoData._();

  static const int campusId = 26;

  static String _iso(Duration offset) =>
      DateTime.now().toUtc().add(offset).toIso8601String();

  static final FtUser user = FtUser.fromJson({
    'id': 1,
    'login': 'demo',
    'email': 'demo@example.com',
    'first_name': 'Demo',
    'last_name': 'User',
    'displayname': 'Demo User',
    'image': null,
    'correction_point': 12,
    'wallet': 420,
    'cursus_users': [
      {
        'id': 1,
        'begin_at': '2025-01-06T00:00:00.000Z',
        'blackholed_at': '2026-09-01T00:00:00.000Z',
        'level': 7.42,
        'cursus_id': 21,
        'cursus': {
          'id': 21,
          'name': '42cursus',
          'slug': '42cursus',
        },
      },
    ],
    'projects_users': [
      {
        'id': 1,
        'final_mark': 110,
        'status': 'finished',
        'validated?': true,
        'marked_at': '2025-03-10T10:00:00.000Z',
        'project': {'id': 1, 'name': 'Libft', 'slug': 'libft'},
        'cursus_ids': [21],
      },
      {
        'id': 2,
        'final_mark': 100,
        'status': 'finished',
        'validated?': true,
        'marked_at': '2025-05-20T10:00:00.000Z',
        'project': {'id': 2, 'name': 'get_next_line', 'slug': 'get_next_line'},
        'cursus_ids': [21],
      },
      {
        'id': 3,
        'final_mark': null,
        'status': 'in_progress',
        'validated?': null,
        'project': {'id': 3, 'name': 'minishell', 'slug': 'minishell'},
        'cursus_ids': [21],
      },
    ],
  });

  // Campus presence (login = has a cluster host; host null = check-in only).
  static final List<({int userId, String login, String? host})> presence = [
    (userId: 1, login: 'demo', host: 'c1r2p3'),
    (userId: 2, login: 'aurora', host: 'c2r1p5'),
    (userId: 3, login: 'mlopez', host: 'c1r4p8'),
    (userId: 4, login: 'ykim', host: null), // check-in only
    (userId: 5, login: 'tanaka', host: 'c3r2p1'),
  ];

  static final List<CheckedInUser> checkedInUsers = [
    CheckedInUser(
        userId: 1, login: 'demo', campusId: campusId, source: 'manual',
        checkedInAt: DateTime.now().subtract(const Duration(minutes: 40))),
    CheckedInUser(
        userId: 4, login: 'ykim', campusId: campusId, source: 'manual',
        checkedInAt: DateTime.now().subtract(const Duration(minutes: 15))),
  ];

  // Evaluation feedbacks the demo user authored (review history).
  static final List<FtFeedback> feedbacks = [
    FtFeedback.fromJson({
      'id': 101,
      'user_id': 1,
      'feedbackable_type': 'ScaleTeam',
      'feedbackable_id': 901,
      'comment': 'Clean code, clear explanation. Nice work!',
      'rating': 5,
      'created_at': _iso(const Duration(days: -3)),
    }),
    FtFeedback.fromJson({
      'id': 102,
      'user_id': 1,
      'feedbackable_type': 'ScaleTeam',
      'feedbackable_id': 902,
      'comment': 'Good defense, minor norm issues.',
      'rating': 4,
      'created_at': _iso(const Duration(days: -10)),
    }),
    FtFeedback.fromJson({
      'id': 103,
      'user_id': 1,
      'feedbackable_type': 'Event',
      'feedbackable_id': 701,
      'comment': 'Great meetup, thanks!',
      'rating': 5,
      'created_at': _iso(const Duration(days: -20)),
    }),
  ];

  // scale_team detail for the ScaleTeam feedbacks above (for project/peer).
  static final Map<int, ScaleTeam> scaleTeams = {
    901: ScaleTeam.fromJson({
      'id': 901,
      'scale_id': 1,
      'begin_at': _iso(const Duration(days: -3)),
      'filled_at': _iso(const Duration(days: -3)),
      'final_mark': 110,
      'corrector': {'id': 1, 'login': 'demo', 'url': ''},
      'correcteds': [
        {'id': 2, 'login': 'aurora', 'url': ''}
      ],
      'team': {'id': 1, 'name': 'Libft', 'project_id': 1, 'final_mark': 110},
    }),
    902: ScaleTeam.fromJson({
      'id': 902,
      'scale_id': 1,
      'begin_at': _iso(const Duration(days: -10)),
      'filled_at': _iso(const Duration(days: -10)),
      'final_mark': 100,
      // demo was the corrected here (peer reviewed demo).
      'corrector': {'id': 3, 'login': 'mlopez', 'url': ''},
      'correcteds': [
        {'id': 1, 'login': 'demo', 'url': ''}
      ],
      'team': {
        'id': 2,
        'name': 'get_next_line',
        'project_id': 2,
        'final_mark': 100
      },
    }),
  };

  static final List<FtSlot> slots = [
    FtSlot.fromJson({
      'id': 1,
      'begin_at': _iso(const Duration(days: 1, hours: 2)),
      'end_at': _iso(const Duration(days: 1, hours: 2, minutes: 30)),
      'scale_team': {'id': 950},
      'user': null,
    }),
    FtSlot.fromJson({
      'id': 2,
      'begin_at': _iso(const Duration(days: 2)),
      'end_at': _iso(const Duration(days: 2, minutes: 30)),
      'scale_team': null,
      'user': null,
    }),
  ];

  static final List<FtEvent> events = [
    FtEvent.fromJson({
      'id': 701,
      'name': 'Piscine meetup',
      'kind': 'meet_up',
      'max_people': 50,
      'nbr_subscribers': 23,
      'begin_at': _iso(const Duration(days: 3)),
      'end_at': _iso(const Duration(days: 3, hours: 2)),
      'campus_ids': [campusId],
      'description': 'Come meet other students and share tips.',
      'location': 'Cluster 1',
    }),
    FtEvent.fromJson({
      'id': 702,
      'name': 'Rush kickoff',
      'kind': 'rush',
      'max_people': 120,
      'nbr_subscribers': 88,
      'begin_at': _iso(const Duration(days: 7)),
      'end_at': _iso(const Duration(days: 9)),
      'campus_ids': [campusId],
      'description': 'Weekend team rush.',
      'location': 'Main hall',
    }),
  ];

  static final List<FtCampus> campuses = [
    FtCampus.fromJson(
        {'id': campusId, 'name': 'Tokyo', 'time_zone': 'Asia/Tokyo'}),
  ];

  static List<Friend> friends() => [
        Friend(
          userId: 2,
          login: 'aurora',
          displayName: 'Aurora B.',
          nickname: null,
          level: 9.1,
          blackholedAt: null,
          discordDmUrl: null,
          addedAt: DateTime.now().subtract(const Duration(days: 30)),
          lastSeenLocation: 'c2r1p5',
          lastSeenAt: DateTime.now().subtract(const Duration(minutes: 5)),
          notifyEnabled: true,
        ),
        Friend(
          userId: 4,
          login: 'ykim',
          displayName: 'Y. Kim',
          nickname: 'kim',
          level: 6.3,
          blackholedAt: '2026-08-01T00:00:00.000Z',
          discordDmUrl: null,
          addedAt: DateTime.now().subtract(const Duration(days: 12)),
          lastSeenLocation: null,
          lastSeenAt: DateTime.now().subtract(const Duration(hours: 6)),
          notifyEnabled: false,
        ),
      ];

  static List<IntraNotification> notifications() => [
        IntraNotification(
          id: 1,
          signature: 'demo1',
          title: 'Evaluation points sale',
          body: '50% off evaluation points today only!',
          sourceDate: null,
          detectedAt: DateTime.now().subtract(const Duration(hours: 1)),
          isRead: false,
        ),
        IntraNotification(
          id: 2,
          signature: 'demo2',
          title: 'New event: Piscine meetup',
          body: 'Join us in cluster 1 this weekend.',
          sourceDate: null,
          detectedAt: DateTime.now().subtract(const Duration(days: 1)),
          isRead: true,
        ),
      ];
}
