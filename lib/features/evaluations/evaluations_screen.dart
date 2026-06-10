import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/models/scale_team.dart';
import 'package:ft_intra/features/evaluations/slot_block.dart';
import 'package:ft_intra/shared/widgets/user_avatar.dart';

const _teal = Color(0xFF00BABC);

/// Human-readable error message. For a 42 API 403 the required OAuth scope is
/// in the `www-authenticate` header — surface it so scope gaps are diagnosable
/// on-device instead of showing a raw stack trace.
String describeApiError(Object err) {
  if (err is DioException) {
    final res = err.response;
    final code = res?.statusCode;
    if (code == 403) {
      final wwwAuth = res?.headers.value('www-authenticate') ?? '';
      final scope = RegExp(r'scope="([^"]*)"').firstMatch(wwwAuth)?.group(1);
      if (scope != null && scope.isNotEmpty) {
        return '403 Forbidden — このエンドポイントには OAuth scope "$scope" が必要です。\n'
            '42 アプリ設定で scope を追加し、再ログインしてください。';
      }
      return '403 Forbidden — 権限不足（OAuth scope か token 期限）。\n'
          'www-authenticate: ${wwwAuth.isEmpty ? "(なし)" : wwwAuth}\n'
          'body: ${res?.data}';
    }
    if (code == 401) return '401 — token が期限切れです。再ログインしてください。';
    return 'HTTP ${code ?? "?"}: ${res?.data ?? err.message}';
  }
  return '$err';
}

class EvaluationsScreen extends ConsumerWidget {
  const EvaluationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);

    // Default tab = Reviewer (index 0).
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Material(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: TabBar(
                  tabs: [
                    Tab(text: s.get('reviewer')),
                    Tab(text: s.get('reviewee')),
                    Tab(text: s.get('my_slots')),
                  ],
                  labelColor: _teal,
                  indicatorColor: _teal,
                  unselectedLabelColor: Colors.grey,
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    _ReviewList(asReviewer: true),
                    _ReviewList(asReviewer: false),
                    _MySlotsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReviewList extends ConsumerWidget {
  /// true = reviews I did (corrector), false = reviews I received (corrected).
  final bool asReviewer;
  const _ReviewList({required this.asReviewer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final provider =
        asReviewer ? reviewsAsReviewerProvider : reviewsAsRevieweeProvider;
    final async = ref.watch(provider);

    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 12),
            Text(describeApiError(err), textAlign: TextAlign.center),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => ref.invalidate(provider),
              child: Text(s.get('retry')),
            ),
          ],
        ),
      ),
      data: (items) {
        if (items.isEmpty) {
          return Center(
            child: Text(s.get('no_reviews'),
                style: const TextStyle(color: Colors.grey)),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(provider),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) => _ReviewTile(
              team: items[i],
              asReviewer: asReviewer,
            ),
          ),
        );
      },
    );
  }
}

class _ReviewTile extends ConsumerWidget {
  final ScaleTeam team;
  final bool asReviewer;

  const _ReviewTile({required this.team, required this.asReviewer});

  String _formatDate(String iso) {
    final dt = DateTime.tryParse(iso);
    if (dt == null) return iso;
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  /// The other party: when I'm the reviewer the counterpart is the reviewee
  /// (correcteds), and vice-versa.
  String? _counterpartLogin() {
    if (asReviewer) {
      if (team.correcteds.isNotEmpty) {
        final c = team.correcteds.first;
        if (c is Map<String, dynamic>) return c['login'] as String?;
      }
      return null;
    }
    final c = team.corrector;
    if (c is Map<String, dynamic>) return c['login'] as String?;
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final counterpart = _counterpartLogin() ?? 'unknown';
    final projectName = team.team?.name ?? 'project ${team.team?.projectId ?? "?"}';
    final mark = team.finalMark;
    final isPast = team.filledAt != null;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        onTap: () => context.push('/user/$counterpart'),
        leading: UserAvatar(login: counterpart, radius: 20),
        title: Row(
          children: [
            Expanded(
              child: Text(projectName,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ),
            if (mark != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: mark >= 100 ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$mark',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(asReviewer ? Icons.arrow_forward : Icons.arrow_back,
                    size: 12, color: Colors.grey),
                const SizedBox(width: 4),
                Text(counterpart, style: const TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              isPast
                  ? '${s.get('evaluated')}: ${_formatDate(team.filledAt!)}'
                  : '${s.get('scheduled')}: ${_formatDate(team.beginAt)}',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}

// ───────────────────────── My Slots tab (read-only) ─────────────────────────
//
// Slot create/delete require a non-public OAuth scope (403), so this is a
// view-only list of the user's slots created on the intra website.

class _MySlotsTab extends ConsumerWidget {
  const _MySlotsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final async = ref.watch(mySlotsProvider);

    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(describeApiError(err), textAlign: TextAlign.center),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => ref.invalidate(mySlotsProvider),
              child: Text(s.get('retry')),
            ),
          ],
        ),
      ),
      data: (slots) => _MySlotsCalendar(blocks: mergeSlots(slots)),
    );
  }
}

