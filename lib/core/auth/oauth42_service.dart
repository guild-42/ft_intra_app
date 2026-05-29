import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:ft_intra/config/constants.dart';
import 'package:ft_intra/core/auth/token_storage.dart';

class OAuth42Service {
  final FlutterAppAuth _appAuth;
  final TokenStorage _tokenStorage;
  final String clientId;

  OAuth42Service({
    required this.clientId,
    required TokenStorage tokenStorage,
    FlutterAppAuth? appAuth,
  })  : _tokenStorage = tokenStorage,
        _appAuth = appAuth ?? const FlutterAppAuth();

  Future<bool> login() async {
    try {
      final result = await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          FtConstants.redirectUri,
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: FtConstants.oauthAuthorizeUrl,
            tokenEndpoint: FtConstants.oauthTokenUrl,
          ),
          scopes: ['public'],
        ),
      );

      if (result?.accessToken == null) return false;

      await _tokenStorage.saveClientId(clientId);
      final expiration = result!.accessTokenExpirationDateTime;
      await _tokenStorage.saveTokens(
        accessToken: result.accessToken!,
        refreshToken: result.refreshToken,
        expiresIn: expiration?.difference(DateTime.now()).inSeconds,
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> logout() async {
    await _tokenStorage.clearTokens();
  }
}
