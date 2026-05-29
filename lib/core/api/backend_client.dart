import 'package:dio/dio.dart';
import 'package:ft_intra/config/constants.dart';
import 'package:ft_intra/core/checkin/checkin_models.dart';

class BackendClient {
  final Dio _dio;

  BackendClient({Dio? dio}) : _dio = dio ?? Dio();

  Future<bool> register({
    required String accessToken,
    required String fcmToken,
    required String cookie,
    required String platform,
    required String language,
    bool prefEvalpo = true,
    bool prefEvent = true,
    bool prefReview = true,
    bool prefFriend = true,
    List<int> friendWatchIds = const [],
  }) async {
    try {
      await _dio.post(
        '${FtConstants.backendBaseUrl}/api/register',
        data: {
          'fcm_token': fcmToken,
          'platform': platform,
          'language': language,
          'access_token': accessToken,
          'cookie': cookie,
          'pref_evalpo': prefEvalpo,
          'pref_event': prefEvent,
          'pref_review': prefReview,
          'pref_friend': prefFriend,
          'friend_watch_ids': friendWatchIds,
        },
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Lightweight preference update (no full re-register / no 42 token check).
  /// Keyed by [fcmToken] on the backend. Send only the fields you want to set;
  /// nulls are omitted so the backend keeps existing values.
  Future<bool> updatePreferences({
    required String fcmToken,
    bool? prefEvalpo,
    bool? prefEvent,
    bool? prefReview,
    bool? prefFriend,
    List<int>? friendWatchIds,
  }) async {
    try {
      await _dio.post(
        '${FtConstants.backendBaseUrl}/api/preferences',
        data: {
          'fcm_token': fcmToken,
          if (prefEvalpo != null) 'pref_evalpo': prefEvalpo,
          if (prefEvent != null) 'pref_event': prefEvent,
          if (prefReview != null) 'pref_review': prefReview,
          if (prefFriend != null) 'pref_friend': prefFriend,
          if (friendWatchIds != null) 'friend_watch_ids': friendWatchIds,
        },
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> updateCookie({
    required String accessToken,
    required String fcmToken,
    required String cookie,
  }) async {
    return register(
      accessToken: accessToken,
      fcmToken: fcmToken,
      cookie: cookie,
      platform: 'ios',
      language: 'en',
    );
  }

  // ───── Location-based check-in ─────
  //
  // The backend verifies [accessToken] against /v2/me and ties the check-in to
  // that verified 42 identity (anti-impersonation). The caller never asserts a
  // login itself.

  /// Mark the current user checked in at [campusId]. Idempotent server-side.
  Future<bool> checkIn({
    required String accessToken,
    required int campusId,
  }) async {
    try {
      await _dio.post(
        '${FtConstants.backendBaseUrl}/api/checkin',
        data: {'access_token': accessToken, 'campus_id': campusId},
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Mark the current user checked out of [campusId].
  Future<bool> checkOut({
    required String accessToken,
    required int campusId,
  }) async {
    try {
      await _dio.post(
        '${FtConstants.backendBaseUrl}/api/checkout',
        data: {'access_token': accessToken, 'campus_id': campusId},
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Refresh the active check-in's expiry (called on app foreground).
  Future<bool> heartbeat({required String accessToken}) async {
    try {
      await _dio.post(
        '${FtConstants.backendBaseUrl}/api/checkin/heartbeat',
        data: {'access_token': accessToken},
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Everyone currently checked in at [campusId] (for the Campus tab).
  Future<List<CheckedInUser>> listCheckins({required int campusId}) async {
    final resp = await _dio.get(
      '${FtConstants.backendBaseUrl}/api/checkins',
      queryParameters: {'campus_id': campusId},
    );
    final data = resp.data;
    final list = (data is Map && data['checkins'] is List)
        ? data['checkins'] as List
        : const [];
    return list
        .whereType<Map>()
        .map((e) => CheckedInUser.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
