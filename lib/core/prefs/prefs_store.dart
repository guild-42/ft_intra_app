import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Single entry point for SharedPreferences. Previously `getInstance()` was
/// called ad-hoc across 6+ files with string keys scattered everywhere; keys
/// now live here in one place. Notifiers receive this store instead of reaching
/// for SharedPreferences directly.
///
/// Migration note: existing notifiers still call SharedPreferences directly with
/// the SAME key strings declared below — they can be switched to this store one
/// at a time without a data migration (identical keys).
class PrefsKeys {
  static const selectedCampusId = 'selected_campus_id';
  static const appLocale = 'app_locale';
  static const seenIntro = 'seen_intro';
}

class PrefsStore {
  Future<int?> getInt(String key) async =>
      (await SharedPreferences.getInstance()).getInt(key);

  Future<void> setInt(String key, int value) async =>
      (await SharedPreferences.getInstance()).setInt(key, value);

  Future<String?> getString(String key) async =>
      (await SharedPreferences.getInstance()).getString(key);

  Future<void> setString(String key, String value) async =>
      (await SharedPreferences.getInstance()).setString(key, value);

  Future<bool?> getBool(String key) async =>
      (await SharedPreferences.getInstance()).getBool(key);

  Future<void> setBool(String key, bool value) async =>
      (await SharedPreferences.getInstance()).setBool(key, value);
}

final prefsStoreProvider = Provider<PrefsStore>((_) => PrefsStore());
