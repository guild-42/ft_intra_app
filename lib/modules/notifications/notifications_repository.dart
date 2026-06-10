import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/core/db/app_database.dart';
import 'package:ft_intra/core/notifications/notification_scraper.dart';
import 'package:ft_intra/core/providers.dart';

/// Notifications data access (intra notification history + the cookie used to
/// scrape it). Features go through this repository instead of touching
/// AppDatabase / the scraper directly, so the notifications subsystem owns its
/// own persistence.
class NotificationsRepository {
  NotificationsRepository(this._db, this._scraper);

  final AppDatabase _db;
  final NotificationScraper _scraper;

  /// Re-scrape intra notifications using the stored session cookie. No-op when
  /// no valid cookie is available.
  Future<void> refreshFromCookie() async {
    final cookie = await _db.getValidCookie();
    if (cookie == null) return;
    await _scraper.scrapeAndStore(_db, cookie);
  }
}

final notificationsRepositoryProvider = Provider<NotificationsRepository>((ref) {
  return NotificationsRepository(
    ref.watch(databaseProvider),
    ref.watch(notificationScraperProvider),
  );
});
