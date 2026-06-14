import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ft_intra/config/constants.dart';
import 'package:ft_intra/core/api/ipv4_http.dart';
import 'package:ft_intra/core/auth/token_storage.dart';

class AuthService {
  final TokenStorage _tokenStorage;
  final Dio _dio;

  AuthService({
    required TokenStorage tokenStorage,
    Dio? dio,
  })  : _tokenStorage = tokenStorage,
        _dio = dio ?? _defaultDio();

  // Explicit timeouts (Dio defaults to none → a stalled connection hangs the
  // "Exchanging authorization code…" screen) + IPv4-preferred connections to
  // dodge broken-IPv6 networks that otherwise cause intermittent timeouts.
  static Dio _defaultDio() {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 40),
    ));
    applyIpv4Preference(dio);
    return dio;
  }

  // `projects` scope is required for scale_teams (reviews) and slots; without
  // it those endpoints 403 / return empty. Must also be enabled on the 42 app.
  String get authorizeUrl =>
      '${FtConstants.oauthAuthorizeUrl}'
      '?client_id=${FtConstants.clientId}'
      '&redirect_uri=${Uri.encodeComponent(FtConstants.redirectUri)}'
      '&response_type=code'
      '&scope=${Uri.encodeComponent('public projects')}';

  // The OAuth code is consumed by 42 only on a SUCCESSFUL exchange, and a
  // connect-phase failure never reaches the backend, so the same code is still
  // valid to retry. Cloudflare resolves to multiple edge IPs and dart:io has no
  // Happy-Eyeballs, so a single attempt can stall the full connectTimeout on a
  // momentarily-bad path (users saw login succeed on the 2nd–3rd try). Retry
  // transparently on connect-phase errors so the user doesn't have to.
  static const _maxExchangeAttempts = 3;

  Future<bool> exchangeCode(String code) async {
    // [auth] is the grep tag for the whole login token-exchange flow.
    final endpoint = '${FtConstants.backendBaseUrl}/api/oauth/exchange';
    debugPrint('[auth] exchangeCode start → $endpoint '
        '(redirect_uri=${FtConstants.redirectUri}, code=${_short(code)})');

    for (var attempt = 1; attempt <= _maxExchangeAttempts; attempt++) {
      final sw = Stopwatch()..start();
      try {
        debugPrint('[auth] attempt $attempt/$_maxExchangeAttempts POST …');
        final response = await _dio.post(
          endpoint,
          data: {
            'code': code,
            'redirect_uri': FtConstants.redirectUri,
          },
        );

        final data = response.data as Map<String, dynamic>;
        await _tokenStorage.saveTokens(
          accessToken: data['access_token'] as String,
          refreshToken: data['refresh_token'] as String?,
          expiresIn: data['expires_in'] as int?,
        );
        debugPrint('[auth] SUCCESS on attempt $attempt in ${sw.elapsedMilliseconds}ms '
            '(scope=${data['scope']}, expires_in=${data['expires_in']})');
        return true;
      } on DioException catch (e) {
        final transient = e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.connectionError;
        debugPrint('[auth] attempt $attempt FAILED after ${sw.elapsedMilliseconds}ms: '
            'type=${e.type} status=${e.response?.statusCode} '
            'transient=$transient data=${e.response?.data}');
        // Only connect-phase failures are safe + worth retrying; a server
        // response (e.g. 401 invalid_grant) is terminal — the code is spent.
        if (transient && attempt < _maxExchangeAttempts) {
          final backoff = Duration(milliseconds: 400 * attempt);
          debugPrint('[auth] retrying in ${backoff.inMilliseconds}ms …');
          await Future.delayed(backoff);
          continue;
        }
        debugPrint('[auth] GIVING UP after $attempt attempt(s)');
        return false;
      } catch (e) {
        debugPrint('[auth] non-Dio failure on attempt $attempt: $e');
        return false;
      }
    }
    return false;
  }

  // Redact all but the first/last few chars of a secret for safe logging.
  static String _short(String s) =>
      s.length <= 10 ? '***' : '${s.substring(0, 4)}…${s.substring(s.length - 4)}';

  Future<bool> isLoggedIn() => _tokenStorage.hasValidToken();

  Future<void> logout() => _tokenStorage.clearTokens();
}
