import 'package:permission_handler/permission_handler.dart';

/// Outcome of the staged permission request.
enum CheckinPermissionResult {
  granted,
  notificationsDenied,
  locationDenied,
  backgroundDenied,
}

/// Staged permission acquisition for background geofencing.
///
/// Order matters: notifications first (so the "Check in?" prompt can show),
/// then foreground location, then the separate background/"Always" escalation
/// that iOS only offers after foreground location is granted.
class CheckinPermissions {
  static Future<bool> hasAll() async {
    final notif = await Permission.notification.status;
    final loc = await Permission.locationWhenInUse.status;
    final always = await Permission.locationAlways.status;
    return notif.isGranted && loc.isGranted && always.isGranted;
  }

  static Future<CheckinPermissionResult> requestAll() async {
    final notif = await Permission.notification.request();
    if (!notif.isGranted) return CheckinPermissionResult.notificationsDenied;

    final loc = await Permission.locationWhenInUse.request();
    if (!loc.isGranted) return CheckinPermissionResult.locationDenied;

    // Second step — on iOS this is the "Change to Always Allow?" escalation.
    final always = await Permission.locationAlways.request();
    if (!always.isGranted) return CheckinPermissionResult.backgroundDenied;

    return CheckinPermissionResult.granted;
  }

  static Future<bool> openSettings() => openAppSettings();
}
