import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/core/api/backend_client.dart';
import 'package:ft_intra/core/db/app_database.dart';
import 'package:ft_intra/core/providers.dart';

/// Notifications data access. The notification history (campus events the server
/// pushed) is fetched from the backend `/api/notifications` and cached in the
/// local DB so the list works offline. Cookie scraping is gone (doc_v2/10).
class NotificationsRepository {
  NotificationsRepository(this._db, this._backend);

  final AppDatabase _db;
  final BackendClient _backend;

  /// Pull the latest event-notification history from the backend and upsert it
  /// into the local cache (dedup by signature).
  Future<void> refreshFromBackend() async {
    final items = await _backend.listNotifications();
    for (final item in items) {
      final signature = item['signature'] as String?;
      final title = item['title'] as String?;
      if (signature == null || title == null) continue;
      await _db.insertNotification(
        signature: signature,
        title: title,
        body: (item['body'] as String?) ?? '',
        sourceDate: item['source_date'] as String?,
      );
    }
  }
}

final notificationsRepositoryProvider = Provider<NotificationsRepository>((ref) {
  return NotificationsRepository(
    ref.watch(databaseProvider),
    ref.watch(backendClientProvider),
  );
});
