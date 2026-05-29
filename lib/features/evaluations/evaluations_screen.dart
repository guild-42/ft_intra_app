import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/models/scale_team.dart';
import 'package:ft_intra/core/models/slot.dart';
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
                    Tab(text: s.get('my_slots')),
                    Tab(text: s.get('as_corrector')),
                    Tab(text: s.get('as_corrected')),
                  ],
                  labelColor: _teal,
                  indicatorColor: _teal,
                  unselectedLabelColor: Colors.grey,
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    _MySlotsTab(),
                    _ScaleTeamList(asCorrector: true),
                    _ScaleTeamList(asCorrector: false),
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

class _ScaleTeamList extends ConsumerWidget {
  final bool asCorrector;
  const _ScaleTeamList({required this.asCorrector});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final provider = asCorrector
        ? myScaleTeamsAsCorrectorProvider
        : myScaleTeamsAsCorrectedProvider;
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
          return const Center(
            child: Text('No evaluations', style: TextStyle(color: Colors.grey)),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(provider),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) => _ScaleTeamTile(
              team: items[i],
              asCorrector: asCorrector,
            ),
          ),
        );
      },
    );
  }
}

class _ScaleTeamTile extends StatelessWidget {
  final ScaleTeam team;
  final bool asCorrector;

  const _ScaleTeamTile({required this.team, required this.asCorrector});

  String _formatDate(String iso) {
    final dt = DateTime.tryParse(iso);
    if (dt == null) return iso;
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  String? _counterpartLogin() {
    if (asCorrector) {
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
  Widget build(BuildContext context) {
    final counterpart = _counterpartLogin() ?? 'unknown';
    final projectName = team.team?.name ?? 'project ${team.team?.projectId ?? "?"}';
    final mark = team.finalMark;
    final filled = team.filledAt != null;
    final isPast = filled;

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
                Icon(asCorrector ? Icons.arrow_forward : Icons.arrow_back,
                    size: 12, color: Colors.grey),
                const SizedBox(width: 4),
                Text(counterpart, style: const TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              isPast
                  ? 'Evaluated: ${_formatDate(team.filledAt!)}'
                  : 'Scheduled: ${_formatDate(team.beginAt)}',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}

// ───────────────────────── My Slots tab ─────────────────────────

class _MySlotsTab extends ConsumerWidget {
  const _MySlotsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final async = ref.watch(mySlotsProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: _teal,
        icon: const Icon(Icons.add),
        label: Text(s.get('add_slot')),
        onPressed: () => _showCreateSlotDialog(context, ref),
      ),
      body: async.when(
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
                onPressed: () => ref.invalidate(mySlotsProvider),
                child: Text(s.get('retry')),
              ),
            ],
          ),
        ),
        data: (slots) {
          if (slots.isEmpty) {
            return Center(
              child: Text(s.get('no_slots'),
                  style: const TextStyle(color: Colors.grey)),
            );
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(mySlotsProvider),
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 88),
              itemCount: slots.length,
              itemBuilder: (context, i) => _SlotTile(slot: slots[i]),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showCreateSlotDialog(
      BuildContext context, WidgetRef ref) async {
    final now = DateTime.now();
    DateTime begin = DateTime(now.year, now.month, now.day, now.hour + 1);
    Duration duration = const Duration(minutes: 30);

    final created = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) {
          String fmt(DateTime d) =>
              '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')} '
              '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
          return AlertDialog(
            title: const Text('Add slot'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Start'),
                  subtitle: Text(fmt(begin)),
                  trailing: const Icon(Icons.edit_calendar),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: ctx,
                      initialDate: begin,
                      firstDate: now,
                      lastDate: now.add(const Duration(days: 14)),
                    );
                    if (date == null) return;
                    if (!ctx.mounted) return;
                    final time = await showTimePicker(
                      context: ctx,
                      initialTime: TimeOfDay.fromDateTime(begin),
                    );
                    if (time == null) return;
                    // Round minutes to 15-min granularity (42 requirement).
                    final rounded = (time.minute ~/ 15) * 15;
                    setState(() => begin = DateTime(
                        date.year, date.month, date.day, time.hour, rounded));
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Duration'),
                  trailing: DropdownButton<int>(
                    value: duration.inMinutes,
                    items: const [30, 45, 60, 90, 120]
                        .map((m) => DropdownMenuItem(
                            value: m, child: Text('$m min')))
                        .toList(),
                    onChanged: (m) =>
                        setState(() => duration = Duration(minutes: m ?? 30)),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Create'),
              ),
            ],
          );
        },
      ),
    );

    if (created != true) return;

    // 42 constraints: 30 min – 2 weeks in advance, ≥30 min, 15-min granularity.
    if (begin.isBefore(now.add(const Duration(minutes: 30)))) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Slot must start at least 30 minutes from now'),
          backgroundColor: Colors.red,
        ));
      }
      return;
    }

    final end = begin.add(duration);
    final api = ref.read(apiClientProvider);
    try {
      await api.createSlot({
        'slot': {
          'begin_at': begin.toUtc().toIso8601String(),
          'end_at': end.toUtc().toIso8601String(),
        }
      });
      ref.invalidate(mySlotsProvider);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(describeApiError(e)),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 8),
        ));
      }
    }
  }
}

class _SlotTile extends ConsumerWidget {
  final FtSlot slot;
  const _SlotTile({required this.slot});

  String _fmt(String iso) {
    final dt = DateTime.tryParse(iso)?.toLocal();
    if (dt == null) return iso;
    return '${dt.month}/${dt.day} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  String? _bookedByLogin() {
    final st = slot.scaleTeam;
    if (st is Map<String, dynamic>) {
      final c = st['corrector'];
      if (c is Map<String, dynamic>) return c['login'] as String?;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final booked = slot.scaleTeam != null;
    final bookedBy = _bookedByLogin();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: Icon(
          booked ? Icons.event_available : Icons.event_note,
          color: booked ? _teal : Colors.grey,
        ),
        title: Text('${_fmt(slot.beginAt)} → ${_fmt(slot.endAt)}'),
        subtitle: Text(
          booked
              ? '${s.get('slot_booked')}${bookedBy != null ? ' · $bookedBy' : ''}'
              : s.get('slot_available'),
          style: TextStyle(
            fontSize: 12,
            color: booked ? _teal : Colors.grey,
            fontWeight: booked ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        trailing: booked
            ? null
            : IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () async {
                  final api = ref.read(apiClientProvider);
                  try {
                    await api.deleteSlot(slot.id);
                    ref.invalidate(mySlotsProvider);
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(describeApiError(e)),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 8),
                      ));
                    }
                  }
                },
              ),
      ),
    );
  }
}

