import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ft_intra/config/constants.dart';
import 'package:ft_intra/core/api/ipv4_http.dart';
import 'package:ft_intra/core/checkin/checkin_models.dart';

class BackendClient {
  final Dio _dio;

  BackendClient({Dio? dio}) : _dio = dio ?? _defaultDio();

  // Explicit timeouts (Dio defaults to none → a stalled connection hangs the
  // caller forever) + IPv4-preferred connections to avoid intermittent
  // timeouts on networks with a broken IPv6 path.
  static Dio _defaultDio() {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 40),
    ));
    applyIpv4Preference(dio);
    return dio;
  }

  /// Register the device for notifications. [accessToken] is sent only so the
  /// backend can verify identity (GET /v2/me); it is NOT stored server-side —
  /// the 42 token never leaves the device (doc_v2/10). No cookie is sent.
  Future<bool> register({
    required String accessToken,
    required String fcmToken,
    required String platform,
    required String language,
    bool prefEvalpo = true,
    bool prefEvent = true,
    bool prefReview = true,
    bool prefFriend = true,
    List<int> friendWatchIds = const [],
    String? consentVersion,
    DateTime? consentedAt,
  }) async {
    try {
      await _dio.post(
        '${FtConstants.backendBaseUrl}/api/register',
        data: {
          'fcm_token': fcmToken,
          'platform': platform,
          'language': language,
          'access_token': accessToken,
          'pref_evalpo': prefEvalpo,
          'pref_event': prefEvent,
          'pref_review': prefReview,
          'pref_friend': prefFriend,
          'friend_watch_ids': friendWatchIds,
          if (consentVersion != null) 'consent_version': consentVersion,
          if (consentedAt != null) 'consented_at': consentedAt.toIso8601String(),
        },
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Event-notification history the server pushed (public campus events). The
  /// returned maps have `title`, `body`, `source_date`, `signature`.
  Future<List<Map<String, dynamic>>> listNotifications({
    int page = 1,
    int perPage = 50,
  }) async {
    try {
      final resp = await _dio.get(
        '${FtConstants.backendBaseUrl}/api/notifications',
        queryParameters: {'page': page, 'per_page': perPage},
      );
      final data = resp.data;
      final items = (data is Map && data['items'] is List)
          ? data['items'] as List
          : const [];
      return items
          .whereType<Map>()
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  /// Delete the caller's server-side registration (device doc). [accessToken]
  /// proves device ownership: the backend verifies it against /v2/me and only
  /// deletes when the verified 42 user owns [fcmToken]'s device (anti-IDOR).
  Future<bool> deleteCredential({
    required String fcmToken,
    required String accessToken,
  }) async {
    try {
      await _dio.delete(
        '${FtConstants.backendBaseUrl}/api/credentials',
        data: {
          'fcm_token': fcmToken,
          'access_token': accessToken,
        },
      );
      return true;
    } catch (e) {
      // Don't swallow silently: the UI only shows a generic "failed" snackbar,
      // so without this the real cause is invisible. 404 = endpoint not deployed,
      // 422 = body stripped in transit, 401 = access_token invalid/expired.
      debugPrint('deleteCredential failed: $e');
      if (e is DioException) {
        debugPrint('  type=${e.type} status=${e.response?.statusCode} '
            'data=${e.response?.data}');
      }
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

  // ───── Mutual friends (doc_v2/10 Phase D) ─────
  //
  // A friendship needs both parties' consent (request → accept) before the
  // server watches presence. [accessToken] proves identity on every call.

  /// Send a friend request to [targetLogin]. Returns the resulting status
  /// ('pending' | 'accepted' | 'already_friends'), or null on failure.
  Future<String?> requestFriend({
    required String accessToken,
    required String targetLogin,
  }) async {
    try {
      final resp = await _dio.post(
        '${FtConstants.backendBaseUrl}/api/friends/request',
        data: {'access_token': accessToken, 'target_login': targetLogin},
      );
      final data = resp.data;
      return data is Map ? data['status'] as String? : null;
    } catch (e) {
      debugPrint('requestFriend failed: $e');
      return null;
    }
  }

  /// Accept or decline an incoming request from [otherUserId] (or, as the
  /// requester, cancel by passing accept=false).
  Future<bool> respondFriend({
    required String accessToken,
    required int otherUserId,
    required bool accept,
  }) async {
    try {
      await _dio.post(
        '${FtConstants.backendBaseUrl}/api/friends/respond',
        data: {
          'access_token': accessToken,
          'other_user_id': otherUserId,
          'accept': accept,
        },
      );
      return true;
    } catch (e) {
      debugPrint('respondFriend failed: $e');
      return false;
    }
  }

  /// The caller's friendships, split into `incoming` / `outgoing` / `accepted`,
  /// each a list of `{user_id, login, status}`.
  Future<Map<String, List<Map<String, dynamic>>>> listFriends({
    required String accessToken,
  }) async {
    try {
      final resp = await _dio.post(
        '${FtConstants.backendBaseUrl}/api/friends/list',
        data: {'access_token': accessToken},
      );
      final data = resp.data;
      List<Map<String, dynamic>> pick(String k) =>
          (data is Map && data[k] is List)
              ? (data[k] as List)
                  .whereType<Map>()
                  .map((e) => Map<String, dynamic>.from(e))
                  .toList()
              : const [];
      return {
        'incoming': pick('incoming'),
        'outgoing': pick('outgoing'),
        'accepted': pick('accepted'),
      };
    } catch (e) {
      debugPrint('listFriends failed: $e');
      return const {'incoming': [], 'outgoing': [], 'accepted': []};
    }
  }

  /// Remove an accepted friendship with [otherUserId].
  Future<bool> deleteFriend({
    required String accessToken,
    required int otherUserId,
  }) async {
    try {
      await _dio.delete(
        '${FtConstants.backendBaseUrl}/api/friends',
        data: {'access_token': accessToken, 'other_user_id': otherUserId},
      );
      return true;
    } catch (e) {
      debugPrint('deleteFriend failed: $e');
      return false;
    }
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
