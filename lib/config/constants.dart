import 'package:flutter/foundation.dart';

class FtConstants {
  FtConstants._();

  static const String apiBaseUrl = 'https://api.intra.42.fr';
  static const String oauthAuthorizeUrl = '$apiBaseUrl/oauth/authorize';
  static const String oauthTokenUrl = '$apiBaseUrl/oauth/token';

  // PKCE 用の public client_id（app 埋め込み可）。client_secret は app に持たせない
  // （PKCE は secret 不要。OAuth code 交換は backend /api/oauth/exchange が代行）。
  static const String clientId =
      'u-s4t2ud-4a065c9caaecc660cbfc6a25c16142b54fdb125b9250f10da7c78163e08ae5ea';

  static const String redirectUriMobile = 'ft-intra42://callback';
  static const String redirectUriWeb = 'http://localhost:8080/callback';

  static String get redirectUri => kIsWeb ? redirectUriWeb : redirectUriMobile;

  static const int campusIdTokyo = 26;

  static const int rateLimitPerSecond = 2;
  static const int rateLimitPerHour = 1200;
  static const int defaultPageSize = 30;
  static const int maxPageSize = 100;

  static const String backendBaseUrl = String.fromEnvironment(
    'BACKEND_URL',
    defaultValue: 'https://ft-intra.guild42.net',
  );
}
