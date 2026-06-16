import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ft_intra/core/api/backend_client.dart';
import 'package:ft_intra/core/auth/token_storage.dart';
import 'package:ft_intra/core/checkin/checkin_models.dart';
import 'package:ft_intra/core/checkin/checkin_service.dart';
import 'package:ft_intra/core/checkin/checkin_state.dart';

class _FakeBackend extends BackendClient {
  _FakeBackend();
  bool checkInOk = true;
  bool checkOutOk = true;
  int checkInCalls = 0;
  int checkOutCalls = 0;
  int heartbeatCalls = 0;

  @override
  Future<bool> checkIn({required String accessToken, required int campusId}) async {
    checkInCalls++;
    return checkInOk;
  }

  @override
  Future<bool> checkOut({required String accessToken, required int campusId}) async {
    checkOutCalls++;
    return checkOutOk;
  }

  @override
  Future<bool> heartbeat({required String accessToken}) async {
    heartbeatCalls++;
    return true;
  }
}

class _FakeTokenStorage implements TokenStorage {
  _FakeTokenStorage({this.token = 'tok'});
  final String? token;

  @override
  Future<String?> getAccessToken() async => token;
  @override
  Future<String?> getRefreshToken() async => null;
  @override
  Future<String?> getClientId() async => null;
  @override
  Future<void> saveTokens({required String accessToken, String? refreshToken, int? expiresIn}) async {}
  @override
  Future<bool> hasValidToken() async => token != null;
  @override
  Future<bool> hasToken() async => token != null;
  @override
  Future<void> clearTokens() async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeBackend backend;
  late CheckinService service;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    backend = _FakeBackend();
    service = CheckinService(backend: backend, tokenStorage: _FakeTokenStorage());
  });

  test('U-CK01/02: checkIn success marks active and clears pending', () async {
    final ok = await service.checkIn(26);
    expect(ok, isTrue);
    expect(backend.checkInCalls, 1);

    final snap = await CheckinLocalState.read();
    expect(snap.isCheckedIn, isTrue);
    expect(snap.campusId, 26);
    expect(await CheckinLocalState.readPending(), isNull);
  });

  test('U-CK03: checkIn failure queues pending; syncPending replays it', () async {
    backend.checkInOk = false;
    final ok = await service.checkIn(26);
    expect(ok, isFalse);

    final pending = await CheckinLocalState.readPending();
    expect(pending, isNotNull);
    expect(pending!.action, 'checkin');
    expect(pending.campusId, 26);

    backend.checkInOk = true;
    await service.syncPending();

    expect(backend.checkInCalls, 2);
    expect(await CheckinLocalState.readPending(), isNull);
    expect((await CheckinLocalState.read()).isCheckedIn, isTrue);
  });

  test('checkOut success clears active state', () async {
    await service.checkIn(26);
    final ok = await service.checkOut(26);
    expect(ok, isTrue);
    expect((await CheckinLocalState.read()).isCheckedIn, isFalse);
  });

  test('syncPending heartbeats when checked in and nothing pending', () async {
    await service.checkIn(26);
    await service.syncPending();
    expect(backend.heartbeatCalls, 1);
  });

  test('no token: checkIn is a no-op failure', () async {
    final s = CheckinService(backend: backend, tokenStorage: _FakeTokenStorage(token: null));
    expect(await s.checkIn(26), isFalse);
    expect(backend.checkInCalls, 0);
  });

  test('CheckedInUser.fromJson parses backend shape', () {
    final u = CheckedInUser.fromJson({
      'user_id': 7,
      'login': 'ssekikaw',
      'campus_id': 26,
      'source': 'geo',
      'checked_in_at': '2026-05-29T04:00:00+00:00',
    });
    expect(u.login, 'ssekikaw');
    expect(u.campusId, 26);
    expect(u.checkedInAt, isNotNull);
  });
}
