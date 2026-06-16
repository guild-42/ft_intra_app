import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';

/// Cold-start decision screen (router initialLocation '/'). Restores the
/// session if a token is stored, otherwise shows login. Routing on token
/// presence (not expiry) so an expired-but-refreshable token still lands on the
/// dashboard — the auth interceptor refreshes on the first 401.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(_decide);
  }

  Future<void> _decide() async {
    final hasToken = await ref.read(authServiceProvider).hasToken();
    if (!mounted) return;
    context.go(hasToken ? '/dashboard' : '/login');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '42',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00BABC),
              ),
            ),
            SizedBox(height: 24),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
