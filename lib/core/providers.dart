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
  final api = ref.watch(apiClientProvider);
  return api.getMe();
});

final allCampusesProvider = FutureProvider<List<FtCampus>>((ref) async {
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
  final api = ref.watch(apiClientProvider);
  return api.getUser(login);
});

// Fetch every page of a scale_teams endpoint (capped for safety), newest first.
// [label] tags the verification logs so an empty list can be told apart from a
// scope/auth problem: a 0-count with no error == the `projects` scope is
// missing (the endpoint returns an empty array, not a 403).
Future<List<ScaleTeam>> _fetchAllScaleTeams(
  String label,
  Future<List<ScaleTeam>> Function(int page) page,
) async {
  final all = <ScaleTeam>[];
  try {
    for (var p = 1; p <= 30; p++) {
      final batch = await page(p);
      debugPrint('[evals] $label page $p → ${batch.length} item(s)');
      all.addAll(batch);
      if (batch.length < 100) break;
    }
  } catch (e) {
    debugPrint('[evals] $label FAILED: $e');
    rethrow;
  }
  all.sort((a, b) => b.beginAt.compareTo(a.beginAt));
  final past = all.where((t) => t.filledAt != null).length;
  debugPrint('[evals] $label total=${all.length} (past=$past, upcoming=${all.length - past})'
      '${all.isEmpty ? "  ← empty: scale_teams needs no scope, so the account has no records in this role" : ""}');
  return all;
}

// Logs the 42 token's actual granted scopes. scale_teams returns an empty
// array (HTTP 200, not 403) when `projects` is missing, so this disambiguates
// "no projects scope" from "account genuinely has no reviews". /oauth/token/info
// lives outside the /v2 base, so we use the raw (Bearer-injecting) Dio.
Future<void> _logTokenScopes(Dio dio) async {
  try {
    final r = await dio.get('https://api.intra.42.fr/oauth/token/info');
    final scopes = r.data is Map ? r.data['scopes'] : r.data;
    debugPrint('[evals] token scopes=$scopes '
        '${'$scopes'.contains('projects') ? '' : '← `projects` NOT granted (re-login / enable scope in 42 app)'}');
  } catch (e) {
    debugPrint('[evals] token scope check failed: $e');
  }
  // Decisive check: does the UNFILTERED /me/scale_teams return anything? If it
  // does while as_corrector/as_corrected are empty, the sub-routes are the
  // problem (switch to base + partition client-side); if it's also 0, the
  // account genuinely has no scale_teams. Raw dio avoids a retrofit regen.
  try {
    final r = await dio.get('https://api.intra.42.fr/v2/me/scale_teams',
        queryParameters: {'page[size]': 100});
    final n = r.data is List ? (r.data as List).length : -1;
    debugPrint('[evals] base /me/scale_teams (unfiltered) → $n item(s) '
        '${n > 0 ? "← sub-route issue: data exists but as_corrector/as_corrected are empty" : "← account truly has no scale_teams"}');
  } catch (e) {
    debugPrint('[evals] base /me/scale_teams check failed: $e');
  }
  // The "Feedbacks you made" page (projects.intra.42.fr/users/:login/feedbacks)
  // is the `feedbacks` resource, NOT scale_teams. There's no /me/feedbacks, so
  // fetch /me for the id then /v2/feedbacks?filter[user_id]=. Probe whether this
  // returns the records the user expects (past evaluations they authored).
  try {
    final me = await dio.get('https://api.intra.42.fr/v2/me');
    final uid = (me.data is Map) ? me.data['id'] : null;
    final fb = await dio.get('https://api.intra.42.fr/v2/feedbacks',
        queryParameters: {'filter[user_id]': '$uid', 'page[size]': 100});
    final list = fb.data is List ? fb.data as List : const [];
    debugPrint('[evals] feedbacks?filter[user_id]=$uid → ${list.length} item(s)');
    if (list.isNotEmpty) {
      final f = list.first as Map;
      debugPrint('[evals] feedback sample: type=${f['feedbackable_type']} '
          'rating=${f['rating']} created_at=${f['created_at']} '
          'comment=${'${f['comment']}'.length > 40 ? '${'${f['comment']}'.substring(0, 40)}…' : f['comment']}');
    }
  } catch (e) {
    debugPrint('[evals] feedbacks probe failed: $e');
  }
}

// All reviews where I was the Reviewer (corrector).
final reviewsAsReviewerProvider =
    FutureProvider.autoDispose<List<ScaleTeam>>((ref) async {
  final api = ref.watch(apiClientProvider);
  final list = await _fetchAllScaleTeams(
      'as_corrector', (p) => api.getScaleTeamsAsCorrector(page: p, pageSize: 100));
  if (list.isEmpty) await _logTokenScopes(ref.watch(dioProvider));
  return list;
});

// All reviews where I was the Reviewee (corrected).
final reviewsAsRevieweeProvider =
    FutureProvider.autoDispose<List<ScaleTeam>>((ref) async {
  final api = ref.watch(apiClientProvider);
  return _fetchAllScaleTeams(
      'as_corrected', (p) => api.getScaleTeamsAsCorrected(page: p, pageSize: 100));
});

// My evaluation availability slots (own slots; create/delete via ft_api_client).
final mySlotsProvider = FutureProvider.autoDispose<List<FtSlot>>((ref) async {
  final api = ref.watch(apiClientProvider);
  final slots = await api.getMySlots(pageSize: 100);
  // Soonest first.
  slots.sort((a, b) => a.beginAt.compareTo(b.beginAt));
  return slots;
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
  final db = ref.watch(databaseProvider);
  return db.watchAllNotifications();
});

// Watch friend list from local DB
final friendsStreamProvider = StreamProvider<List<Friend>>((ref) {
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

final geofenceEnabledProvider =
    StateNotifierProvider<GeofenceEnabledNotifier, bool>((ref) {
  return GeofenceEnabledNotifier();
});

class GeofenceEnabledNotifier extends StateNotifier<bool> {
  GeofenceEnabledNotifier() : super(false) {
    _load();
  }

  static const _key = 'checkin_geofence_enabled';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(_key) ?? false;
  }

  Future<void> setEnabled(bool enabled) async {
    state = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, enabled);
  }
}

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
  final backend = ref.watch(backendClientProvider);
  final campusId = ref.watch(selectedCampusIdProvider);
  return backend.listCheckins(campusId: campusId);
});
