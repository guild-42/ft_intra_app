import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/models/slot.dart';
import 'package:ft_intra/shared/widgets/async_error_view.dart';
import 'package:ft_intra/features/evaluations/slot_block.dart';

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
                    Tab(text: s.get('eval_schedule')),
                    Tab(text: s.get('my_slots')),
                    Tab(text: s.get('eval_history')),
                  ],
                  labelColor: _teal,
                  indicatorColor: _teal,
                  unselectedLabelColor: Colors.grey,
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    _ScheduleList(),
                    _MySlotsTab(),
                    _FeedbackList(),
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

// ───────────────────── Feedback history (評価履歴) tab ─────────────────────
//
// The user's evaluation records live in the `feedbacks` resource (the intra
// "Feedbacks you made" page), not scale_teams — that /me list is empty for this
// account. Each row is a feedback the user authored; project name + counterpart
// live on the referenced scale_team and are fetched only on tap.

class _FeedbackList extends ConsumerWidget {
  const _FeedbackList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final async = ref.watch(evalHistoryProvider);

    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => AsyncErrorView(
        error: err,
        message: describeApiError(err),
        onRetry: () => ref.invalidate(evalHistoryProvider),
      ),
      data: (items) {
        if (items.isEmpty) {
          return Center(
            child: Text(s.get('no_feedbacks'),
                style: const TextStyle(color: Colors.grey)),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(myFeedbacksProvider),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) => _FeedbackTile(record: items[i]),
          ),
        );
      },
    );
  }
}

class _FeedbackTile extends ConsumerWidget {
  final EvalRecord record;
  const _FeedbackTile({required this.record});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final fb = record.feedback;
    final dt = record.date;
    final date = dt == null
        ? ''
        : '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
    final rating = fb.rating;
    final reviewed = record.iReviewed; // true=I reviewed, false=I was reviewed
    final counterpart = record.counterpartLogin;
    final project = record.project;
    final tappable = counterpart != null;

    // Role chip: green "I reviewed" / orange "I was reviewed" / grey event.
    final (roleLabel, roleColor) = record.isEvent
        ? (s.get('eval_type_event'), Colors.blueGrey)
        : reviewed == true
            ? (s.get('role_reviewer'), Colors.green)
            : reviewed == false
                ? (s.get('role_reviewee'), Colors.orange)
                : (s.get('eval_type_review'), Colors.grey);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: _teal.withValues(alpha: 0.15),
          child: Text(
            rating == null
                ? '–'
                : '${rating % 1 == 0 ? rating.toInt() : rating}/5',
            style: const TextStyle(
                color: _teal, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
              decoration: BoxDecoration(
                color: roleColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(roleLabel,
                  style: TextStyle(
                      fontSize: 10,
                      color: roleColor,
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                project ??
                    (record.isEvent
                        ? s.get('eval_type_event')
                        : s.get('eval_type_review')),
                style: const TextStyle(fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Row(
              children: [
                if (counterpart != null) ...[
                  Icon(reviewed == true ? Icons.arrow_forward : Icons.arrow_back,
                      size: 12, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(counterpart, style: const TextStyle(fontSize: 12)),
                  const SizedBox(width: 8),
                ],
                Text(date,
                    style:
                        const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            if (fb.comment?.isNotEmpty == true)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(fb.comment!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12)),
              ),
          ],
        ),
        isThreeLine: true,
        trailing: tappable
            ? const Icon(Icons.chevron_right, size: 18, color: Colors.grey)
            : null,
        onTap: tappable ? () => context.push('/user/$counterpart') : null,
      ),
    );
  }
}

// ───────────────────── Upcoming review schedule (予定) tab ──────────────────

class _ScheduleList extends ConsumerWidget {
  const _ScheduleList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final async = ref.watch(upcomingSlotsProvider);

    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => AsyncErrorView(
        error: err,
        message: describeApiError(err),
        onRetry: () => ref.invalidate(mySlotsProvider),
      ),
      data: (slots) {
        if (slots.isEmpty) {
          return Center(
            child: Text(s.get('no_schedule'),
                style: const TextStyle(color: Colors.grey)),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(mySlotsProvider),
          child: ListView.builder(
            itemCount: slots.length,
            itemBuilder: (context, i) => _ScheduleTile(slot: slots[i]),
          ),
        );
      },
    );
  }
}

class _ScheduleTile extends ConsumerWidget {
  final FtSlot slot;
  const _ScheduleTile({required this.slot});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final begin = DateTime.tryParse(slot.beginAt)?.toLocal();
    final end = DateTime.tryParse(slot.endAt)?.toLocal();
    final booked = slot.scaleTeam != null;
    String when = '';
    if (begin != null) {
      when = '${begin.year}-${begin.month.toString().padLeft(2, '0')}-'
          '${begin.day.toString().padLeft(2, '0')} '
          '${begin.hour.toString().padLeft(2, '0')}:${begin.minute.toString().padLeft(2, '0')}';
      if (end != null) {
        when += '–${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}';
      }
    }
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: Icon(
          booked ? Icons.event_available : Icons.event_note,
          color: booked ? _teal : Colors.grey,
        ),
        title: Text(when),
        trailing: Text(
          booked ? s.get('slot_booked') : s.get('slot_available'),
          style: TextStyle(
            fontSize: 12,
            color: booked ? _teal : Colors.grey,
          ),
        ),
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
    final async = ref.watch(mySlotsProvider);

    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => AsyncErrorView(
        error: err,
        message: describeApiError(err),
        onRetry: () => ref.invalidate(mySlotsProvider),
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
