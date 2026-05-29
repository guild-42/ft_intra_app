import 'package:flutter/foundation.dart';

/// Geofence center + radius for a campus, used by the location-based check-in.
class CampusGeo {
  final int campusId;
  final double lat;
  final double lng;
  final double radiusMeters;

  const CampusGeo({
    required this.campusId,
    required this.lat,
    required this.lng,
    required this.radiusMeters,
  });
}

class FtConstants {
  FtConstants._();

  static const String apiBaseUrl = 'https://api.intra.42.fr';
  static const String oauthAuthorizeUrl = '$apiBaseUrl/oauth/authorize';
  static const String oauthTokenUrl = '$apiBaseUrl/oauth/token';

  // PKCE 用の public client_id（app 埋め込み可）。client_secret は app に持たせない
  // （PKCE は secret 不要。OAuth code 交換は backend /api/oauth/exchange が代行）。
  static const String clientId =
      'u-s4t2ud-b10fb627b168e381895af1d3e5c5e9f3ca43138b7fa88f538ec5b88f98c07150';

  static const String redirectUriMobile = 'ft-intra42://callback';
  static const String redirectUriWeb = 'http://localhost:8080/callback';

  static String get redirectUri => kIsWeb ? redirectUriWeb : redirectUriMobile;

  static const int campusIdTokyo = 26;

  // Location-based check-in: campus geofence centers/radius. 42 Tokyo is in
  // 六本木ヒルズ森タワー; these coords are approximate and should be fine-tuned
  // against on-device GPS readings. Radius is generous to cover the building.
  static const double campusTokyoLat = 35.6604;
  static const double campusTokyoLng = 139.7292;
  static const double campusCheckinRadiusMeters = 250;

  static const Map<int, CampusGeo> campusGeos = {
    campusIdTokyo: CampusGeo(
      campusId: campusIdTokyo,
      lat: campusTokyoLat,
      lng: campusTokyoLng,
      radiusMeters: campusCheckinRadiusMeters,
    ),
  };

  static CampusGeo? campusGeo(int campusId) => campusGeos[campusId];

  static const int rateLimitPerSecond = 2;
  static const int rateLimitPerHour = 1200;
  static const int defaultPageSize = 30;
  static const int maxPageSize = 100;

  static const String backendBaseUrl = String.fromEnvironment(
    'BACKEND_URL',
    defaultValue: 'https://ft-intra-1021337077830.asia-northeast1.run.app',
  );
}
