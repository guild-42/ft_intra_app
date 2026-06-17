import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/core/api/backend_client.dart';
import 'package:ft_intra/core/api/ft_api_client.dart';
import 'package:ft_intra/core/auth/token_storage.dart';
import 'package:ft_intra/core/db/app_database.dart';
import 'package:ft_intra/core/demo/demo_mode.dart';
import 'package:ft_intra/core/notifications/fcm_service.dart';
import 'package:ft_intra/core/providers.dart';

/// A pending friend request (incoming or outgoing), as returned by the backend.
class FriendRequest {
  final int userId;
  final String login;
  const FriendRequest(this.userId, this.login);
}

class FriendRequests {
  final List<FriendRequest> incoming;
  final List<FriendRequest> outgoing;
  const FriendRequests({this.incoming = const [], this.outgoing = const []});
}

/// Mutual-friend coordination (doc_v2/10 Phase D).
///
/// Membership is authoritative on the backend (accepted friendships). This
/// service mirrors the accepted set into the local drift cache (for display
/// info + local-only nickname/discord/presence) and exposes the pending
/// incoming/outgoing requests for the UI. The 42 token only ever leaves the
/// device to the 42 API / to the backend for identity verification.
class FriendsService {
  FriendsService(this._backend, this._db, this._api, this._tokens);

  final BackendClient _backend;
  final AppDatabase _db;
  final FtApiClient _api;
  final TokenStorage _tokens;

  /// Pull the backend friendship graph, reconcile the local accepted cache, and
  /// return the pending requests. Local nickname / discord / presence rows are
  /// preserved for friends that remain accepted.
  Future<FriendRequests> sync() async {
    final token = await _tokens.getAccessToken();
    if (token == null) return const FriendRequests();
    final lists = await _backend.listFriends(accessToken: token);
    final accepted = lists['accepted'] ?? const [];
    final acceptedIds = accepted.map((e) => e['user_id'] as int).toSet();

    // Drop local rows that are no longer accepted (the other party unfriended).
    final local = await _db.getAllFriends();
    for (final f in local) {
      if (!acceptedIds.contains(f.userId)) {
        await _db.removeFriend(f.userId);
      }
    }
    // Cache display info for newly-accepted friends we don't have locally yet.
    final localIds = local.map((f) => f.userId).toSet();
    for (final a in accepted) {
      final uid = a['user_id'] as int;
      if (localIds.contains(uid)) continue;
      await _cacheFriend(a['login'] as String);
    }

    // Reflect the current per-friend notify set on the backend.
    await syncWatchIds();

    FriendRequest toReq(Map<String, dynamic> e) =>
        FriendRequest(e['user_id'] as int, e['login'] as String);
    return FriendRequests(
      incoming: (lists['incoming'] ?? const []).map(toReq).toList(),
      outgoing: (lists['outgoing'] ?? const []).map(toReq).toList(),
    );
  }

  /// Toggle login push for one accepted friend, then push the updated watch
  /// list to the backend (the friend poller only notifies friends on this list).
  Future<void> toggleNotify(int friendUserId, bool enabled) async {
    await _db.setFriendNotify(friendUserId, enabled);
    await syncWatchIds();
  }

  /// Send the device's current friend watch list (notify-enabled friend ids) to
  /// the backend. No-op if the device isn't registered for notifications.
  Future<void> syncWatchIds() async {
    final fcm = await FcmService.getToken();
    if (fcm == null) return;
    final ids = await _db.getFriendWatchIds();
    await _backend.updatePreferences(fcmToken: fcm, friendWatchIds: ids);
  }

  Future<void> _cacheFriend(String login) async {
    try {
      final user = await _api.getUser(login);
      final main = user.cursusUsers.firstWhere(
        (c) => c.cursus?.slug == '42cursus',
        orElse: () => user.cursusUsers.isNotEmpty
            ? user.cursusUsers.last
            : throw Exception('no cursus'),
      );
      await _db.addFriend(
        userId: user.id,
        login: user.login,
        displayName: user.displayName,
        imageUrl: user.image?.versions?.medium ?? user.image?.link,
        level: main.level,
        blackholedAt: main.blackholedAt,
      );
      // A newly-accepted friend gets login alerts by default (pref_friend still
      // gates it globally); the user can mute per-friend in the list.
      await _db.setFriendNotify(user.id, true);
    } catch (e) {
      debugPrint('FriendsService._cacheFriend($login) failed: $e');
    }
  }

  /// Send a friend request by 42 login. Returns the backend status
  /// ('pending' | 'accepted' | 'already_friends'), or null on failure.
  Future<String?> request(String login) async {
    final token = await _tokens.getAccessToken();
    if (token == null) return null;
    return _backend.requestFriend(accessToken: token, targetLogin: login);
  }

  Future<bool> respond(int otherUserId, bool accept) async {
    final token = await _tokens.getAccessToken();
    if (token == null) return false;
    return _backend.respondFriend(
        accessToken: token, otherUserId: otherUserId, accept: accept);
  }

  Future<bool> remove(int otherUserId) async {
    final token = await _tokens.getAccessToken();
    if (token == null) return false;
    final ok = await _backend.deleteFriend(
        accessToken: token, otherUserId: otherUserId);
    if (ok) await _db.removeFriend(otherUserId);
    return ok;
  }
}

final friendsServiceProvider = Provider<FriendsService>((ref) {
  return FriendsService(
    ref.watch(backendClientProvider),
    ref.watch(databaseProvider),
    ref.watch(apiClientProvider),
    ref.watch(tokenStorageProvider),
  );
});

/// Syncs with the backend and exposes the pending requests. Invalidate to
/// refresh after request/accept/decline.
final friendRequestsProvider = FutureProvider<FriendRequests>((ref) async {
  if (ref.watch(demoModeProvider)) return const FriendRequests();
  return ref.watch(friendsServiceProvider).sync();
});
