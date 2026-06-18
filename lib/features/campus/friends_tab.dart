import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/db/app_database.dart';
import 'package:ft_intra/core/friends/friends_service.dart';
import 'package:ft_intra/shared/widgets/user_avatar.dart';
import 'package:ft_intra/features/campus/campus_helpers.dart';

class FriendsTab extends ConsumerWidget {
  const FriendsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendsAsync = ref.watch(friendsStreamProvider);
    final graphAsync = ref.watch(friendGraphProvider);
    // Friends currently checked in. Used so a friend who is only checked in
    // still counts as present.
    final checkedInIds = ref.watch(checkedInIdsProvider).maybeWhen(
          data: (ids) => ids,
          orElse: () => const <int>{},
        );

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(friendGraphProvider),
        child: friendsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text('Error: $err')),
          data: (friends) {
            final graph = graphAsync.maybeWhen(
                data: (g) => g, orElse: () => const FriendGraph());
            // Always surface incoming requests (consent to let them watch you),
            // even if that person is also in your local list.
            final incoming = graph.incoming;

            // Present = logged in (cluster) OR checked in. Sort present first.
            bool present(Friend f) =>
                f.lastSeenLocation != null || checkedInIds.contains(f.userId);
            final sorted = [...friends];
            sorted.sort((a, b) {
              final ap = present(a);
              final bp = present(b);
              if (ap && !bp) return -1;
              if (!ap && bp) return 1;
              return a.login.compareTo(b.login);
            });

            return ListView(
              children: [
                if (incoming.isNotEmpty) ...[
                  const _SectionLabel('Notification requests'),
                  for (final r in incoming) _IncomingTile(request: r),
                ],
                if (friends.isNotEmpty) const _SectionLabel('Friends'),
                if (friends.isEmpty && incoming.isEmpty)
                  const Padding(
                    padding: EdgeInsets.fromLTRB(32, 80, 32, 32),
                    child: Column(
                      children: [
                        Icon(Icons.people_outline, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text('No friends yet',
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Tap + to add by intra name',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                for (final f in sorted)
                  _FriendTile(
                    friend: f,
                    checkedIn: checkedInIds.contains(f.userId),
                    notifyState: graph.stateOf(f.userId),
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00BABC),
        onPressed: () => _showAddDialog(context, ref),
        child: const Icon(Icons.person_add),
      ),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add friend'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Intra name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final login = controller.text.trim();
              if (login.isEmpty) return;
              Navigator.pop(ctx);
              await _addLocal(context, ref, login);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Future<void> _addLocal(
      BuildContext context, WidgetRef ref, String login) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final added = await ref.read(friendsServiceProvider).addLocal(login);
      messenger.showSnackBar(SnackBar(
          content: Text('Added $added'), backgroundColor: Colors.green));
    } catch (_) {
      messenger.showSnackBar(SnackBar(
          content: Text('Not found: $login'), backgroundColor: Colors.red));
    }
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        text,
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

/// Someone wants to be notified about your logins (they enabled notify for you).
/// Accepting lets the server push them when you log in.
class _IncomingTile extends ConsumerWidget {
  final FriendRequest request;
  const _IncomingTile({required this.request});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: UserAvatar(login: request.login, radius: 22),
        title: Text(request.login,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: const Text('wants login notifications about you'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.check_circle, color: Colors.green),
              onPressed: () => _respond(ref, true),
            ),
            IconButton(
              icon: const Icon(Icons.cancel, color: Colors.redAccent),
              onPressed: () => _respond(ref, false),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _respond(WidgetRef ref, bool accept) async {
    await ref
        .read(friendsServiceProvider)
        .respondIncoming(request.userId, accept);
    ref.invalidate(friendGraphProvider);
  }
}

class _FriendTile extends ConsumerWidget {
  final Friend friend;
  final bool checkedIn;
  final FriendNotifyState notifyState;
  const _FriendTile({
    required this.friend,
    this.checkedIn = false,
    this.notifyState = FriendNotifyState.off,
  });

  int? get _blackholeDays {
    if (friend.blackholedAt == null) return null;
    final dt = DateTime.tryParse(friend.blackholedAt!);
    if (dt == null) return null;
    return dt.difference(DateTime.now()).inDays;
  }

  String _formatLastSeen(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${dt.month}/${dt.day}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final loggedIn = friend.lastSeenLocation != null;
    // Present via either source; logged-in shows the cluster, check-in-only
    // shows the check-in badge.
    final isOnline = loggedIn || checkedIn;
    final displayLabel = friend.nickname?.isNotEmpty == true
        ? friend.nickname!
        : friend.login;
    final bhDays = _blackholeDays;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      color: isOnline ? const Color(0xFF00BABC).withValues(alpha: 0.12) : null,
      child: ListTile(
        onTap: () => context.push('/user/${friend.login}'),
        leading: Stack(
          children: [
            UserAvatar(
              login: friend.login,
              imageUrl: friend.imageUrl,
              radius: 22,
            ),
            if (isOnline)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
          ],
        ),
        title: Row(
          children: [
            Flexible(
              child: Text(displayLabel,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis),
            ),
            if (friend.level != null) ...[
              const SizedBox(width: 6),
              Text('L${friend.level!.toStringAsFixed(1)}',
                  style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF00BABC),
                      fontWeight: FontWeight.bold)),
            ],
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              friend.nickname?.isNotEmpty == true
                  ? '@${friend.login}'
                  : (friend.displayName ?? ''),
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
            Row(
              children: [
                if (loggedIn) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      clusterFromHost(friend.lastSeenLocation!),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  const SizedBox(width: 6),
                ] else if (checkedIn) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00BABC).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.location_on,
                            size: 10, color: Color(0xFF00BABC)),
                        const SizedBox(width: 2),
                        Text(
                          s.get('checkin_badge'),
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00BABC)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                ] else if (friend.lastSeenAt != null) ...[
                  Text(
                    'Last: ${_formatLastSeen(friend.lastSeenAt!)}',
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  const SizedBox(width: 6),
                ],
                if (bhDays != null)
                  Text(
                    '🕳 ${bhDays}d',
                    style: TextStyle(
                      fontSize: 10,
                      color: bhDays < 30
                          ? Colors.red
                          : (bhDays < 90 ? Colors.orange : Colors.grey),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _NotifyButton(friend: friend, state: notifyState),
            if (friend.discordDmUrl != null && friend.discordDmUrl!.isNotEmpty)
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.chat_bubble, size: 20, color: Color(0xFF5865F2)),
                onPressed: () => _openDiscord(friend.discordDmUrl!),
              ),
            PopupMenuButton<String>(
              onSelected: (action) async {
                switch (action) {
                  case 'rename':
                    _showRenameDialog(context, ref);
                    break;
                  case 'discord':
                    _showDiscordDialog(context, ref);
                    break;
                  case 'remove':
                    await ref
                        .read(friendsServiceProvider)
                        .removeLocal(friend.userId);
                    ref.invalidate(friendGraphProvider);
                    break;
                }
              },
              itemBuilder: (ctx) => [
                const PopupMenuItem(value: 'rename', child: Text('Set nickname')),
                const PopupMenuItem(value: 'discord', child: Text('Set Discord DM')),
                const PopupMenuItem(
                  value: 'remove',
                  child: Text('Remove', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showRenameDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController(text: friend.nickname ?? '');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Nickname for ${friend.login}'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Empty to clear',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel')),
          FilledButton(
            onPressed: () async {
              final value = controller.text.trim();
              await ref
                  .read(databaseProvider)
                  .setNickname(friend.userId, value.isEmpty ? null : value);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDiscordDialog(BuildContext context, WidgetRef ref) {
    final s = ref.read(stringsProvider);
    final controller = TextEditingController(text: friend.discordDmUrl ?? '');
    const exampleId = '0000000000000000000';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('${s.get('discord_dialog_title')} — ${friend.login}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(s.get('discord_dialog_method'),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(s.get('discord_dialog_step1'),
                  style: const TextStyle(fontSize: 11, color: Colors.grey)),
              Text(s.get('discord_dialog_step2'),
                  style: const TextStyle(fontSize: 11, color: Colors.grey)),
              Text(s.get('discord_dialog_step3'),
                  style: const TextStyle(fontSize: 11, color: Colors.grey)),
              const SizedBox(height: 8),
              Text(s.get('discord_dialog_url_label'),
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.w600)),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  s.get('discord_dialog_url_example'),
                  style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'monospace',
                      color: Color(0xFF00BABC)),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller,
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '${s.get('discord_dialog_example')}: $exampleId',
                  labelText: s.get('discord_dialog_hint'),
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel')),
          FilledButton(
            onPressed: () async {
              final value = controller.text
                  .trim()
                  .replaceAll(RegExp(r'[^0-9]'), '');
              await ref
                  .read(databaseProvider)
                  .setDiscordDmUrl(friend.userId, value.isEmpty ? null : value);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _openDiscord(String channelId) async {
    final discordUri = Uri.parse('discord://discord.com/channels/@me/$channelId');
    await launchUrl(discordUri, mode: LaunchMode.externalApplication);
  }
}

/// Per-friend login-notification control with mutual-consent state:
///  off     → grey bell-off. Tap: send friend request (→ pending).
///  pending → orange hourglass. Tap: cancel the request.
///  on      → teal bell. Tap: turn off (remove the accepted edge).
class _NotifyButton extends ConsumerWidget {
  final Friend friend;
  final FriendNotifyState state;
  const _NotifyButton({required this.friend, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (icon, color, tip) = switch (state) {
      FriendNotifyState.on => (
          Icons.notifications_active,
          const Color(0xFF00BABC),
          'Login notifications on'
        ),
      FriendNotifyState.pending => (
          Icons.hourglass_top,
          Colors.orange,
          'Request pending — tap to cancel'
        ),
      FriendNotifyState.off => (
          Icons.notifications_off_outlined,
          Colors.grey,
          'Turn on login notifications'
        ),
    };
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      tooltip: tip,
      icon: Icon(icon, size: 20, color: color),
      onPressed: () => _onTap(context, ref),
    );
  }

  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    final service = ref.read(friendsServiceProvider);
    if (state == FriendNotifyState.off) {
      final status = await service.enableNotify(friend.userId, friend.login);
      final msg = switch (status) {
        'pending' =>
          'Request sent to ${friend.login}. You\'ll be notified once they accept.',
        'accepted' || 'already_friends' =>
          'Login notifications on for ${friend.login}',
        _ => 'Could not send request to ${friend.login}',
      };
      messenger.showSnackBar(SnackBar(content: Text(msg)));
    } else {
      await service.disableNotify(friend.userId);
    }
    ref.invalidate(friendGraphProvider);
  }
}
