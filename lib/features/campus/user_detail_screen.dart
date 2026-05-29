import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/models/user.dart';
import 'package:ft_intra/shared/widgets/user_avatar.dart';

class UserDetailScreen extends ConsumerWidget {
  final String login;
  const UserDetailScreen({super.key, required this.login});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userDetailProvider(login));

    return Scaffold(
      appBar: AppBar(
        title: Text(login),
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            tooltip: 'Open in intranet',
            onPressed: () => context.push('/user-webview/$login'),
          ),
        ],
      ),
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 12),
                Text('$err', textAlign: TextAlign.center),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () => ref.invalidate(userDetailProvider(login)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (user) => _UserContent(user: user),
      ),
    );
  }
}

class _UserContent extends StatelessWidget {
  final FtUser user;
  const _UserContent({required this.user});

  CursusUser? get _mainCursus {
    try {
      return user.cursusUsers.firstWhere((c) => c.cursus?.slug == '42cursus');
    } catch (_) {
      return user.cursusUsers.isNotEmpty ? user.cursusUsers.last : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cursus = _mainCursus;
    final onCampus = user.location != null;
    final inProgress = user.projectsUsers
        .where((p) => p.status == 'in_progress' || p.status == 'waiting_for_correction')
        .toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                UserAvatar(
                  login: user.login,
                  imageUrl: user.image?.versions?.large ?? user.image?.link,
                  radius: 48,
                ),
                const SizedBox(height: 12),
                Text(user.displayName,
                    style: Theme.of(context).textTheme.titleLarge),
                Text('@${user.login}',
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      onCampus ? Icons.circle : Icons.circle_outlined,
                      size: 10,
                      color: onCampus ? Colors.green : Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      onCampus ? 'on campus · ${user.location}' : 'offline',
                      style: TextStyle(
                          color: onCampus ? Colors.green : Colors.grey,
                          fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (cursus != null) ...[
          Row(
            children: [
              Expanded(child: _StatCard(label: 'Level', value: cursus.level.toStringAsFixed(2))),
              const SizedBox(width: 8),
              Expanded(child: _BlackholeCard(blackholedAt: cursus.blackholedAt)),
            ],
          ),
          const SizedBox(height: 8),
        ],
        Row(
          children: [
            Expanded(child: _StatCard(label: 'Eval Points', value: '${user.correctionPoint}')),
            const SizedBox(width: 8),
            Expanded(child: _StatCard(label: 'Wallet', value: '${user.wallet} ₳')),
          ],
        ),
        if (inProgress.isNotEmpty) ...[
          const SizedBox(height: 24),
          Text('In Progress',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...inProgress.map((p) => Card(
                child: ListTile(
                  dense: true,
                  leading: const Icon(Icons.hourglass_empty, color: Colors.orange),
                  title: Text(p.project.name),
                  subtitle: Text(p.status),
                ),
              )),
        ],
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 4),
            Text(value,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _BlackholeCard extends StatelessWidget {
  final String? blackholedAt;
  const _BlackholeCard({this.blackholedAt});

  @override
  Widget build(BuildContext context) {
    if (blackholedAt == null) {
      return const _StatCard(label: 'Blackhole', value: '—');
    }
    final deadline = DateTime.tryParse(blackholedAt!);
    if (deadline == null) {
      return const _StatCard(label: 'Blackhole', value: '?');
    }
    final days = deadline.difference(DateTime.now()).inDays;
    final color = days < 30 ? Colors.red : (days < 90 ? Colors.orange : Colors.white);
    return Card(
      color: days < 30 ? Colors.red.shade900.withValues(alpha: 0.3) : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Blackhole', style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 4),
            Text('$days days',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: color)),
          ],
        ),
      ),
    );
  }
}
