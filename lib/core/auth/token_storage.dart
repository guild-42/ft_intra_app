import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenStorage {
  factory TokenStorage() {
    if (kIsWeb) return _WebTokenStorage();
    return _NativeTokenStorage();
  }

  // For testing
  factory TokenStorage.web() = _WebTokenStorage;
  factory TokenStorage.native({FlutterSecureStorage? storage}) = _NativeTokenStorage;

  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<String?> getClientId();
  Future<void> saveTokens({required String accessToken, String? refreshToken, int? expiresIn});
  Future<bool> hasValidToken();

  /// True if any access token is stored, regardless of expiry. Cold-start
  /// routing uses this (not hasValidToken): an expired-but-refreshable token
  /// should still land on the dashboard — the auth interceptor refreshes on the
  /// first 401.
  Future<bool> hasToken();
  Future<void> clearTokens();
}

const _keyAccessToken = 'ft_access_token';
const _keyRefreshToken = 'ft_refresh_token';
const _keyExpiresAt = 'ft_expires_at';
const _keyClientId = 'ft_client_id';

class _WebTokenStorage implements TokenStorage {
  @override
  Future<String?> getAccessToken() async =>
      (await SharedPreferences.getInstance()).getString(_keyAccessToken);

  @override
  Future<String?> getRefreshToken() async =>
      (await SharedPreferences.getInstance()).getString(_keyRefreshToken);

  @override
  Future<String?> getClientId() async =>
      (await SharedPreferences.getInstance()).getString(_keyClientId);

  @override
  Future<void> saveTokens({required String accessToken, String? refreshToken, int? expiresIn}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAccessToken, accessToken);
    if (refreshToken != null) await prefs.setString(_keyRefreshToken, refreshToken);
    if (expiresIn != null) {
      final expiresAt = DateTime.now().add(Duration(seconds: expiresIn));
      await prefs.setString(_keyExpiresAt, expiresAt.toIso8601String());
    }
  }

  @override
  Future<bool> hasValidToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_keyAccessToken);
    if (token == null) return false;
    final expiresAtStr = prefs.getString(_keyExpiresAt);
    if (expiresAtStr == null) return true;
    final expiresAt = DateTime.tryParse(expiresAtStr);
    if (expiresAt == null) return true;
    return DateTime.now().isBefore(expiresAt);
  }

  @override
  Future<bool> hasToken() async =>
      (await SharedPreferences.getInstance()).getString(_keyAccessToken) != null;

  @override
  Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAccessToken);
    await prefs.remove(_keyRefreshToken);
    await prefs.remove(_keyExpiresAt);
  }
}

class _NativeTokenStorage implements TokenStorage {
  final FlutterSecureStorage _storage;

  _NativeTokenStorage({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              // Make the token readable from the geofence/notification
              // background isolate even while the device is locked (after the
              // first unlock since boot). Without this, background check-in /
              // check-out POSTs can't read the access token. `*_this_device`
              // also keeps the token off iCloud Keychain sync.
              iOptions: IOSOptions(
                accessibility: KeychainAccessibility.first_unlock_this_device,
              ),
              aOptions: AndroidOptions(encryptedSharedPreferences: true),
            );

  @override
  Future<String?> getAccessToken() => _storage.read(key: _keyAccessToken);
  @override
  Future<String?> getRefreshToken() => _storage.read(key: _keyRefreshToken);
  @override
  Future<String?> getClientId() => _storage.read(key: _keyClientId);

  @override
  Future<void> saveTokens({required String accessToken, String? refreshToken, int? expiresIn}) async {
    await _storage.write(key: _keyAccessToken, value: accessToken);
    if (refreshToken != null) await _storage.write(key: _keyRefreshToken, value: refreshToken);
    if (expiresIn != null) {
      final expiresAt = DateTime.now().add(Duration(seconds: expiresIn));
      await _storage.write(key: _keyExpiresAt, value: expiresAt.toIso8601String());
    }
  }

  @override
  Future<bool> hasValidToken() async {
    final token = await getAccessToken();
    if (token == null) return false;
    final expiresAtStr = await _storage.read(key: _keyExpiresAt);
    if (expiresAtStr == null) return true;
    final expiresAt = DateTime.tryParse(expiresAtStr);
    if (expiresAt == null) return true;
    return DateTime.now().isBefore(expiresAt);
  }

  @override
  Future<bool> hasToken() async => (await getAccessToken()) != null;

  @override
  Future<void> clearTokens() async {
    await _storage.delete(key: _keyAccessToken);
    await _storage.delete(key: _keyRefreshToken);
    await _storage.delete(key: _keyExpiresAt);
  }
}
