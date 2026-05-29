import 'dart:ui' show DartPluginRegistrant;

import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:native_geofence/native_geofence.dart';

import 'package:ft_intra/core/api/backend_client.dart';
import 'package:ft_intra/core/auth/token_storage.dart';
import 'package:ft_intra/core/checkin/checkin_notifications.dart';
import 'package:ft_intra/core/checkin/checkin_state.dart';

/// Geofence IDs are namespaced as `campus_<id>` so the background isolate can
/// recover the campus id without any Riverpod/provider state.
const String campusGeofencePrefix = 'campus_';

String geofenceIdForCampus(int campusId) => '$campusGeofencePrefix$campusId';

int? campusIdFromGeofenceId(String id) {
  if (!id.startsWith(campusGeofencePrefix)) return null;
  return int.tryParse(id.substring(campusGeofencePrefix.length));
}

/// Entry point invoked by the OS (in a fresh background isolate) when the user
/// crosses a campus geofence. MUST be a top-level function annotated for the
/// AOT compiler so its callback handle survives app restarts.
@pragma('vm:entry-point')
Future<void> geofenceCallback(GeofenceCallbackParams params) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  final id = params.geofences.isNotEmpty ? params.geofences.first.id : '';
  final campusId = campusIdFromGeofenceId(id);
  if (campusId == null) return;

  if (params.event == GeofenceEvent.enter) {
    // Arrival: just ask. The actual check-in happens when the user taps the
    // "Check in" action (handled by checkinNotificationBackgroundHandler).
    await initCheckinNotifications(
      onForeground: checkinNotificationForegroundHandler,
      onBackground: checkinNotificationBackgroundHandler,
    );
    await showCheckinPrompt(campusId);
  } else if (params.event == GeofenceEvent.exit) {
    // Departure: auto check-out. Promote to an Android foreground service for
    // the duration of the network call (no-op on iOS).
    try {
      await NativeGeofenceBackgroundManager.instance.promoteToForeground();
    } catch (_) {}
    try {
      await backgroundCheckout(campusId);
    } finally {
      try {
        await NativeGeofenceBackgroundManager.instance.demoteToBackground();
      } catch (_) {}
    }
  }
}

/// Background tap on the notification's "Check in" action.
@pragma('vm:entry-point')
void checkinNotificationBackgroundHandler(NotificationResponse response) {
  if (response.actionId != checkinActionId) return;
  final campusId = int.tryParse(response.payload ?? '');
  if (campusId == null) return;
  // Fire-and-forget; the isolate stays alive until this future settles.
  backgroundCheckin(campusId);
}

/// Foreground tap (app is open). Same effect; kept separate so initialize()
/// can wire both. Safe to be a top-level function.
@pragma('vm:entry-point')
void checkinNotificationForegroundHandler(NotificationResponse response) {
  if (response.actionId != checkinActionId) return;
  final campusId = int.tryParse(response.payload ?? '');
  if (campusId == null) return;
  backgroundCheckin(campusId);
}

/// Perform a check-in from any isolate: read the (background-readable) token,
/// POST to the backend, mirror the result locally, and queue a retry on
/// failure. No-op if there is no token.
Future<void> backgroundCheckin(int campusId) async {
  final token = await TokenStorage().getAccessToken();
  if (token == null) return;
  final ok = await BackendClient().checkIn(
    accessToken: token,
    campusId: campusId,
  );
  if (ok) {
    await CheckinLocalState.setCheckedIn(campusId);
    await CheckinLocalState.clearPending();
    await showCheckinConfirmation();
  } else {
    await CheckinLocalState.setPending('checkin', campusId);
  }
}

/// Perform a check-out from any isolate. The backend TTL sweeper is the
/// ultimate safety net if this never runs / fails.
Future<void> backgroundCheckout(int campusId) async {
  final token = await TokenStorage().getAccessToken();
  if (token == null) return;
  final ok = await BackendClient().checkOut(
    accessToken: token,
    campusId: campusId,
  );
  if (ok) {
    await CheckinLocalState.setCheckedOut();
    await CheckinLocalState.clearPending();
  } else {
    await CheckinLocalState.setPending('checkout', campusId);
  }
}
