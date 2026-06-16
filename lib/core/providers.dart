import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ft_intra/core/auth/token_storage.dart';
import 'package:ft_intra/core/auth/auth_service.dart';
import 'package:ft_intra/core/api/ft_api_client.dart';
import 'package:ft_intra/core/api/auth_interceptor.dart';
import 'package:ft_intra/core/api/rate_limit_interceptor.dart';
import 'package:ft_intra/core/api/connection_retry_interceptor.dart';
import 'package:ft_intra/core/api/backend_client.dart';
import 'package:ft_intra/core/api/ipv4_http.dart';
import 'package:ft_intra/core/models/user.dart';
import 'package:ft_intra/core/models/location.dart';
import 'package:ft_intra/core/models/scale_team.dart';
import 'package:ft_intra/core/models/feedback.dart';
import 'package:ft_intra/core/models/slot.dart';
import 'package:ft_intra/core/models/campus.dart';
import 'package:ft_intra/core/notifications/notification_preferences.dart';
import 'package:ft_intra/config/constants.dart';
import 'package:ft_intra/core/db/app_database.dart';
import 'package:ft_intra/core/notifications/notification_scraper.dart';
import 'package:ft_intra/core/friends/friend_watcher.dart';
import 'package:ft_intra/core/users/user_cache_service.dart';
import 'package:ft_intra/core/checkin/checkin_service.dart';
import 'package:ft_intra/core/checkin/checkin_state.dart';
import 'package:ft_intra/core/checkin/checkin_models.dart';
import 'package:ft_intra/core/demo/demo_mode.dart';
import 'package:ft_intra/core/demo/demo_data.dart';
import 'package:ft_intra/l10n/strings.dart';

final tokenStorageProvider = Provider<TokenStorage>(
  (_) => TokenStorage(),
);

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(tokenStorage: ref.watch(tokenStorageProvider));
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 40),
  ));
  applyIpv4Preference(dio);
  final auth = AuthInterceptor(ref.watch(tokenStorageProvider))
    ..retryDio = dio;
  final rateLimit = RateLimitInterceptor()..retryDio = dio;
  final connRetry = ConnectionRetryInterceptor()..retryDio = dio;
  dio.interceptors.addAll([auth, rateLimit, connRetry]);
  return dio;
});

final apiClientProvider = Provider<FtApiClient>((ref) {
  return FtApiClient(ref.watch(dioProvider));
});

final currentUserProvider = FutureProvider<FtUser>((ref) async {
  if (ref.watch(demoModeProvider)) return DemoData.user;
  final api = ref.watch(apiClientProvider);
  return api.getMe();
});

final allCampusesProvider = FutureProvider<List<FtCampus>>((ref) async {
  if (ref.watch(demoModeProvider)) return DemoData.campuses;
  final api = ref.watch(apiClientProvider);
  final list = await api.getCampuses();
  list.sort((a, b) => a.name.compareTo(b.name));
  return list;
});

final selectedCampusIdProvider =
    StateNotifierProvider<SelectedCampusNotifier, int>((ref) {
  return SelectedCampusNotifier();
});

class SelectedCampusNotifier extends StateNotifier<int> {
  SelectedCampusNotifier() : super(FtConstants.campusIdTokyo) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getInt('selected_campus_id') ?? FtConstants.campusIdTokyo;
  }

  Future<void> setCampus(int id) async {
    state = id;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected_campus_id', id);
  }
}

// NOT autoDispose: keep cache across tab switches.
// Invalidate explicitly via pull-to-refresh.
final campusLocationsProvider = FutureProvider<List<FtLocation>>((ref) async {
  final api = ref.watch(apiClientProvider);
  final campusId = ref.watch(selectedCampusIdProvider);
  final locations = await api.getCampusLocations(
    campusId,
    active: true,
    pageSize: 100,
  );
  // Sort by begin_at desc (newest first)
  locations.sort((a, b) => b.beginAt.compareTo(a.beginAt));

  debugPrint('[campusLocations] fetched ${locations.length} active locations '
      'for campus $campusId');

  // Background-fetch user details for caching (don't block UI)
  Future.microtask(() async {
    final cache = ref.read(userCacheServiceProvider);
    await cache.ensureCached(locations.map((l) => l.user.id).toList());
  });

  return locations;
});

