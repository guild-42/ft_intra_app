import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:ft_intra/core/api/ft_api_client.dart';
import 'package:ft_intra/core/db/app_database.dart';

class UserCacheService {
  final AppDatabase _db;
  final FtApiClient _api;

  UserCacheService({required AppDatabase db, required FtApiClient api})
      : _db = db,
        _api = api;

  /// Fetch missing users in batches of 100. Caches results in DB.
  Future<void> ensureCached(List<int> userIds) async {
    if (userIds.isEmpty) return;

    final cached = await _db.getCachedUsers(userIds);
    final cachedIds = cached.map((c) => c.userId).toSet();
    final missing = userIds.where((id) => !cachedIds.contains(id)).toList();

    debugPrint(
        '[UserCache] requested=${userIds.length}, cached=${cachedIds.length}, missing=${missing.length}');

    if (missing.isEmpty) return;

    for (var i = 0; i < missing.length; i += 100) {
      final chunk = missing.sublist(i, (i + 100).clamp(0, missing.length));
      try {
        debugPrint('[UserCache] fetching batch of ${chunk.length} ids: '
            '${chunk.take(3).join(',')}${chunk.length > 3 ? ',...' : ''}');
        final users = await _api.getUsersByIds(
          chunk.join(','),
          pageSize: 100,
        );
        final withImage =
            users.where((u) => (u.image?.versions?.medium ?? u.image?.link) != null).length;
        debugPrint('[UserCache] got ${users.length} users '
            '($withImage with image url)');
        if (users.isNotEmpty) {
          final first = users.first;
          debugPrint('[UserCache] sample: login=${first.login}, '
              'image.link=${first.image?.link}, '
              'image.versions.medium=${first.image?.versions?.medium}');
        }
        final rows = users.map((u) => CachedUsersCompanion.insert(
              userId: Value(u.id),
              login: u.login,
              displayName: Value(u.displayName),
              imageUrl: Value(u.image?.versions?.medium ?? u.image?.link),
            ));
        await _db.upsertCachedUsers(rows.toList());
        debugPrint('[UserCache] upserted ${users.length} rows');
      } on DioException catch (e) {
        debugPrint('[UserCache] DioException: '
            'status=${e.response?.statusCode}, '
            'data=${e.response?.data}, '
            'url=${e.requestOptions.uri}');
      } catch (e, st) {
        debugPrint('[UserCache] batch fetch failed: $e\n$st');
      }
    }
  }
}
