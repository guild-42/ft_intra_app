import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';

enum _CallbackState { exchanging, noCode, failed }

class CallbackScreen extends ConsumerStatefulWidget {
  final String? code;
  const CallbackScreen({super.key, this.code});

  @override
  ConsumerState<CallbackScreen> createState() => _CallbackScreenState();
}

class _CallbackScreenState extends ConsumerState<CallbackScreen> {
  _CallbackState _state = _CallbackState.exchanging;

  @override
  void initState() {
    super.initState();
    _exchangeToken();
  }

  Future<void> _exchangeToken() async {
    if (widget.code == null) {
      setState(() => _state = _CallbackState.noCode);
      return;
    }

    final authService = ref.read(authServiceProvider);
    final success = await authService.exchangeCode(widget.code!);

    if (success && mounted) {
      ref.invalidate(currentUserProvider);
      ref.read(friendWatcherProvider).start();
      context.go('/dashboard');
    } else if (mounted) {
      setState(() => _state = _CallbackState.failed);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    final message = switch (_state) {
      _CallbackState.exchanging => s.get('exchanging_code'),
      _CallbackState.noCode => s.get('error_no_code'),
      _CallbackState.failed => s.get('login_failed'),
    };
    final isError = _state != _CallbackState.exchanging;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isError) const CircularProgressIndicator(),
            const SizedBox(height: 24),
            Text(message),
            if (isError)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: FilledButton(
                  onPressed: () => context.go('/login'),
                  child: Text(s.get('back_to_login')),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
