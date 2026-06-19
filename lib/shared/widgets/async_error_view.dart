import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';

/// True when [error] means the session is no longer valid and the user must log
/// in again (the auth interceptor already tried to refresh and failed, so a 401
/// surfaced here).
bool isAuthError(Object? error) =>
    error is DioException && error.response?.statusCode == 401;

/// Standard error state for AsyncValue.when(error: ...).
///
/// - Session expired (401): shows a **Re-login** button instead of a raw error.
/// - Otherwise: shows the message (or the error) with a **Retry** button.
class AsyncErrorView extends ConsumerWidget {
  final Object error;
  final VoidCallback onRetry;

  /// Optional custom message for non-auth errors (e.g. describeApiError()).
  final String? message;

  const AsyncErrorView({
    super.key,
    required this.error,
    required this.onRetry,
    this.message,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);

    if (isAuthError(error)) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline, color: Colors.orange, size: 48),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(s.get('session_expired'), textAlign: TextAlign.center),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF00BABC)),
              icon: const Icon(Icons.login),
              label: Text(s.get('relogin')),
              onPressed: () => _relogin(context, ref),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(message ?? '$error', textAlign: TextAlign.center),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: onRetry,
            child: Text(s.get('retry')),
          ),
        ],
      ),
    );
  }

  Future<void> _relogin(BuildContext context, WidgetRef ref) async {
    await ref.read(authServiceProvider).logout();
    if (context.mounted) context.go('/login');
  }
}
