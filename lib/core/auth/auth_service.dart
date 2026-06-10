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

  Future<bool> exchangeCode(String code) async {
    try {
      final response = await _dio.post(
        '${FtConstants.backendBaseUrl}/api/oauth/exchange',
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
      return true;
    } catch (e) {
      // Surface the real failure in the debug console (timeout / DNS / TLS /
      // HTTP status) instead of silently hanging or showing a generic message.
      debugPrint('exchangeCode failed: $e');
      if (e is DioException) {
        debugPrint('  type=${e.type} status=${e.response?.statusCode} '
            'data=${e.response?.data}');
      }
      return false;
    }
  }

  Future<bool> isLoggedIn() => _tokenStorage.hasValidToken();

  Future<void> logout() => _tokenStorage.clearTokens();
}
