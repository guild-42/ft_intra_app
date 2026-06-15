import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/notifications/notification_preferences.dart';
import 'package:ft_intra/core/notifications/notification_optin.dart';
import 'package:ft_intra/core/notifications/fcm_service.dart';
import 'package:ft_intra/core/checkin/checkin_permissions.dart';
import 'package:ft_intra/core/checkin/checkin_notifications.dart';
import 'package:ft_intra/features/settings/consent_dialog.dart';
import 'package:ft_intra/l10n/strings.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final currentLocale = ref.watch(localeProvider);
    final selectedCampus = ref.watch(selectedCampusIdProvider);
    final campusesAsync = ref.watch(allCampusesProvider);
    final prefs = ref.watch(notificationPreferencesProvider);
    final optin = ref.watch(notificationOptInProvider);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(s.get('language')),
              trailing: DropdownButton<String>(
                value: currentLocale,
                underline: const SizedBox.shrink(),
                dropdownColor: Theme.of(context).cardTheme.color,
                items: AppStrings.supportedLocales.map((locale) {
                  return DropdownMenuItem(
                    value: locale.$1,
                    child: Text(locale.$2),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    ref.read(localeProvider.notifier).setLocale(value);
                  }
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.location_city),
              title: const Text('Campus'),
              trailing: campusesAsync.when(
                loading: () => const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                error: (_, __) => const Icon(Icons.error, color: Colors.red),
                data: (campuses) => DropdownButton<int>(
                  value: campuses.any((c) => c.id == selectedCampus)
                      ? selectedCampus
                      : null,
                  hint: const SizedBox(width: 96, child: Text('Select')),
                  underline: const SizedBox.shrink(),
                  dropdownColor: Theme.of(context).cardTheme.color,
                  items: campuses.map((c) {
                    return DropdownMenuItem(
                      value: c.id,
                      child: SizedBox(
                        width: 96,
                        child: Text(
                          c.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(selectedCampusIdProvider.notifier).setCampus(value);
                      ref.invalidate(campusLocationsProvider);
                    }
                  },
                ),
              ),
            ),
            const Divider(),
            _SectionHeader(title: s.get('checkin_enable_title')),
            const _CheckinSettings(),
            const Divider(),
            _SectionHeader(title: s.get('notifications')),
            const _CookieMasterToggle(),
            _NotificationToggle(
              icon: Icons.monetization_on,
              title: s.get('notification_evalpo'),
              value: prefs.evalpo,
              type: NotificationPrefType.evalpo,
              enabled: optin.cookieEnabled,
            ),
            _NotificationToggle(
              icon: Icons.event,
              title: s.get('notification_event'),
              value: prefs.event,
              type: NotificationPrefType.event,
              enabled: optin.cookieEnabled,
            ),
            _NotificationToggle(
              icon: Icons.people,
              title: s.get('notification_friend'),
              value: prefs.friend,
              type: NotificationPrefType.friend,
              enabled: optin.cookieEnabled,
            ),
            const _ReviewMasterToggle(),
            const Divider(),
            _SectionHeader(title: s.get('notif_my_server_data')),
            const _ServerDataSection(),
            const Divider(),
            const _SectionHeader(title: 'Developer'),
            ListTile(
              leading: const Icon(Icons.send, color: Colors.blue),
              title: const Text('Send test push notification'),
              subtitle: const Text('Triggers Backend → FCM → device'),
              onTap: () => _post(context, ref, '/api/test-push'),
            ),
            ListTile(
              leading: const Icon(Icons.bug_report, color: Colors.orange),
              title: const Text('Send fake notification'),
              subtitle: const Text('Pretend an evalpo sale just started'),
              onTap: () => _post(context, ref, '/api/test-notification'),
            ),
            ListTile(
              leading: const Icon(Icons.cloud_sync, color: Colors.teal),
              title: const Text('Poll intra now'),
              subtitle: const Text("Don't wait 5 min, fetch right now"),
              onTap: () => _post(context, ref, '/api/poll-now'),
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.purple),
              title: const Text('Test check-in prompt'),
              subtitle: const Text('Fire the geofence-arrival notification now'),
              onTap: () => showCheckinPrompt(ref.read(selectedCampusIdProvider)),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(s.get('about')),
              subtitle: const Text('ft_intra v0.1.0'),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text(s.get('logout'),
                  style: const TextStyle(color: Colors.red)),
              onTap: () async {
                final authService = ref.read(authServiceProvider);
                await authService.logout();
                if (context.mounted) context.go('/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _post(BuildContext context, WidgetRef ref, String path) async {
    try {
      final data = await ref.read(backendClientProvider).adminPost(path);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }
}

class _NotificationToggle extends ConsumerWidget {
  final IconData icon;
  final String title;
  final bool value;
  final NotificationPrefType type;

  /// Gated behind the cookie master toggle — disabled until the user has opted
  /// in (and a cookie has been sent to the server).
  final bool enabled;

  const _NotificationToggle({
    required this.icon,
    required this.title,
    required this.value,
    required this.type,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Padding(padding: const EdgeInsets.only(left: 16), child: Text(title)),
      value: value && enabled,
      activeColor: const Color(0xFF00BABC),
      onChanged: enabled
          ? (on) async {
              await ref
                  .read(notificationPreferencesProvider.notifier)
                  .set(type, on);
              final fcmToken = await FcmService.getToken();
              if (fcmToken == null) return;
              final backend = ref.read(backendClientProvider);
              await backend.updatePreferences(
                fcmToken: fcmToken,
                prefEvalpo: type == NotificationPrefType.evalpo ? on : null,
                prefEvent: type == NotificationPrefType.event ? on : null,
                prefReview: type == NotificationPrefType.review ? on : null,
                prefFriend: type == NotificationPrefType.friend ? on : null,
              );
            }
          : null,
    );
  }
}

const _teal = Color(0xFF00BABC);

/// Master toggle A: opt in to sending the intra cookie to the server (gates
/// evalpo / event / friend notifications). ON → consent → cookie webview;
/// OFF → delete cookie from server.
class _CookieMasterToggle extends ConsumerWidget {
  const _CookieMasterToggle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final optin = ref.watch(notificationOptInProvider);
    return SwitchListTile(
      secondary: const Icon(Icons.notifications_active),
      title: Text(s.get('notif_enable_cookie')),
      value: optin.cookieEnabled,
      activeColor: _teal,
      onChanged: (on) async {
        final notifier = ref.read(notificationOptInProvider.notifier);
        if (on) {
          final agreed = await showConsentDialog(context, s, forToken: false);
          if (!agreed) return;
          await notifier.recordConsent();
          await notifier.setCookieEnabled(true);
          if (context.mounted) context.push('/cookie-login');
        } else {
          await notifier.setCookieEnabled(false);
          final fcm = await FcmService.getToken();
          final access = await ref.read(tokenStorageProvider).getAccessToken();
          if (fcm != null && access != null) {
            await ref.read(backendClientProvider).deleteCredential(
                fcmToken: fcm, type: 'cookie', accessToken: access);
          }
        }
      },
    );
  }
}

/// Master toggle B: opt in to sending the 42 OAuth token to the server (review
/// notifications). ON → consent → in-app OAuth capture → push token; OFF →
/// delete token from server.
class _ReviewMasterToggle extends ConsumerWidget {
  const _ReviewMasterToggle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final optin = ref.watch(notificationOptInProvider);
    return SwitchListTile(
      secondary: const Icon(Icons.rate_review),
      title: Text(s.get('notif_enable_review')),
      value: optin.reviewEnabled,
      activeColor: _teal,
      onChanged: (on) async {
        final notifier = ref.read(notificationOptInProvider.notifier);
        final messenger = ScaffoldMessenger.of(context);
        if (on) {
          final agreed = await showConsentDialog(context, s, forToken: true);
          if (!agreed || !context.mounted) return;
          await notifier.recordConsent();
          if (!context.mounted) return;
          final ok = await context.push<bool>('/oauth');
          if (ok != true) {
            messenger.showSnackBar(
                SnackBar(content: Text(s.get('notif_capture_failed'))));
            return;
          }
          final sent = await _sendTokenToBackend(ref);
          if (!sent) {
            messenger.showSnackBar(
                SnackBar(content: Text(s.get('notif_capture_failed'))));
            return;
          }
          await ref
              .read(notificationPreferencesProvider.notifier)
              .set(NotificationPrefType.review, true);
          await notifier.setReviewEnabled(true);
        } else {
          await notifier.setReviewEnabled(false);
          await ref
              .read(notificationPreferencesProvider.notifier)
              .set(NotificationPrefType.review, false);
          final fcm = await FcmService.getToken();
          final access = await ref.read(tokenStorageProvider).getAccessToken();
          if (fcm != null && access != null) {
            await ref.read(backendClientProvider).deleteCredential(
                fcmToken: fcm, type: 'token', accessToken: access);
          }
        }
      },
    );
  }
}

/// Sends the freshly-captured OAuth token (access + refresh) to the backend
/// along with the recorded consent. Returns false if anything is missing.
Future<bool> _sendTokenToBackend(WidgetRef ref) async {
  final ts = ref.read(tokenStorageProvider);
  final access = await ts.getAccessToken();
  final refresh = await ts.getRefreshToken();
  if (access == null) {
    debugPrint('sendToken: access token null (exchange did not store it)');
    return false;
  }
  final fcm = await FcmService.getToken();
  if (fcm == null) {
    debugPrint('sendToken: FCM token null (APNS not ready?)');
    return false;
  }
  final optin = ref.read(notificationOptInProvider);
  final ok = await ref.read(backendClientProvider).register(
        accessToken: access,
        refreshToken: refresh,
        fcmToken: fcm,
        cookie: '',
        platform: defaultTargetPlatform.name,
        language: ref.read(localeProvider),
        prefReview: true,
        consentVersion: optin.consentVersion,
        consentedAt: optin.consentedAt,
      );
  debugPrint('sendToken: backend register returned $ok');
  return ok;
}

/// "My data (server)" — explicit per-credential deletion from the backend.
class _ServerDataSection extends ConsumerWidget {
  const _ServerDataSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.delete_outline, color: Colors.redAccent),
          title: Text(s.get('notif_delete_cookie')),
          onTap: () => _delete(context, ref, 'cookie'),
        ),
        ListTile(
          leading: const Icon(Icons.delete_outline, color: Colors.redAccent),
          title: Text(s.get('notif_delete_token')),
          onTap: () => _delete(context, ref, 'token'),
        ),
      ],
    );
  }

  Future<void> _delete(BuildContext context, WidgetRef ref, String type) async {
    final s = ref.read(stringsProvider);
    final messenger = ScaffoldMessenger.of(context);
    final fcm = await FcmService.getToken();
    final access = await ref.read(tokenStorageProvider).getAccessToken();
    if (fcm == null || access == null) return;
    final ok = await ref
        .read(backendClientProvider)
        .deleteCredential(fcmToken: fcm, type: type, accessToken: access);
    final notifier = ref.read(notificationOptInProvider.notifier);
    if (type == 'cookie') {
      await notifier.setCookieEnabled(false);
    } else {
      await notifier.setReviewEnabled(false);
      await ref
          .read(notificationPreferencesProvider.notifier)
          .set(NotificationPrefType.review, false);
    }
    messenger.showSnackBar(
        SnackBar(content: Text(ok ? s.get('notif_deleted') : 'Error')));
  }
}

