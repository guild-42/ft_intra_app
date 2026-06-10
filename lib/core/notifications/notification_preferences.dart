import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Per-type push notification preferences.
///
/// `evalpo` / `event` are handled by the backend's global notification poller.
/// `review` is handled by the backend's per-user review poller.
/// `friend` (friend login/checkin) is handled by the backend's friend poller,
/// with the *which friends* selection living on each [Friend] row
/// (`notifyEnabled`) and synced to the backend as a watch list.
class NotificationPreferences {
  final bool evalpo;
  final bool event;
  final bool review;
  final bool friend;

  const NotificationPreferences({
    this.evalpo = true,
    this.event = true,
    this.review = true,
    this.friend = true,
  });

  NotificationPreferences copyWith({
    bool? evalpo,
    bool? event,
    bool? review,
    bool? friend,
  }) {
    return NotificationPreferences(
      evalpo: evalpo ?? this.evalpo,
      event: event ?? this.event,
      review: review ?? this.review,
      friend: friend ?? this.friend,
    );
  }
}

/// Notification preference types. The string value is the SharedPreferences
/// key suffix AND the backend `pref_*` field suffix (kept identical on purpose).
enum NotificationPrefType { review, evalpo, event, friend }

class NotificationPreferencesNotifier
    extends StateNotifier<NotificationPreferences> {
  NotificationPreferencesNotifier() : super(const NotificationPreferences()) {
    _load();
  }

  static const _kEvalpo = 'pref_evalpo';
  static const _kEvent = 'pref_event';
  static const _kReview = 'pref_review';
  static const _kFriend = 'pref_friend';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = NotificationPreferences(
      evalpo: prefs.getBool(_kEvalpo) ?? true,
      event: prefs.getBool(_kEvent) ?? true,
      review: prefs.getBool(_kReview) ?? true,
      friend: prefs.getBool(_kFriend) ?? true,
    );
  }

  Future<void> set(NotificationPrefType type, bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    switch (type) {
      case NotificationPrefType.evalpo:
        await prefs.setBool(_kEvalpo, enabled);
        state = state.copyWith(evalpo: enabled);
      case NotificationPrefType.event:
        await prefs.setBool(_kEvent, enabled);
        state = state.copyWith(event: enabled);
      case NotificationPrefType.review:
        await prefs.setBool(_kReview, enabled);
        state = state.copyWith(review: enabled);
      case NotificationPrefType.friend:
        await prefs.setBool(_kFriend, enabled);
        state = state.copyWith(friend: enabled);
    }
  }
}