String _hm(DateTime dt) =>
    '${dt.hour}:${dt.minute.toString().padLeft(2, '0')}';

class _MySlotsCalendar extends ConsumerStatefulWidget {
  final List<SlotBlock> blocks;
  const _MySlotsCalendar({required this.blocks});

  @override
  ConsumerState<_MySlotsCalendar> createState() => _MySlotsCalendarState();
}

class _MySlotsCalendarState extends ConsumerState<_MySlotsCalendar> {
  final _controller = CalendarController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap(CalendarTapDetails details) {
    if (details.targetElement != CalendarElement.appointment) return;
    final appts = details.appointments;
    if (appts == null || appts.isEmpty) return;
    final block = appts.first as SlotBlock;
    if (block.booked && block.bookedBy != null) {
      context.push('/user/${block.bookedBy}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () => _controller.displayDate = DateTime.now(),
              style: TextButton.styleFrom(foregroundColor: _teal),
              child: Text(s.get('today')),
            ),
            const Spacer(),
            IconButton(
              tooltip: s.get('retry'),
              icon: const Icon(Icons.refresh, color: _teal),
              onPressed: () => ref.invalidate(mySlotsProvider),
            ),
          ],
        ),
        Expanded(
          child: SfCalendar(
            controller: _controller,
            view: CalendarView.week,
            firstDayOfWeek: 1,
            showNavigationArrow: true,
            todayHighlightColor: _teal,
            cellBorderColor: const Color(0xFFE0E0E0),
            dataSource: _SlotDataSource(widget.blocks, s.get('slot_booked'),
                s.get('slot_available')),
            timeSlotViewSettings: const TimeSlotViewSettings(
              timeInterval: Duration(hours: 1),
              timeIntervalHeight: 21,
              timeFormat: 'h a',
            ),
            appointmentBuilder: (context, details) {
              final b = details.appointments.first as SlotBlock;
              final bg =
                  b.booked ? _teal : _teal.withValues(alpha: 0.15);
              final fg = b.booked ? Colors.white : _teal;
              final label = b.booked
                  ? (b.bookedBy != null
                      ? '${s.get('slot_booked')} · ${b.bookedBy}'
                      : s.get('slot_booked'))
                  : s.get('slot_available');
              return Container(
                width: details.bounds.width,
                height: details.bounds.height,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(4),
                  border: b.booked
                      ? null
                      : Border.all(color: _teal.withValues(alpha: 0.5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${_hm(b.begin)} - ${_hm(b.end)}',
                        style: TextStyle(fontSize: 10, color: fg)),
                    Text(label,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: fg)),
                  ],
                ),
              );
            },
            onTap: _onTap,
          ),
        ),
      ],
    );
  }
}

class _SlotDataSource extends CalendarDataSource {
  final String bookedLabel;
  final String availableLabel;

  _SlotDataSource(List<SlotBlock> blocks, this.bookedLabel, this.availableLabel) {
    appointments = blocks;
  }

  SlotBlock _b(int index) => appointments![index] as SlotBlock;

  @override
  DateTime getStartTime(int index) => _b(index).begin;

  @override
  DateTime getEndTime(int index) => _b(index).end;

  @override
  String getSubject(int index) =>
      _b(index).booked ? bookedLabel : availableLabel;

  @override
  Color getColor(int index) =>
      _b(index).booked ? _teal : _teal.withValues(alpha: 0.15);
}
