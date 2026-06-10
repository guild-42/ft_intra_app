import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Current terms-of-use version. Bump when the consent copy changes so users
/// are asked to re-consent.
const kTermsVersion = 'terms_v1';

/// Opt-in state for sending credentials to the backend (default OFF).
///
/// `cookieEnabled` gates the cookie (evalpo / event / friend notifications);
/// `reviewEnabled` gates the 42 OAuth token (review notifications). Consent is
/// recorded with the terms version + timestamp the user agreed to.
class NotificationOptIn {
  final bool cookieEnabled;
  final bool reviewEnabled;
  final String? consentVersion;
  final DateTime? consentedAt;

  const NotificationOptIn({
    this.cookieEnabled = false,
    this.reviewEnabled = false,
    this.consentVersion,
    this.consentedAt,
  });

  NotificationOptIn copyWith({
    bool? cookieEnabled,
    bool? reviewEnabled,
    String? consentVersion,
    DateTime? consentedAt,
  }) {
    return NotificationOptIn(
      cookieEnabled: cookieEnabled ?? this.cookieEnabled,
      reviewEnabled: reviewEnabled ?? this.reviewEnabled,
      consentVersion: consentVersion ?? this.consentVersion,
      consentedAt: consentedAt ?? this.consentedAt,
    );
  }
}

class NotificationOptInNotifier extends StateNotifier<NotificationOptIn> {
  NotificationOptInNotifier() : super(const NotificationOptIn()) {
    _load();
  }

  static const _kCookie = 'optin_cookie';
  static const _kReview = 'optin_review';
  static const _kConsentVersion = 'optin_consent_version';
  static const _kConsentAt = 'optin_consent_at';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final atStr = prefs.getString(_kConsentAt);
    state = NotificationOptIn(
      cookieEnabled: prefs.getBool(_kCookie) ?? false,
      reviewEnabled: prefs.getBool(_kReview) ?? false,
      consentVersion: prefs.getString(_kConsentVersion),
      consentedAt: atStr == null ? null : DateTime.tryParse(atStr),
    );
  }

  /// Record consent (called when the user accepts a consent dialog).
  Future<void> recordConsent() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    await prefs.setString(_kConsentVersion, kTermsVersion);
    await prefs.setString(_kConsentAt, now.toIso8601String());
    state = state.copyWith(consentVersion: kTermsVersion, consentedAt: now);
  }

  Future<void> setCookieEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kCookie, enabled);
    state = state.copyWith(cookieEnabled: enabled);
  }

  Future<void> setReviewEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kReview, enabled);
    state = state.copyWith(reviewEnabled: enabled);
  }
}

final notificationOptInProvider =
    StateNotifierProvider<NotificationOptInNotifier, NotificationOptIn>(
  (_) => NotificationOptInNotifier(),
);
