import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/db/app_database.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final notifsAsync = ref.watch(notificationsStreamProvider);

    return Scaffold(
      body: SafeArea(
        child: notifsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.notifications_none, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('No notifications yet',
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () => context.push('/cookie-login'),
                    icon: const Icon(Icons.login),
                    label: const Text('Login to Intra to fetch notifications'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => _refresh(ref),
            child: ListView.builder(
              itemCount: items.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${items.length} notifications',
                            style: const TextStyle(color: Colors.grey)),
                        TextButton.icon(
                          onPressed: () => context.push('/cookie-login'),
                          icon: const Icon(Icons.refresh, size: 16),
                          label: const Text('Refresh'),
                        ),
                      ],
                    ),
                  );
                }

                final n = items[index - 1];
                return _NotificationTile(notification: n);
              },
            ),
          );
        },
      ),
      ),
    );
  }

  Future<void> _refresh(WidgetRef ref) async {
    final db = ref.read(databaseProvider);
    final cookie = await db.getValidCookie();
    if (cookie == null) return;

    final scraper = ref.read(notificationScraperProvider);
    await scraper.scrapeAndStore(db, cookie);
  }
}

class _NotificationTile extends StatelessWidget {
  final IntraNotification notification;

  const _NotificationTile({required this.notification});

  @override
  Widget build(BuildContext context) {
    final isEvalpo = notification.title.toLowerCase().contains('evaluation points');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Icon(
          isEvalpo ? Icons.monetization_on : Icons.event,
          color: isEvalpo ? Colors.amber : const Color(0xFF00BABC),
          size: 32,
        ),
        title: Text(notification.title,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(notification.body, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text(notification.sourceDate ?? '',
                style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
