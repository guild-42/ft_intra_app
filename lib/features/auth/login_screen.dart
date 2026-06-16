import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/auth/web_redirect.dart';
import 'package:ft_intra/core/demo/demo_mode.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '42',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00BABC),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'ft_intra',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 48),
              FilledButton.icon(
                onPressed: () {
                  final authService = ref.read(authServiceProvider);
                  webRedirect(authService.authorizeUrl);
                },
                icon: const Icon(Icons.login),
                label: Text(s.get('login_to_intranet')),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(240, 52),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  enterDemoMode(ref);
                  context.go('/dashboard');
                },
                child: Text(s.get('try_demo')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