class _CheckinSettings extends ConsumerWidget {
  const _CheckinSettings();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final enabled = ref.watch(geofenceEnabledProvider);
    final userAsync = ref.watch(currentUserProvider);

    return Column(
      children: [
        SwitchListTile(
          secondary: const Icon(Icons.location_on),
          title: Text(s.get('checkin_enable_title')),
          subtitle: Text(
            s.get('checkin_enable_body'),
            style: const TextStyle(fontSize: 11),
          ),
          value: enabled,
          activeColor: const Color(0xFF00BABC),
          onChanged: (enable) async {
            final messenger = ScaffoldMessenger.of(context);
            final campusId = ref.read(selectedCampusIdProvider);
            final service = ref.read(checkinServiceProvider);
            final notifier = ref.read(geofenceEnabledProvider.notifier);

            if (enable) {
              final result = await CheckinPermissions.requestAll();
              if (result != CheckinPermissionResult.granted) {
                messenger.showSnackBar(
                  SnackBar(
                    content: Text(s.get('checkin_perm_needed')),
                    action: SnackBarAction(
                      label: s.get('checkin_open_settings'),
                      onPressed: CheckinPermissions.openSettings,
                    ),
                  ),
                );
                return;
              }
              await service.enableGeofencing(campusId);
              await notifier.setEnabled(true);
            } else {
              await service.disableGeofencing(campusId);
              await notifier.setEnabled(false);
            }
          },
        ),
        // Verified 42 identity used for check-in (read-only — anti-impersonation
        // comes from the OAuth token, never a manually entered ID).
        ListTile(
          leading: const Icon(Icons.badge_outlined),
          title: const Text('Intra ID'),
          trailing: userAsync.when(
            loading: () => const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            error: (_, __) => const Text('—', style: TextStyle(color: Colors.grey)),
            data: (user) => Text(
              user.login,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
