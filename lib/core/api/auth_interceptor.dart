import 'package:dio/dio.dart';
import 'package:ft_intra/config/constants.dart';
import 'package:ft_intra/core/auth/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;

  /// The Dio this interceptor is installed on. Set after construction (the
  /// interceptor is created while building that same Dio) so the 401 retry
  /// re-enters the full interceptor stack instead of a bare client.
  Dio? retryDio;

  /// Single-flight refresh lock (static = shared across instances). Several 42
  /// API calls 401 at once when the access token expires; without this each one
  /// would refresh independently, but 42 ROTATES the refresh_token on use — only
  /// the first refresh succeeds and the rest fail with the now-stale token and
  /// wipe the freshly-saved valid tokens. Coalescing into one refresh fixes the
  /// "everything stays 401 / logged out" bug.
  static Future<bool>? _refreshInFlight;

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

  /// Coalesce concurrent refreshes into one in-flight operation.
  Future<bool> _tryRefreshToken() {
    return _refreshInFlight ??=
        _doRefresh().whenComplete(() => _refreshInFlight = null);
  }

  Future<bool> _doRefresh() async {
    final refreshToken = await _tokenStorage.getRefreshToken();
    if (refreshToken == null) return false;

    try {
      // The 42 app is a confidential client: the refresh grant needs
      // client_secret, which only the backend holds. Refresh via the backend,
      // not 42 directly (the device has no secret).
      final dio = Dio();
      final response = await dio.post(
        '${FtConstants.backendBaseUrl}/api/oauth/refresh',
        data: {'refresh_token': refreshToken},
      );

      final data = response.data as Map<String, dynamic>;
      await _tokenStorage.saveTokens(
        accessToken: data['access_token'] as String,
        refreshToken: data['refresh_token'] as String?,
        expiresIn: data['expires_in'] as int?,
      );
      return true;
    } on DioException catch (e) {
      // Only force re-login when 42 actually rejected the refresh token
      // (4xx). On network/5xx/timeout, keep the tokens so a later retry can
      // recover instead of logging the user out on a transient blip.
      final status = e.response?.statusCode;
      if (status != null && status >= 400 && status < 500) {
        await _tokenStorage.clearTokens();
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
