import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ft_intra/core/auth/token_storage.dart';

class FakeSecureStorage implements FlutterSecureStorage {
  final Map<String, String> _store = {};

  @override
  Future<String?> read({
    required String key,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async => _store[key];

  @override
  Future<void> write({
    required String key,
    required String? value,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    if (value != null) {
      _store[key] = value;
    }
  }

  @override
  Future<void> delete({
    required String key,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    _store.remove(key);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late TokenStorage storage;

  setUp(() {
    storage = TokenStorage.native(storage: FakeSecureStorage());
  });

  group('U-T01: saveTokens and getAccessToken', () {
    test('saved token is retrievable', () async {
      await storage.saveTokens(
        accessToken: 'test_access_token_123',
        refreshToken: 'test_refresh_token_456',
        expiresIn: 7200,
      );

      final token = await storage.getAccessToken();
      expect(token, 'test_access_token_123');

      final refresh = await storage.getRefreshToken();
      expect(refresh, 'test_refresh_token_456');
    });

    test('saveTokens without refresh_token keeps only access_token', () async {
      await storage.saveTokens(accessToken: 'only_access');

      expect(await storage.getAccessToken(), 'only_access');
      expect(await storage.getRefreshToken(), isNull);
    });
  });

  group('U-T02: hasValidToken', () {
    test('returns true when token exists and not expired', () async {
      await storage.saveTokens(
        accessToken: 'valid_token',
        expiresIn: 7200,
      );

      expect(await storage.hasValidToken(), true);
    });

    test('returns false when token is expired', () async {
      await storage.saveTokens(
        accessToken: 'expired_token',
        expiresIn: -1,
      );

      expect(await storage.hasValidToken(), false);
    });

    test('returns false when no token saved', () async {
      expect(await storage.hasValidToken(), false);
    });
  });

  group('U-T03: clearTokens', () {
    test('clears all tokens', () async {
      await storage.saveTokens(
        accessToken: 'to_be_cleared',
        refreshToken: 'also_cleared',
        expiresIn: 7200,
      );

      await storage.clearTokens();

      expect(await storage.getAccessToken(), isNull);
      expect(await storage.getRefreshToken(), isNull);
      expect(await storage.hasValidToken(), false);
    });
  });
}
