import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Retries transient connect-phase failures on idempotent requests.
///
/// api.intra.42.fr is Cloudflare-fronted with several edge IPs; dart:io has no
/// Happy-Eyeballs, so a single connect can stall the full connectTimeout on a
/// momentarily-bad path (seen as intermittent `connectionTimeout` on login and
/// the evaluations tab). Re-issuing the request re-resolves DNS and the IPv4
/// factory shuffles edges, so a retry usually lands on a healthy one.
///
/// Only GET/HEAD are retried (idempotent — safe to repeat). A mutating request
/// is left alone. An `extra` flag guards against unbounded loops.
class ConnectionRetryInterceptor extends Interceptor {
  final int maxRetries;

  /// The Dio this interceptor is installed on; retries re-enter the full stack.
  Dio? retryDio;

  ConnectionRetryInterceptor({this.maxRetries = 2});

  static const _attemptKey = 'conn_retry_attempt';

  bool _isTransient(DioException e) =>
      e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.connectionError;

  bool _isIdempotent(RequestOptions o) {
    final m = o.method.toUpperCase();
    return m == 'GET' || m == 'HEAD';
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final attempt = (err.requestOptions.extra[_attemptKey] as int?) ?? 0;
    if (_isTransient(err) &&
        _isIdempotent(err.requestOptions) &&
        attempt < maxRetries) {
      final next = attempt + 1;
      err.requestOptions.extra[_attemptKey] = next;
      final backoff = Duration(milliseconds: 400 * next);
      debugPrint('[net] ${err.requestOptions.path} ${err.type} — '
          'retry $next/$maxRetries in ${backoff.inMilliseconds}ms');
      await Future.delayed(backoff);
      try {
        final response = await (retryDio ?? Dio()).fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (_) {
        // Fall through; the rethrown error carries the latest attempt count.
      }
    }
    handler.next(err);
  }
}