final userCacheServiceProvider = Provider<UserCacheService>((ref) {
  return UserCacheService(
    db: ref.watch(databaseProvider),
    api: ref.watch(apiClientProvider),
  );
});

// Watches the entire cached_users table once. Returning a Map<int, CachedUser>
// means the campus tabs don't have to pass the locations' user IDs in as a
// family key (List<int> equality is identity-based, which was causing the
// stream subscription to churn on every rebuild).
final cachedUsersMapProvider = StreamProvider<Map<int, CachedUser>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchAllCachedUsers().map(
        (rows) => {for (final r in rows) r.userId: r},
      );
});

final userDetailProvider =
    FutureProvider.family<FtUser, String>((ref, login) async {
  if (ref.watch(demoModeProvider)) return DemoData.user;
  // Tapping yourself in the campus list shouldn't trigger a second heavy
  // /users/:login fetch — /me (already warmed at startup) is the same user and
  // is richer. Reuse it so self-detail opens instantly.
  final me = ref.read(currentUserProvider).asData?.value;
  if (me != null && me.login == login) return me;
  final api = ref.watch(apiClientProvider);
  return api.getUser(login);
});

// Evaluation history = the `feedbacks` the user authored (the
// projects.intra.42.fr "Feedbacks you made" page). NOTE: this account's
// /me/scale_teams is empty (legacy eval data isn't in the v2 scale_teams /me
// view), so feedbacks — not scale_teams — is the real source. There is no
// /me/feedbacks endpoint, so we resolve the user id then filter[user_id].
final myFeedbacksProvider =
    FutureProvider.autoDispose<List<FtFeedback>>((ref) async {
  if (ref.watch(demoModeProvider)) return DemoData.feedbacks;
  final dio = ref.watch(dioProvider);
  final me = await ref.watch(currentUserProvider.future);
  final all = <FtFeedback>[];
  for (var p = 1; p <= 20; p++) {
    final r = await dio.get(
      'https://api.intra.42.fr/v2/feedbacks',
      queryParameters: {
        'filter[user_id]': '${me.id}',
        'sort': '-created_at',
        'page[size]': 100,
        'page[number]': p,
      },
    );
    final batch = (r.data as List).cast<Map<String, dynamic>>();
    all.addAll(batch.map(FtFeedback.fromJson));
    if (batch.length < 100) break;
  }
  return all;
});

// One enriched evaluation history row: the feedback joined with its scale_team
// (when resolvable), exposing my role (reviewer vs reviewee), the counterpart,
// the project and the date.
class EvalRecord {
  final FtFeedback feedback;
  final ScaleTeam? team; // null for Event feedbacks or if the join failed
  final int myId;
  const EvalRecord(this.feedback, this.team, this.myId);

  bool get isEvent => !feedback.isScaleTeam;

  /// true = I was the corrector (I reviewed); false = I was corrected
  /// (I was reviewed); null = unknown (no scale_team resolved).
  bool? get iReviewed {
    final t = team;
    if (t == null) return null;
    final c = t.corrector;
    if (c is Map && c['id'] == myId) return true;
    if (t.correcteds.any((e) => e is Map && e['id'] == myId)) return false;
    return null;
  }

  String? get counterpartLogin {
    final t = team;
    if (t == null) return null;
    final r = iReviewed;
    if (r == true) {
      final c = t.correcteds.isNotEmpty ? t.correcteds.first : null;
      return c is Map ? c['login'] as String? : null;
    }
    if (r == false) {
      final c = t.corrector;
      return c is Map ? c['login'] as String? : null;
    }
    return null;
  }

