import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ft_intra/config/constants.dart';
import 'package:ft_intra/core/auth/token_storage.dart';

/// Eval "alarm clock" worker.
///
/// The server never holds the 42 token (doc_v2/10): it only sends a content-less
/// `{type: eval_wake}` push. On receipt — foreground OR background isolate — the
/// device reads its OWN OAuth token from secure storage, queries
/// `/v2/me/scale_teams`, diffs against the signatures it has already seen
/// (SharedPreferences), and posts a LOCAL notification for anything new. No 42
/// data ever leaves the device.
class EvalFetcher {
  static const _seenKey = 'eval_seen_signatures';
  static const _seededKey = 'eval_seeded';

  /// Entry point for an `eval_wake` push. Safe to call from a background isolate
  /// (no Riverpod / UI dependencies). Fails soft on any error.
  static Future<void> fetchAndNotify() async {
    try {
      final token = await TokenStorage().getAccessToken();
      if (token == null) {
        debugPrint('EvalFetcher: no token, skipping');
        return;
      }
      final teams = await _fetchScaleTeams(token);
      if (teams == null) return;

      final prefs = await SharedPreferences.getInstance();
      final seen = prefs.getStringList(_seenKey)?.toSet() ?? <String>{};
      final seeded = prefs.getBool(_seededKey) ?? false;

      final fresh = <_EvalItem>[];
      for (final raw in teams) {
        final item = _EvalItem.fromTeam(raw);
        if (item == null) continue;
        if (seen.add(item.signature) && seeded) fresh.add(item);
      }

      await prefs.setStringList(_seenKey, seen.toList());
      // First wake after opt-in seeds the baseline without dumping a backlog.
      if (!seeded) {
        await prefs.setBool(_seededKey, true);
        return;
      }
      if (fresh.isEmpty) return;

      final plugin = await _localNotifications();
      for (final item in fresh) {
        await plugin.show(
          item.signature.hashCode,
          item.title,
          item.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'ft_intra_channel',
              'ft_intra Notifications',
              importance: Importance.high,
            ),
            iOS: DarwinNotificationDetails(),
          ),
          payload: 'route:/evaluations',
        );
      }
      debugPrint('EvalFetcher: posted ${fresh.length} eval notification(s)');
    } catch (e) {
      debugPrint('EvalFetcher.fetchAndNotify failed: $e');
    }
  }

  /// Reset the baseline so the next wake seeds again (called on review opt-out
  /// so re-enabling doesn't replay old evals).
  static Future<void> resetBaseline() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_seenKey);
    await prefs.remove(_seededKey);
  }

  static Future<List<Map<String, dynamic>>?> _fetchScaleTeams(
      String token) async {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    ));
    try {
      final resp = await dio.get(
        '${FtConstants.apiBaseUrl}/v2/me/scale_teams',
        queryParameters: {'page[size]': 100, 'sort': '-updated_at'},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final data = resp.data;
      if (data is List) {
        return data.whereType<Map>().map((e) => Map<String, dynamic>.from(e)).toList();
      }
      return const [];
    } on DioException catch (e) {
      // 401 → token expired. We deliberately do NOT refresh here: refresh churn
      // in a throttled background isolate is unreliable; the next foreground
      // session refreshes via the auth interceptor and the following wake works.
      debugPrint('EvalFetcher: scale_teams ${e.response?.statusCode}');
      return null;
    }
  }

  static Future<FlutterLocalNotificationsPlugin> _localNotifications() async {
    final plugin = FlutterLocalNotificationsPlugin();
    const init = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await plugin.initialize(init);
    return plugin;
  }
}

class _EvalItem {
  final String signature;
  final String title;
  final String body;

  _EvalItem(this.signature, this.title, this.body);

  static _EvalItem? fromTeam(Map<String, dynamic> team) {
    final id = team['id'];
    if (id == null) return null;
    final filled = team['filled_at'] != null;
    final state = filled ? 'filled' : 'scheduled';
    final project = (team['team'] is Map ? team['team']['name'] : null) ?? 'project';
    final sig = 'scaleteam:$id:$state';
    if (filled) {
      return _EvalItem(sig, 'Evaluation result',
          '$project · mark ${team['final_mark']}');
    }
    return _EvalItem(sig, 'Evaluation scheduled', '$project · ${team['begin_at']}');
  }
}
