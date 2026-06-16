import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Current terms-of-use version. Bump when the consent copy changes so users
/// are asked to re-consent.
const kTermsVersion = 'terms_v2';

/// Master opt-in for server-side notifications (default OFF).
///
/// When enabled, the device is registered with the backend (fcm_token + prefs;
/// the 42 token is never sent — it stays on the device, see doc_v2/10). Consent
/// is recorded with the terms version + timestamp the user agreed to.
class NotificationOptIn {
  final bool enabled;
  final String? consentVersion;
  final DateTime? consentedAt;

  const NotificationOptIn({
    this.enabled = false,
    this.consentVersion,
    this.consentedAt,
  });

  NotificationOptIn copyWith({
    bool? enabled,
    String? consentVersion,
    DateTime? consentedAt,
  }) {
    return NotificationOptIn(
      enabled: enabled ?? this.enabled,
      consentVersion: consentVersion ?? this.consentVersion,
      consentedAt: consentedAt ?? this.consentedAt,
    );
  }
}

class NotificationOptInNotifier extends StateNotifier<NotificationOptIn> {
  NotificationOptInNotifier() : super(const NotificationOptIn()) {
    _load();
  }

  static const _kEnabled = 'optin_enabled';
  static const _kConsentVersion = 'optin_consent_version';
  static const _kConsentAt = 'optin_consent_at';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final atStr = prefs.getString(_kConsentAt);
    state = NotificationOptIn(
      enabled: prefs.getBool(_kEnabled) ?? false,
      consentVersion: prefs.getString(_kConsentVersion),
      consentedAt: atStr == null ? null : DateTime.tryParse(atStr),
    );
  }

  /// Record consent (called when the user accepts the consent dialog).
  Future<void> recordConsent() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    await prefs.setString(_kConsentVersion, kTermsVersion);
    await prefs.setString(_kConsentAt, now.toIso8601String());
    state = state.copyWith(consentVersion: kTermsVersion, consentedAt: now);
  }

  Future<void> setEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kEnabled, enabled);
    state = state.copyWith(enabled: enabled);
  }
}

final notificationOptInProvider =
    StateNotifierProvider<NotificationOptInNotifier, NotificationOptIn>(
  (_) => NotificationOptInNotifier(),
);