  String? get project => team?.team?.name;
  int? get finalMark => team?.finalMark;
  DateTime? get date => feedback.createdAtLocal;
}

// Evaluation history: feedbacks I authored, each joined with its scale_team via
// a bulk filter[id] fetch (a few requests, not 53). The join yields project +
// counterpart + my role; if /v2/scale_teams is restricted for this account the
// rows still render with rating/comment/date.
final evalHistoryProvider =
    FutureProvider.autoDispose<List<EvalRecord>>((ref) async {
  if (ref.watch(demoModeProvider)) {
    return DemoData.feedbacks
        .map((f) => EvalRecord(
            f, DemoData.scaleTeams[f.feedbackableId], DemoData.user.id))
        .toList();
  }
  final dio = ref.watch(dioProvider);
  final me = await ref.watch(currentUserProvider.future);
  final feedbacks = await ref.watch(myFeedbacksProvider.future);

  final ids = feedbacks
      .where((f) => f.isScaleTeam && f.feedbackableId != null)
      .map((f) => f.feedbackableId!)
      .toSet()
      .toList();

  final teamById = <int, ScaleTeam>{};
  for (var i = 0; i < ids.length; i += 100) {
    final chunk = ids.sublist(i, (i + 100).clamp(0, ids.length));
    try {
      final r = await dio.get(
        'https://api.intra.42.fr/v2/scale_teams',
        queryParameters: {'filter[id]': chunk.join(','), 'page[size]': 100},
      );
      for (final m in (r.data as List).cast<Map<String, dynamic>>()) {
        final t = ScaleTeam.fromJson(m);
        teamById[t.id] = t;
      }
    } catch (e) {
      debugPrint('[evals] scale_teams bulk fetch failed: $e');
    }
  }
  debugPrint('[evals] enriched ${teamById.length}/${ids.length} scale_teams');

  return feedbacks
      .map((f) => EvalRecord(f, teamById[f.feedbackableId], me.id))
      .toList();
});

// My evaluation availability slots (own slots; create/delete via ft_api_client).
final mySlotsProvider = FutureProvider.autoDispose<List<FtSlot>>((ref) async {
  if (ref.watch(demoModeProvider)) return DemoData.slots;
  final api = ref.watch(apiClientProvider);
  final slots = await api.getMySlots(pageSize: 100);
  // Soonest first.
  slots.sort((a, b) => a.beginAt.compareTo(b.beginAt));
  return slots;
});

// Upcoming review schedule = my slots whose start is still in the future,
// soonest first (booked ones carry a scale_team).
final upcomingSlotsProvider = FutureProvider.autoDispose<List<FtSlot>>((ref) async {
  final slots = await ref.watch(mySlotsProvider.future);
  final now = DateTime.now();
  return slots
      .where((s) => (DateTime.tryParse(s.beginAt) ?? now).isAfter(now))
      .toList();
});

// Per-type push notification preferences (persisted in SharedPreferences,
// synced to backend pref_* fields).
final notificationPreferencesProvider = StateNotifierProvider<
    NotificationPreferencesNotifier, NotificationPreferences>((ref) {
  return NotificationPreferencesNotifier();
});

// Database
final databaseProvider = Provider<AppDatabase>((_) => AppDatabase());

// Backend
final backendClientProvider = Provider<BackendClient>((_) => BackendClient());

// Notification scraper
final notificationScraperProvider = Provider<NotificationScraper>(
  (_) => NotificationScraper(),
);

// Watch notifications from local DB
final notificationsStreamProvider = StreamProvider<List<IntraNotification>>((ref) {
  if (ref.watch(demoModeProvider)) {
    return Stream.value(DemoData.notifications());
  }
  final db = ref.watch(databaseProvider);
  return db.watchAllNotifications();
});

// Watch friend list from local DB
final friendsStreamProvider = StreamProvider<List<Friend>>((ref) {
  if (ref.watch(demoModeProvider)) return Stream.value(DemoData.friends());
  final db = ref.watch(databaseProvider);
  return db.watchAllFriends();
});

