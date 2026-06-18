import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/core/api/backend_client.dart';
import 'package:ft_intra/core/api/ft_api_client.dart';
import 'package:ft_intra/core/auth/token_storage.dart';
import 'package:ft_intra/core/db/app_database.dart';
import 'package:ft_intra/core/demo/demo_mode.dart';
import 'package:ft_intra/core/notifications/fcm_service.dart';
import 'package:ft_intra/core/providers.dart';

/// An incoming friend request (someone wants to be notified about your logins).
class FriendRequest {
  final int userId;
  final String login;
  const FriendRequest(this.userId, this.login);
}

/// Backend friendship graph for the current user. Friends are added LOCALLY
/// (one-sided, for presence) anytime; this graph only governs NOTIFICATIONS:
/// to be notified about a friend's logins, a mutual accepted edge is required.
class FriendGraph {
  /// Incoming requests (people who want to follow your logins) awaiting accept.
  final List<FriendRequest> incoming;

  /// User ids you requested notifications for, still awaiting their accept.
  final Set<int> outgoingPending;

  /// User ids with a mutual accepted edge (notifications can flow).
  final Set<int> accepted;

  const FriendGraph({
    this.incoming = const [],
    this.outgoingPending = const {},
    this.accepted = const {},
  });

  /// Notify state for one friend, used to render the bell icon.
  FriendNotifyState stateOf(int userId) {
    if (accepted.contains(userId)) return FriendNotifyState.on;
    if (outgoingPending.contains(userId)) return FriendNotifyState.pending;
    return FriendNotifyState.off;
  }
}

enum FriendNotifyState { off, pending, on }

/// Friend coordination.
///
/// Two separate concepts (per product decision):
///  1. Friend LIST — added locally, one-sided, anytime (public presence; no
///     consent needed). Local-only nickname / discord / presence.
///  2. Friend NOTIFICATIONS — to receive login push about a friend, that friend
///     must consent: turning notify ON sends a backend friend request; once they
///     accept (they also run ft_intra), the friend poller pushes (doc_v2/10).
class FriendsService {
  FriendsService(this._backend, this._db, this._api, this._tokens);

  final BackendClient _backend;
  final AppDatabase _db;
  final FtApiClient _api;
  final TokenStorage _tokens;

  // ── 1. local friend list (one-sided, anytime) ──

  /// Add a friend to the local list by 42 login (for presence display). Throws
  /// if the login is unknown.
  Future<String> addLocal(String login) async {
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
    _backfillLastSeen(user.id);
    return user.login;
  }

  Future<void> removeLocal(int userId) async {
    // Also drop any notification edge so the server stops watching.
    await _disableNotify(userId);
    await _db.removeFriend(userId);
  }

  Future<void> _backfillLastSeen(int userId) async {
    try {
      final locations = await _api.getUserLocations(userId, pageSize: 1);
      if (locations.isEmpty) return;
      final ts = DateTime.tryParse(locations.first.beginAt);
      if (ts != null) await _db.setFriendLastSeenIfMissing(userId, ts);
    } catch (_) {
      // best effort
    }
  }

  // ── 2. notifications (mutual consent) ──

  /// Turn ON login notifications for a friend: send a friend request and mark
  /// the local intent. Push only flows once the friend accepts. Returns the
  /// backend status ('pending' | 'accepted' | 'already_friends'), or null.
  Future<String?> enableNotify(int userId, String login) async {
    final token = await _tokens.getAccessToken();
    if (token == null) return null;
    final status =
        await _backend.requestFriend(accessToken: token, targetLogin: login);
    if (status != null) {
      await _db.setFriendNotify(userId, true);
      await syncWatchIds();
    }
    return status;
  }

  /// Turn OFF notifications: cancel a pending request OR remove an accepted
  /// edge, and clear the local intent + watch list.
  Future<void> disableNotify(int userId) => _disableNotify(userId);

  Future<void> _disableNotify(int userId) async {
    final token = await _tokens.getAccessToken();
    if (token == null) return;
    // respond(accept=false) cancels an outgoing pending request; delete removes
    // an accepted edge. Try both — the backend ignores the irrelevant one.
    await _backend.respondFriend(
        accessToken: token, otherUserId: userId, accept: false);
    await _backend.deleteFriend(accessToken: token, otherUserId: userId);
    await _db.setFriendNotify(userId, false);
    await syncWatchIds();
  }

  /// Accept or decline an incoming request (someone wanting to watch you).
  Future<bool> respondIncoming(int userId, bool accept) async {
    final token = await _tokens.getAccessToken();
    if (token == null) return false;
    return _backend.respondFriend(
        accessToken: token, otherUserId: userId, accept: accept);
  }

  /// Send the device's current friend watch list (notify-enabled friend ids) to
  /// the backend. No-op if the device isn't registered for notifications.
  Future<void> syncWatchIds() async {
    final fcm = await FcmService.getToken();
    if (fcm == null) return;
    final ids = await _db.getFriendWatchIds();
    await _backend.updatePreferences(fcmToken: fcm, friendWatchIds: ids);
  }

  /// Read the backend friendship graph (incoming / pending / accepted).
  Future<FriendGraph> graph() async {
    final token = await _tokens.getAccessToken();
    if (token == null) return const FriendGraph();
    final lists = await _backend.listFriends(accessToken: token);
    Set<int> ids(String k) =>
        (lists[k] ?? const []).map((e) => e['user_id'] as int).toSet();
    final incoming = (lists['incoming'] ?? const [])
        .map((e) => FriendRequest(e['user_id'] as int, e['login'] as String))
        .toList();
    return FriendGraph(
      incoming: incoming,
      outgoingPending: ids('outgoing'),
      accepted: ids('accepted'),
    );
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

/// The backend friendship graph (notification consent state). Invalidate to
/// refresh after request/accept/decline. Empty in demo mode (no network).
final friendGraphProvider = FutureProvider<FriendGraph>((ref) async {
  if (ref.watch(demoModeProvider)) return const FriendGraph();
  return ref.watch(friendsServiceProvider).graph();
});
