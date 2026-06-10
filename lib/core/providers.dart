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
  dio.interceptors.addAll([
    AuthInterceptor(ref.watch(tokenStorageProvider)),
    RateLimitInterceptor(),
  ]);
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
Future<List<ScaleTeam>> _fetchAllScaleTeams(
  Future<List<ScaleTeam>> Function(int page) page,
) async {
  final all = <ScaleTeam>[];
  for (var p = 1; p <= 30; p++) {
    final batch = await page(p);
    all.addAll(batch);
    if (batch.length < 100) break;
  }
  all.sort((a, b) => b.beginAt.compareTo(a.beginAt));
  return all;
}

// All reviews where I was the Reviewer (corrector).
final reviewsAsReviewerProvider =
    FutureProvider.autoDispose<List<ScaleTeam>>((ref) async {
  final api = ref.watch(apiClientProvider);
  return _fetchAllScaleTeams(
      (p) => api.getScaleTeamsAsCorrector(page: p, pageSize: 100));
});

// All reviews where I was the Reviewee (corrected).
final reviewsAsRevieweeProvider =
    FutureProvider.autoDispose<List<ScaleTeam>>((ref) async {
  final api = ref.watch(apiClientProvider);
  return _fetchAllScaleTeams(
      (p) => api.getScaleTeamsAsCorrected(page: p, pageSize: 100));
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
