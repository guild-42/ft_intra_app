import 'package:dio/dio.dart';
import 'package:ft_intra/core/auth/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;

  /// The Dio this interceptor is installed on. Set after construction (the
  /// interceptor is created while building that same Dio) so the 401 retry
  /// re-enters the full interceptor stack instead of a bare client.
  Dio? retryDio;

  AuthInterceptor(this._tokenStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final alreadyRetried = err.requestOptions.extra['auth_retried'] == true;
    if (err.response?.statusCode == 401 && !alreadyRetried) {
      final refreshed = await _tryRefreshToken();
      if (refreshed) {
        final token = await _tokenStorage.getAccessToken();
        err.requestOptions.headers['Authorization'] = 'Bearer $token';
        // Loop guard: if the retry 401s again we fall through to the caller.
        err.requestOptions.extra['auth_retried'] = true;
        try {
          final response =
              await (retryDio ?? Dio()).fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          return handler.next(err);
        }
      }
    }
    handler.next(err);
  }

  Future<bool> _tryRefreshToken() async {
    final refreshToken = await _tokenStorage.getRefreshToken();
    if (refreshToken == null) return false;

    try {
      final dio = Dio();
      final response = await dio.post(
        'https://api.intra.42.fr/oauth/token',
        data: {
          'grant_type': 'refresh_token',
          'refresh_token': refreshToken,
          'client_id': await _tokenStorage.getClientId(),
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      final data = response.data as Map<String, dynamic>;
      await _tokenStorage.saveTokens(
        accessToken: data['access_token'] as String,
        refreshToken: data['refresh_token'] as String?,
        expiresIn: data['expires_in'] as int?,
      );
      return true;
    } catch (_) {
      await _tokenStorage.clearTokens();
      return false;
    }
  }
}
