import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/modules/notifications/notifications.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifsAsync = ref.watch(notificationsStreamProvider);

    return Scaffold(
      body: SafeArea(
        child: notifsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (items) {
          if (items.isEmpty) {
            return RefreshIndicator(
              onRefresh: () => _refresh(ref),
              child: ListView(
                children: const [
                  SizedBox(height: 160),
                  Icon(Icons.notifications_none, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Center(
                    child: Text('No notifications yet',
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text('Pull down to refresh',
                        style: TextStyle(color: Colors.grey, fontSize: 13)),
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
                    child: Text('${items.length} notifications',
                        style: const TextStyle(color: Colors.grey)),
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
    await ref.read(notificationsRepositoryProvider).refreshFromBackend();
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
