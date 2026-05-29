import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/checkin/checkin_models.dart';
import 'package:ft_intra/features/campus/checkin_onboarding_sheet.dart';
import 'package:ft_intra/shared/widgets/user_avatar.dart';

const _teal = Color(0xFF00BABC);

class CheckinTab extends ConsumerWidget {
  const CheckinTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final enabled = ref.watch(geofenceEnabledProvider);
    final status = ref.watch(checkinStatusProvider);
    final usersAsync = ref.watch(checkedInUsersProvider);

    return Column(
      children: [
        _ControlCard(enabled: enabled, status: status),
        const Divider(height: 1),
        Expanded(
          child: usersAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 12),
                  Text('$err', textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () => ref.invalidate(checkedInUsersProvider),
                    child: Text(s.get('retry')),
                  ),
                ],
              ),
            ),
            data: (users) => RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(checkedInUsersProvider);
                await ref.read(checkinStatusProvider.notifier).refresh();
              },
              child: users.isEmpty
                  ? ListView(
                      children: [
                        const SizedBox(height: 80),
                        Center(child: Text(s.get('checkin_none'))),
                      ],
                    )
                  : ListView.builder(
                      itemCount: users.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: Text(
                              '${users.length} ${s.get('checkin_on_campus')}',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 13),
                            ),
                          );
                        }
                        return _CheckinTile(user: users[index - 1]);
                      },
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ControlCard extends ConsumerWidget {
  final bool enabled;
  final dynamic status;

  const _ControlCard({required this.enabled, required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final campusId = ref.watch(selectedCampusIdProvider);
    final service = ref.read(checkinServiceProvider);

    if (!enabled) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.get('checkin_enable_title'),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(s.get('checkin_enable_body'),
                    style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: () => CheckinOnboardingSheet.show(context),
                  icon: const Icon(Icons.location_on, size: 18),
                  label: Text(s.get('checkin_enable_button')),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final bool isCheckedIn = status.isCheckedIn as bool;
    final DateTime? since = status.since as DateTime?;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        color: isCheckedIn ? _teal.withValues(alpha: 0.12) : null,
        child: ListTile(
          leading: Icon(
            isCheckedIn ? Icons.check_circle : Icons.location_searching,
            color: isCheckedIn ? _teal : Colors.grey,
          ),
          title: Text(isCheckedIn
              ? s.get('checkin_you_are_in')
              : s.get('checkin_check_in_now')),
          subtitle: isCheckedIn && since != null
              ? Text('${s.get('checkin_since')} ${DateFormat.Hm().format(since.toLocal())}')
              : null,
          trailing: FilledButton(
            style: isCheckedIn
                ? FilledButton.styleFrom(backgroundColor: Colors.red)
                : null,
            onPressed: () async {
              if (isCheckedIn) {
                await service.checkOut(campusId);
              } else {
                await service.checkIn(campusId);
              }
              await ref.read(checkinStatusProvider.notifier).refresh();
              ref.invalidate(checkedInUsersProvider);
            },
            child: Text(isCheckedIn
                ? s.get('checkin_check_out')
                : s.get('checkin_action')),
          ),
        ),
      ),
    );
  }
}

class _CheckinTile extends StatelessWidget {
  final CheckedInUser user;

  const _CheckinTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: ListTile(
        dense: true,
        onTap: () => context.push('/user/${user.login}'),
        leading: UserAvatar(login: user.login, radius: 20),
        title: Text('@${user.login}',
            style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: _teal.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.location_on, size: 14, color: _teal),
        ),
      ),
    );
  }
}
