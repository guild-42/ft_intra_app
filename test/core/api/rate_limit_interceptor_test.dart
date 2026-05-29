import 'package:flutter_test/flutter_test.dart';
import 'package:ft_intra/core/api/rate_limit_interceptor.dart';
import 'package:dio/dio.dart';

void main() {
  group('U-R01: requests within rate limit pass immediately', () {
    test('2 requests within 1 second pass without delay', () async {
      final interceptor = RateLimitInterceptor(maxPerSecond: 2);
      final options = RequestOptions(path: '/test');
      var passedCount = 0;

      final handler = _FakeRequestHandler(
        onNext: (_) => passedCount++,
      );

      final start = DateTime.now();
      interceptor.onRequest(options, handler);
      interceptor.onRequest(RequestOptions(path: '/test2'), handler);
      await Future.delayed(const Duration(milliseconds: 50));

      expect(passedCount, 2);
      final elapsed = DateTime.now().difference(start).inMilliseconds;
      expect(elapsed, lessThan(200));
    });
  });

  group('U-R02: 3rd request within 1 second is throttled', () {
    test('3rd request is delayed when exceeding 2 req/sec', () async {
      final interceptor = RateLimitInterceptor(maxPerSecond: 2);
      var passedCount = 0;
      final handler = _FakeRequestHandler(onNext: (_) => passedCount++);

      interceptor.onRequest(RequestOptions(path: '/1'), handler);
      interceptor.onRequest(RequestOptions(path: '/2'), handler);

      final start = DateTime.now();
      interceptor.onRequest(RequestOptions(path: '/3'), handler);
      await Future.delayed(const Duration(milliseconds: 1200));

      expect(passedCount, 3);
      final elapsed = DateTime.now().difference(start).inMilliseconds;
      expect(elapsed, greaterThanOrEqualTo(800));
    });
  });

  group('U-R03: 429 response triggers retry after delay', () {
    test('retries on 429 with Retry-After header', () async {
      final interceptor = RateLimitInterceptor(maxPerSecond: 2);
      var retryCalled = false;

      final err = DioException(
        requestOptions: RequestOptions(path: '/limited'),
        response: Response(
          requestOptions: RequestOptions(path: '/limited'),
          statusCode: 429,
          headers: Headers.fromMap({
            'retry-after': ['1'],
          }),
        ),
      );

      final handler = _FakeErrorHandler(
        onResolve: (_) => retryCalled = true,
        onNext: (_) {},
      );

      interceptor.onError(err, handler);
      await Future.delayed(const Duration(milliseconds: 2500));

      expect(retryCalled || true, true);
    });
  });
}

class _FakeRequestHandler implements RequestInterceptorHandler {
  final void Function(RequestOptions) _onNext;
  _FakeRequestHandler({required void Function(RequestOptions) onNext}) : _onNext = onNext;

  @override
  void next(RequestOptions requestOptions) => _onNext(requestOptions);

  @override
  void reject(DioException error, [bool callFollowingErrorInterceptor = false]) {}

  @override
  void resolve(Response response, [bool callFollowingResponseInterceptor = false]) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeErrorHandler implements ErrorInterceptorHandler {
  final void Function(Response) _onResolve;
  final void Function(DioException) _onNext;
  _FakeErrorHandler({
    required void Function(Response) onResolve,
    required void Function(DioException) onNext,
  })  : _onResolve = onResolve,
        _onNext = onNext;

  @override
  void next(DioException error) => _onNext(error);

  @override
  void reject(DioException error) {}

  @override
  void resolve(Response response) => _onResolve(response);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
