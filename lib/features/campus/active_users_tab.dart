import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/db/app_database.dart';
import 'package:ft_intra/features/campus/checkin_onboarding_sheet.dart';
import 'package:ft_intra/shared/widgets/user_avatar.dart';
import 'package:ft_intra/features/campus/campus_helpers.dart';

const _teal = Color(0xFF00BABC);

class ActiveUsersTab extends ConsumerStatefulWidget {
  const ActiveUsersTab({super.key});

  @override
  ConsumerState<ActiveUsersTab> createState() => _ActiveUsersTabState();
}

class _ActiveUsersTabState extends ConsumerState<ActiveUsersTab>
    with AutomaticKeepAliveClientMixin {
  String _query = '';

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final s = ref.watch(stringsProvider);
    final presenceAsync = ref.watch(campusPresenceProvider);
    final enabled = ref.watch(geofenceEnabledProvider);
    final status = ref.watch(checkinStatusProvider);
    final friendsAsync = ref.watch(friendsStreamProvider);
    final cachedAsync = ref.watch(cachedUsersMapProvider);
    final friends = friendsAsync.maybeWhen(
      data: (list) => {for (final f in list) f.userId: f},
      orElse: () => <int, Friend>{},
    );
    final cached = cachedAsync.maybeWhen(
      data: (m) => m,
      orElse: () => <int, CachedUser>{},
    );

    return Column(
      children: [
        _ControlCard(enabled: enabled, status: status),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
          child: TextField(
            onChanged: (v) => setState(() => _query = v.toLowerCase()),
            decoration: InputDecoration(
              hintText: s.get('search'),
              prefixIcon: const Icon(Icons.search, size: 20),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Theme.of(context).cardTheme.color,
            ),
          ),
        ),
        Expanded(
          child: presenceAsync.when(
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
                    onPressed: () => ref.invalidate(campusPresenceProvider),
                    child: Text(s.get('retry')),
                  ),
                ],
              ),
            ),
            data: (people) {
              if (people.isEmpty) {
                return Center(child: Text(s.get('no_one_on_campus')));
              }

              final filtered = _query.isEmpty
                  ? people
                  : people
                      .where((p) =>
                          p.login.toLowerCase().contains(_query) ||
                          (cached[p.userId]?.displayName
                                  ?.toLowerCase()
                                  .contains(_query) ??
                              false) ||
                          (friends[p.userId]?.nickname
                                  ?.toLowerCase()
                                  .contains(_query) ??
                              false))
                      .toList();

              return RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(campusLocationsProvider);
                  ref.invalidate(checkedInUsersProvider);
                },
                child: ListView.builder(
                  itemCount: filtered.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                        child: Text(
                          '${people.length} ${s.get('users_on_campus')}',
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 13),
                        ),
                      );
                    }
                    final p = filtered[index - 1];
                    return _PresenceTile(
                      presence: p,
                      friend: friends[p.userId],
                      cached: cached[p.userId],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Your own check-in status + enable/manual control, atop the presence list
/// (moved here when the separate check-in tab was removed).
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
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
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
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Card(
        color: isCheckedIn ? _teal.withValues(alpha: 0.12) : null,
        child: ListTile(
          dense: true,
          leading: Icon(
            isCheckedIn ? Icons.check_circle : Icons.location_searching,
            color: isCheckedIn ? _teal : Colors.grey,
          ),
          title: Text(isCheckedIn
              ? s.get('checkin_you_are_in')
              : s.get('checkin_check_in_now')),
          subtitle: isCheckedIn && since != null
              ? Text(
                  '${s.get('checkin_since')} ${DateFormat.Hm().format(since.toLocal())}')
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

class _PresenceTile extends ConsumerWidget {
  final CampusPresence presence;
  final Friend? friend;
  final CachedUser? cached;

  const _PresenceTile({required this.presence, this.friend, this.cached});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final isFriend = friend != null;
    final imageUrl = friend?.imageUrl ?? cached?.imageUrl;
    final displayName = friend?.nickname?.isNotEmpty == true
        ? friend!.nickname!
        : (cached?.displayName ?? presence.login);
    // Cluster name when logged in; the check-in badge when only checked in.
    final label = presence.isCheckinOnly
        ? s.get('checkin_badge')
        : clusterFromHost(presence.host!);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      color: isFriend ? _teal.withValues(alpha: 0.15) : null,
      child: ListTile(
        dense: true,
        onTap: () => context.push('/user/${presence.login}'),
        leading: UserAvatar(
          login: presence.login,
          imageUrl: imageUrl,
          radius: 20,
        ),
        title: Row(
          children: [
            Flexible(
              child: Text(
                displayName,
                style: const TextStyle(fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isFriend) ...[
              const SizedBox(width: 6),
              const Icon(Icons.star, size: 14, color: _teal),
            ],
          ],
        ),
        subtitle: Text(
          '@${presence.login}',
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _teal.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: presence.isCheckinOnly
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.location_on, size: 12, color: _teal),
                        const SizedBox(width: 3),
                        Text(label,
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: _teal)),
                      ],
                    )
                  : Text(
                      label,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: _teal),
                    ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                isFriend ? Icons.person_remove : Icons.person_add,
                size: 18,
                color: isFriend ? Colors.red : _teal,
              ),
              onPressed: () async {
                final db = ref.read(databaseProvider);
                if (isFriend) {
                  await db.removeFriend(presence.userId);
                } else {
                  try {
                    final user = await ref
                        .read(apiClientProvider)
                        .getUser(presence.login);
                    final mainCursus = user.cursusUsers.firstWhere(
                      (c) => c.cursus?.slug == '42cursus',
                      orElse: () => user.cursusUsers.isNotEmpty
                          ? user.cursusUsers.last
                          : throw Exception('no cursus'),
                    );
                    await db.addFriend(
                      userId: user.id,
                      login: user.login,
                      displayName: user.displayName,
                      imageUrl:
                          user.image?.versions?.medium ?? user.image?.link,
                      level: mainCursus.level,
                      blackholedAt: mainCursus.blackholedAt,
                    );
                  } catch (_) {
                    await db.addFriend(
                      userId: presence.userId,
                      login: presence.login,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
