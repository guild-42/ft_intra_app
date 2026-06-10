import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ft_intra/config/constants.dart';

class RateLimitInterceptor extends Interceptor {
  final int _maxPerSecond;
  final List<DateTime> _timestamps = [];

  /// The Dio this interceptor is installed on (set after construction) so the
  /// 429 retry re-enters the full stack — fresh auth header + rate limiting —
  /// instead of going out through a bare client.
  Dio? retryDio;

  RateLimitInterceptor({
    int maxPerSecond = FtConstants.rateLimitPerSecond,
  }) : _maxPerSecond = maxPerSecond;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await _waitForSlot();
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final alreadyRetried = err.requestOptions.extra['rate_retried'] == true;
    if (err.response?.statusCode == 429 && !alreadyRetried) {
      final retryAfter = err.response?.headers.value('retry-after');
      final waitSeconds = int.tryParse(retryAfter ?? '') ?? 2;
      await Future.delayed(Duration(seconds: waitSeconds));
      err.requestOptions.extra['rate_retried'] = true;
      try {
        final response = await (retryDio ?? Dio()).fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        return handler.next(err);
      }
    }
    handler.next(err);
  }

  Future<void> _waitForSlot() async {
    final now = DateTime.now();
    _timestamps.removeWhere(
      (t) => now.difference(t).inMilliseconds > 1000,
    );

    if (_timestamps.length >= _maxPerSecond) {
      final oldest = _timestamps.first;
      final waitMs = 1000 - now.difference(oldest).inMilliseconds;
      if (waitMs > 0) {
        await Future.delayed(Duration(milliseconds: waitMs));
      }
    }

    _timestamps.add(DateTime.now());
  }
}
