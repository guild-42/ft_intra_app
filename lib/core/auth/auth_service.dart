import 'package:dio/dio.dart';
import 'package:ft_intra/config/constants.dart';
import 'package:ft_intra/core/auth/token_storage.dart';

class AuthService {
  final TokenStorage _tokenStorage;
  final Dio _dio;

  AuthService({
    required TokenStorage tokenStorage,
    Dio? dio,
  })  : _tokenStorage = tokenStorage,
        _dio = dio ?? Dio();

  String get authorizeUrl =>
      '${FtConstants.oauthAuthorizeUrl}'
      '?client_id=${FtConstants.clientId}'
      '&redirect_uri=${Uri.encodeComponent(FtConstants.redirectUri)}'
      '&response_type=code';

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
      return false;
    }
  }

  Future<bool> isLoggedIn() => _tokenStorage.hasValidToken();

  Future<void> logout() => _tokenStorage.clearTokens();
}
