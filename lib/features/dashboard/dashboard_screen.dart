import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/demo/demo_mode.dart';
import 'package:ft_intra/core/models/user.dart';
import 'package:ft_intra/features/dashboard/widgets/level_progress_card.dart';
import 'package:ft_intra/features/dashboard/widgets/blackhole_timer.dart';
import 'package:ft_intra/features/dashboard/widgets/eval_points_card.dart';
import 'package:ft_intra/features/dashboard/widgets/project_list_section.dart';
import 'package:ft_intra/features/dashboard/intra_webview.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Demo mode can't show the real intra WebView (no session), so use the
    // API-driven dashboard, which reads the mock currentUserProvider.
    if (!kIsWeb && !ref.watch(demoModeProvider)) {
      return const IntraWebView();
    }
    return const _ApiDashboard();
  }
}

class _ApiDashboard extends ConsumerWidget {
  const _ApiDashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);

    final s = ref.watch(stringsProvider);

    return Scaffold(
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('$err', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => ref.invalidate(currentUserProvider),
                child: Text(s.get('retry')),
              ),
            ],
          ),
        ),
        data: (user) => _DashboardContent(user: user),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  final FtUser user;
  const _DashboardContent({required this.user});

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

    final split = splitProjects(user.projectsUsers);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _UserHeader(user: user),
        const SizedBox(height: 16),
        if (cursus != null)
          LevelProgressCard(
            level: cursus.level,
            cursusName: cursus.cursus?.name ?? '42cursus',
          ),
        const SizedBox(height: 12),
        if (cursus != null)
          BlackholeTimer(blackholedAt: cursus.blackholedAt),
        const SizedBox(height: 12),
        EvalPointsCard(points: user.correctionPoint),
        const SizedBox(height: 24),
        ProjectListSection(
          title: '42cursus Projects',
          projects: split.cursus,
          onTap: (p) => context.push('/project-detail', extra: p),
        ),
        const SizedBox(height: 24),
        ProjectListSection(
          title: 'C Piscine Projects',
          projects: split.piscine,
          onTap: (p) => context.push('/project-detail', extra: p),
        ),
      ],
    );
  }
}

class _UserHeader extends StatelessWidget {
  final FtUser user;
  const _UserHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: const Color(0xFF00BABC),
              backgroundImage: user.image?.versions?.medium != null
                  ? CachedNetworkImageProvider(user.image!.versions!.medium!)
                  : null,
              child: user.image?.versions?.medium == null
                  ? Text(user.login.substring(0, 2).toUpperCase(),
                      style: const TextStyle(fontSize: 24))
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.login,
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(user.displayName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.grey)),
                  const SizedBox(height: 4),
                  Row(children: [
                    Icon(
                      user.location != null ? Icons.circle : Icons.circle_outlined,
                      size: 10,
                      color: user.location != null ? Colors.green : Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(user.location ?? 'unavailable',
                        style: TextStyle(
                            fontSize: 12,
                            color: user.location != null
                                ? Colors.green
                                : Colors.grey)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

