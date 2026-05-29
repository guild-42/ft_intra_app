import 'package:native_geofence/native_geofence.dart';

import 'package:ft_intra/config/constants.dart';
import 'package:ft_intra/core/api/backend_client.dart';
import 'package:ft_intra/core/auth/token_storage.dart';
import 'package:ft_intra/core/checkin/checkin_state.dart';
import 'package:ft_intra/core/checkin/geofence_callbacks.dart';

class CheckinService {
  CheckinService({BackendClient? backend, TokenStorage? tokenStorage})
      : _backend = backend ?? BackendClient(),
        _tokenStorage = tokenStorage ?? TokenStorage();

  final BackendClient _backend;
  final TokenStorage _tokenStorage;

  Future<bool> enableGeofencing(int campusId) async {
    final geo = FtConstants.campusGeo(campusId);
    if (geo == null) return false;
    await NativeGeofenceManager.instance.initialize();
    await NativeGeofenceManager.instance.createGeofence(
      Geofence(
        id: geofenceIdForCampus(campusId),
        location: Location(latitude: geo.lat, longitude: geo.lng),
        radiusMeters: geo.radiusMeters,
        triggers: {GeofenceEvent.enter, GeofenceEvent.exit},
        iosSettings: const IosGeofenceSettings(initialTrigger: true),
        androidSettings: const AndroidGeofenceSettings(
          initialTriggers: {GeofenceEvent.enter},
          notificationResponsiveness: Duration(minutes: 5),
        ),
      ),
      geofenceCallback,
    );
    return true;
  }

  Future<void> disableGeofencing(int campusId) async {
    try {
      await NativeGeofenceManager.instance
          .removeGeofenceById(geofenceIdForCampus(campusId));
    } catch (_) {}
  }

  // Re-align OS geofence registration with the persisted flag (e.g. after
  // reboot / app relaunch, where registrations may or may not survive).
  Future<void> reconcileGeofence({
    required bool enabled,
    required int campusId,
  }) async {
    await NativeGeofenceManager.instance.initialize();
    final ids = await NativeGeofenceManager.instance.getRegisteredGeofenceIds();
    final wanted = geofenceIdForCampus(campusId);
    if (enabled && !ids.contains(wanted)) {
      await enableGeofencing(campusId);
    } else if (!enabled && ids.contains(wanted)) {
      await disableGeofencing(campusId);
    }
  }

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
