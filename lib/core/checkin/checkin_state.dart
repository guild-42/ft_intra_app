import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Local, SharedPreferences-backed check-in state.
///
/// Why SharedPreferences and not drift: the geofence and notification-action
/// callbacks run in a background isolate with no Riverpod scope and a very
/// short lifetime. SharedPreferences is readable/writable from that isolate
/// (after DartPluginRegistrant init) without the overhead/risk of opening the
/// app's drift SQLite connection there. The backend remains the source of
/// truth (GET /api/checkins); this is just an optimistic local mirror plus a
/// one-slot retry outbox for a POST that failed at the geofence boundary.
class CheckinLocalState {
  static const _kActive = 'checkin_active';
  static const _kCampusId = 'checkin_campus_id';
  static const _kAtIso = 'checkin_at_iso';
  static const _kPending = 'checkin_pending'; // json {action, campusId}

  /// Optimistically record a successful check-in.
  static Future<void> setCheckedIn(int campusId, {DateTime? at}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kActive, true);
    await prefs.setInt(_kCampusId, campusId);
    await prefs.setString(_kAtIso, (at ?? DateTime.now()).toIso8601String());
  }

  /// Optimistically record a check-out.
  static Future<void> setCheckedOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kActive, false);
    await prefs.remove(_kAtIso);
  }

  static Future<CheckinSnapshot> read() async {
    final prefs = await SharedPreferences.getInstance();
    final atIso = prefs.getString(_kAtIso);
    return CheckinSnapshot(
      isCheckedIn: prefs.getBool(_kActive) ?? false,
      campusId: prefs.getInt(_kCampusId),
      since: atIso != null ? DateTime.tryParse(atIso) : null,
    );
  }

  /// Queue a failed check-in/check-out for the foreground app to retry.
  static Future<void> setPending(String action, int campusId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _kPending,
      jsonEncode({'action': action, 'campusId': campusId}),
    );
  }

  static Future<PendingAction?> readPending() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kPending);
    if (raw == null) return null;
    try {
      final m = jsonDecode(raw) as Map<String, dynamic>;
      return PendingAction(
        action: m['action'] as String,
        campusId: (m['campusId'] as num).toInt(),
      );
    } catch (_) {
      return null;
    }
  }

  static Future<void> clearPending() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kPending);
  }
}

class CheckinSnapshot {
  final bool isCheckedIn;
  final int? campusId;
  final DateTime? since;

  const CheckinSnapshot({
    required this.isCheckedIn,
    this.campusId,
    this.since,
  });
}

class PendingAction {
  final String action; // 'checkin' | 'checkout'
  final int campusId;
  const PendingAction({required this.action, required this.campusId});
}