// Friend watcher (polls campus locations periodically while app is open)
final friendWatcherProvider = Provider<FriendWatcher>((ref) {
  final watcher = FriendWatcher(
    db: ref.watch(databaseProvider),
    api: ref.watch(apiClientProvider),
    getCampusId: () => ref.read(selectedCampusIdProvider),
  );
  ref.onDispose(watcher.stop);
  return watcher;
});

// Locale
final localeProvider = StateNotifierProvider<LocaleNotifier, String>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<String> {
  LocaleNotifier() : super('en') {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getString('app_locale') ?? 'en';
  }

  Future<void> setLocale(String locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_locale', locale);
  }
}

final stringsProvider = Provider<AppStrings>((ref) {
  final locale = ref.watch(localeProvider);
  return AppStrings(locale);
});

// ───── Location-based check-in ─────

final checkinServiceProvider = Provider<CheckinService>((_) => CheckinService());

// Local check-in snapshot for the current user (optimistic mirror of backend).
final checkinStatusProvider =
    StateNotifierProvider<CheckinStatusNotifier, CheckinSnapshot>((ref) {
  return CheckinStatusNotifier();
});

class CheckinStatusNotifier extends StateNotifier<CheckinSnapshot> {
  CheckinStatusNotifier()
      : super(const CheckinSnapshot(isCheckedIn: false)) {
    refresh();
  }

  Future<void> refresh() async {
    state = await CheckinLocalState.read();
  }
}

// Everyone currently checked in at the selected campus (authoritative backend
// list, separate from campusLocationsProvider which reflects ubuntu sessions).
final checkedInUsersProvider =
    FutureProvider.autoDispose<List<CheckedInUser>>((ref) async {
  if (ref.watch(demoModeProvider)) return DemoData.checkedInUsers;
  final backend = ref.watch(backendClientProvider);
  final campusId = ref.watch(selectedCampusIdProvider);
  return backend.listCheckins(campusId: campusId);
});

// One person's campus presence, merged across the two sources. host == null
// means "checked in via geofence but not logged in at a workstation" — the UI
// shows a check-in badge instead of a cluster name.
class CampusPresence {
  final int userId;
  final String login;
  final String? host;
  const CampusPresence({required this.userId, required this.login, this.host});
  bool get isCheckinOnly => host == null;
}

// Merged, de-duplicated campus presence: ubuntu logins (with a cluster host)
// take priority over geofence check-ins, so anyone both logged in AND checked
// in shows once, as a login. Check-in-only users are appended.
final campusPresenceProvider =
    FutureProvider.autoDispose<List<CampusPresence>>((ref) async {
  if (ref.watch(demoModeProvider)) {
    return DemoData.presence
        .map((e) =>
            CampusPresence(userId: e.userId, login: e.login, host: e.host))
        .toList();
  }
  final locations = await ref.watch(campusLocationsProvider.future);
  final checkins = await ref.watch(checkedInUsersProvider.future);
  final byId = <int, CampusPresence>{};
  for (final l in locations) {
    byId[l.user.id] =
        CampusPresence(userId: l.user.id, login: l.user.login, host: l.host);
  }
  for (final c in checkins) {
    byId.putIfAbsent(
        c.userId, () => CampusPresence(userId: c.userId, login: c.login));
  }
  // Check-in-only users aren't in the locations list, so campusLocationsProvider
  // never cached their avatar — cache the full presence set so their photos
  // show too (ensureCached skips already-cached ids).
  Future.microtask(() async {
    await ref.read(userCacheServiceProvider).ensureCached(byId.keys.toList());
  });
  return byId.values.toList();
});

// User ids currently checked in (for friend-list presence cross-reference).
final checkedInIdsProvider = FutureProvider.autoDispose<Set<int>>((ref) async {
  final checkins = await ref.watch(checkedInUsersProvider.future);
  return {for (final c in checkins) c.userId};
});
