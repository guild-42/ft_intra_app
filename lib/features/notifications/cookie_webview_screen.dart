import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/notifications/fcm_service.dart';
import 'package:ft_intra/core/notifications/notification_optin.dart';

class CookieWebViewScreen extends ConsumerStatefulWidget {
  const CookieWebViewScreen({super.key});

  @override
  ConsumerState<CookieWebViewScreen> createState() => _CookieWebViewScreenState();
}

class _CookieWebViewScreenState extends ConsumerState<CookieWebViewScreen> {
  double _progress = 0;
  String _currentUrl = '';
  bool _extracting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to Intra'),
        actions: [
          IconButton(
            icon: _extracting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : const Icon(Icons.check),
            tooltip: 'Capture cookie',
            onPressed: _extracting ? null : _captureCookie,
          ),
        ],
      ),
      body: Column(
        children: [
          if (_progress < 1.0)
            LinearProgressIndicator(value: _progress),
          Container(
            color: Colors.black54,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Icon(Icons.info_outline, size: 16, color: Colors.white70),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Login then tap ✓ to capture cookie',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri('https://profile.intra.42.fr/'),
              ),
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                domStorageEnabled: true,
              ),
              onProgressChanged: (controller, progress) {
                setState(() => _progress = progress / 100);
              },
              onLoadStop: (controller, url) {
                setState(() => _currentUrl = url?.toString() ?? '');
              },
            ),
          ),
          if (_currentUrl.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: Colors.black26,
              width: double.infinity,
              child: Text(
                _currentUrl,
                style: const TextStyle(fontSize: 10, color: Colors.white60),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _captureCookie() async {
    setState(() => _extracting = true);

    try {
      final cookieManager = CookieManager.instance();
      final cookies = await cookieManager.getCookies(
        url: WebUri('https://profile.intra.42.fr'),
      );

      String? sessionCookie;
      for (final c in cookies) {
        if (c.name == '_intra_42_session_production') {
          sessionCookie = c.value;
          break;
        }
      }

      if (sessionCookie == null || sessionCookie.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cookie not found. Please login first.'),
              backgroundColor: Colors.orange,
            ),
          );
        }
        return;
      }

      final db = ref.read(databaseProvider);
      await db.saveCookie(sessionCookie);

      // Send cookie + FCM token to Backend for push notifications
      _registerToBackend(sessionCookie);

      final scraper = ref.read(notificationScraperProvider);
      final result = await scraper.scrapeAndStore(db, sessionCookie);

      if (mounted) {
        final msg = result.error != null
            ? 'Error: ${result.error} (pages=${result.pagesFetched}, found=${result.totalFound})'
            : 'Pages: ${result.pagesFetched}, Found: ${result.totalFound}, New: ${result.newSaved}';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
            backgroundColor: result.error != null
                ? Colors.red
                : (result.newSaved > 0 ? Colors.green : Colors.orange),
            duration: const Duration(seconds: 5),
          ),
        );
        if (result.error == null) {
          context.go('/notifications');
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _extracting = false);
    }
  }

  Future<void> _registerToBackend(String cookie) async {
    try {
      final tokenStorage = ref.read(tokenStorageProvider);
      final accessToken = await tokenStorage.getAccessToken();
      if (accessToken == null) return;

      final fcmToken = await FcmService.getToken();
      if (fcmToken == null) return;

      final backend = ref.read(backendClientProvider);
      final prefs = ref.read(notificationPreferencesProvider);
      final optin = ref.read(notificationOptInProvider);
      final watchIds = await ref.read(databaseProvider).getFriendWatchIds();
      await backend.register(
        accessToken: accessToken,
        fcmToken: fcmToken,
        cookie: cookie,
        platform: defaultTargetPlatform.name,
        language: ref.read(localeProvider),
        prefEvalpo: prefs.evalpo,
        prefEvent: prefs.event,
        prefReview: prefs.review,
        prefFriend: prefs.friend,
        friendWatchIds: watchIds,
        consentVersion: optin.consentVersion,
        consentedAt: optin.consentedAt,
      );
    } catch (e) {
      debugPrint('Backend register failed: $e');
    }
  }
}
