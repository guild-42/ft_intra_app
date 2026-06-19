import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/core/models/event.dart';
import 'package:ft_intra/modules/events/events_module.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/shared/widgets/async_error_view.dart';

class EventsScreen extends ConsumerWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final eventsAsync = ref.watch(campusEventsProvider);

    return Scaffold(
      body: SafeArea(
        child: eventsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => AsyncErrorView(
            error: e,
            onRetry: () => ref.invalidate(campusEventsProvider),
          ),
          data: (events) {
            final now = DateTime.now().toUtc();
            DateTime? begin(FtEvent e) =>
                e.beginAt == null ? null : DateTime.tryParse(e.beginAt!);
            final upcoming = events
                .where((e) => begin(e)?.isAfter(now) ?? false)
                .toList()
              ..sort((a, b) => a.beginAt!.compareTo(b.beginAt!));
            final past =
                events.where((e) => !(begin(e)?.isAfter(now) ?? false)).toList();

            if (events.isEmpty) {
              return Center(child: Text(s.get('no_events')));
            }
            return RefreshIndicator(
              onRefresh: () => ref.refresh(campusEventsProvider.future),
              child: ListView(
                children: [
                  if (upcoming.isNotEmpty)
                    _SectionHeader(title: s.get('upcoming')),
                  ...upcoming.map((e) => _EventTile(event: e)),
                  if (past.isNotEmpty) _SectionHeader(title: s.get('past')),
                  ...past.map((e) => _EventTile(event: e)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  final FtEvent event;
  const _EventTile({required this.event});

  static const _kindColors = {
    'exam': Colors.redAccent,
    'event': Color(0xFF00BABC),
    'hackathon': Colors.deepPurpleAccent,
    'association': Colors.orangeAccent,
    'conference': Colors.blueAccent,
    'meet_up': Colors.green,
  };

  @override
  Widget build(BuildContext context) {
    final begin =
        event.beginAt == null ? null : DateTime.tryParse(event.beginAt!)?.toLocal();
    final when = begin == null
        ? ''
        : '${begin.year}-${begin.month.toString().padLeft(2, '0')}-'
            '${begin.day.toString().padLeft(2, '0')} '
            '${begin.hour.toString().padLeft(2, '0')}:'
            '${begin.minute.toString().padLeft(2, '0')}';
    final color = _kindColors[event.kind] ?? Colors.grey;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.2),
          child: Icon(Icons.event, color: color, size: 20),
        ),
        title: Text(event.name,
            maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          [
            when,
            if (event.location != null && event.location!.isNotEmpty)
              event.location!,
          ].join(' · '),
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Text(
          event.maxPeople == null
              ? '${event.nbrSubscribers}'
              : '${event.nbrSubscribers}/${event.maxPeople}',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        children: [
          if (event.description != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(event.description!,
                  style: const TextStyle(fontSize: 13)),
            ),
        ],
      ),
    );
  }
}
