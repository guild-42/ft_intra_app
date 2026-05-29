import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ft_intra/config/constants.dart';

class RateLimitInterceptor extends Interceptor {
  final int _maxPerSecond;
  final List<DateTime> _timestamps = [];
  final _lock = Completer<void>()..complete();
  Completer<void>? _waiting;

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
    if (err.response?.statusCode == 429) {
      final retryAfter = err.response?.headers.value('retry-after');
      final waitSeconds = int.tryParse(retryAfter ?? '') ?? 2;
      await Future.delayed(Duration(seconds: waitSeconds));
      try {
        final response = await Dio().fetch(err.requestOptions);
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
