import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';

class CallbackScreen extends ConsumerStatefulWidget {
  final String? code;
  const CallbackScreen({super.key, this.code});

  @override
  ConsumerState<CallbackScreen> createState() => _CallbackScreenState();
}

class _CallbackScreenState extends ConsumerState<CallbackScreen> {
  String _status = 'Exchanging authorization code...';

  @override
  void initState() {
    super.initState();
    _exchangeToken();
  }

  Future<void> _exchangeToken() async {
    if (widget.code == null) {
      setState(() => _status = 'Error: No authorization code received');
      return;
    }

    final authService = ref.read(authServiceProvider);
    final success = await authService.exchangeCode(widget.code!);

    if (success && mounted) {
      ref.invalidate(currentUserProvider);
      ref.read(friendWatcherProvider).start();
      context.go('/dashboard');
    } else if (mounted) {
      setState(() => _status = 'Login failed. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_status.startsWith('Error') && !_status.startsWith('Login failed'))
              const CircularProgressIndicator(),
            const SizedBox(height: 24),
            Text(_status),
            if (_status.startsWith('Error') || _status.startsWith('Login failed'))
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: FilledButton(
                  onPressed: () => context.go('/login'),
                  child: const Text('Back to Login'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
