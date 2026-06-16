import 'package:ft_intra/core/api/backend_client.dart';
import 'package:ft_intra/core/auth/token_storage.dart';
import 'package:ft_intra/core/checkin/checkin_state.dart';

/// Manual campus check-in (a trust-based "I'm here" button — no GPS/geofence).
/// The backend ties it to the verified 42 identity and auto-checks-out via TTL.
class CheckinService {
  CheckinService({BackendClient? backend, TokenStorage? tokenStorage})
      : _backend = backend ?? BackendClient(),
        _tokenStorage = tokenStorage ?? TokenStorage();

  final BackendClient _backend;
  final TokenStorage _tokenStorage;

  Future<bool> checkIn(int campusId) async {
    final token = await _tokenStorage.getAccessToken();
    if (token == null) return false;
    final ok = await _backend.checkIn(accessToken: token, campusId: campusId);
    if (ok) {
      await CheckinLocalState.setCheckedIn(campusId);
      await CheckinLocalState.clearPending();
    } else {
      await CheckinLocalState.setPending('checkin', campusId);
    }
    return ok;
  }

  Future<bool> checkOut(int campusId) async {
    final token = await _tokenStorage.getAccessToken();
    if (token == null) return false;
    final ok = await _backend.checkOut(accessToken: token, campusId: campusId);
    if (ok) {
      await CheckinLocalState.setCheckedOut();
      await CheckinLocalState.clearPending();
    } else {
      await CheckinLocalState.setPending('checkout', campusId);
    }
    return ok;
  }

  // Retry a queued background action; otherwise keep an active check-in alive.
  Future<void> syncPending() async {
    final token = await _tokenStorage.getAccessToken();
    if (token == null) return;

    final pending = await CheckinLocalState.readPending();
    if (pending != null) {
      final ok = pending.action == 'checkin'
          ? await _backend.checkIn(
              accessToken: token, campusId: pending.campusId)
          : await _backend.checkOut(
              accessToken: token, campusId: pending.campusId);
      if (ok) {
        if (pending.action == 'checkin') {
          await CheckinLocalState.setCheckedIn(pending.campusId);
        } else {
          await CheckinLocalState.setCheckedOut();
        }
        await CheckinLocalState.clearPending();
      }
      return;
    }

    final snap = await CheckinLocalState.read();
    if (snap.isCheckedIn) {
      await _backend.heartbeat(accessToken: token);
    }
  }
}
