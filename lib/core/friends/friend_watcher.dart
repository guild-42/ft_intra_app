import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:ft_intra/core/db/app_database.dart';
import 'package:ft_intra/core/api/ft_api_client.dart';

/// Polls campus locations while the app is open to keep friends' online
/// status fresh for the live UI.
///
/// Login *push notifications* are delivered by the backend friend poller
/// (so they arrive even when the app is closed). This watcher therefore no
/// longer raises local notifications — that would double-notify.
class FriendWatcher {
  final AppDatabase _db;
  final FtApiClient _api;
  final int Function() _getCampusId;

  Timer? _timer;
  static const _checkInterval = Duration(minutes: 2);

  FriendWatcher({
    required AppDatabase db,
    required FtApiClient api,
    required int Function() getCampusId,
  })  : _db = db,
        _api = api,
        _getCampusId = getCampusId;

  void start() {
    if (kIsWeb) return;
    _timer?.cancel();
    _timer = Timer.periodic(_checkInterval, (_) => _check());
    _check();
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _check() async {
    try {
      final friends = await _db.getAllFriends();
      if (friends.isEmpty) return;

      final friendIds = friends.map((f) => f.userId).toSet();

      final locations = await _api.getCampusLocations(
        _getCampusId(),
        active: true,
        pageSize: 100,
      );

      final activeNow = <int, String>{};
      for (final loc in locations) {
        if (friendIds.contains(loc.user.id)) {
          activeNow[loc.user.id] = loc.host;
        }
      }

      for (final friend in friends) {
        // DB update only — keeps the live UI fresh. Push is backend-driven.
        await _db.updateFriendLocation(friend.userId, activeNow[friend.userId]);
      }
    } catch (e) {
      debugPrint('FriendWatcher check failed: $e');
    }
  }
}
