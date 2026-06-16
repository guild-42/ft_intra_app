import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/notifications/notification_preferences.dart';
import 'package:ft_intra/core/notifications/notification_optin.dart';
import 'package:ft_intra/core/notifications/fcm_service.dart';
import 'package:ft_intra/core/notifications/eval_fetcher.dart';
import 'package:ft_intra/core/demo/demo_mode.dart';
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
    final demo = ref.watch(demoModeProvider);

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
            _SectionHeader(title: s.get('notifications')),
            const _NotifMasterToggle(),
            _NotificationToggle(
              icon: Icons.event,
              title: s.get('notification_event'),
              value: prefs.event,
              type: NotificationPrefType.event,
              enabled: optin.enabled,
            ),
            _NotificationToggle(
              icon: Icons.people,
              title: s.get('notification_friend'),
              value: prefs.friend,
              type: NotificationPrefType.friend,
              enabled: optin.enabled,
            ),
            _NotificationToggle(
              icon: Icons.rate_review,
              title: s.get('notification_review'),
              value: prefs.review,
              type: NotificationPrefType.review,
              enabled: optin.enabled,
            ),
            const Divider(),
            _SectionHeader(title: s.get('notif_my_server_data')),
            const _ServerDataSection(),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('ft_intra'),
              subtitle: Text(
                'v1.0.0 · Unofficial app by the Guild42 community.\n'
                'Not affiliated with or endorsed by École 42.',
              ),
              isThreeLine: true,
            ),
            ListTile(
              leading: const Icon(Icons.public),
              title: Text(s.get('about')),
              subtitle: const Text('ft-intra.guild42.net'),
              onTap: () => launchUrl(
                Uri.parse('https://ft-intra.guild42.net'),
                mode: LaunchMode.externalApplication,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: Text(s.get('consent_title')),
              subtitle: const Text('ft-intra.guild42.net/privacy'),
              onTap: () => launchUrl(
                Uri.parse('https://ft-intra.guild42.net/privacy'),
                mode: LaunchMode.externalApplication,
              ),
            ),
            ListTile(
              leading: Icon(demo ? Icons.close : Icons.logout, color: Colors.red),
              title: Text(s.get(demo ? 'exit_demo' : 'logout'),
                  style: const TextStyle(color: Colors.red)),
              onTap: () async {
                // Demo never wrote tokens — just leave demo mode, don't touch
                // secure storage.
                if (demo) {
                  exitDemoMode(ref);
                  context.go('/login');
                  return;
                }
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

}

class _NotificationToggle extends ConsumerWidget {
  final IconData icon;
  final String title;
  final bool value;
  final NotificationPrefType type;

  /// Gated behind the master notification toggle — disabled until the user has
  /// opted in (and the device is registered with the server).
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

/// Master notification toggle. ON → consent → register the device (fcm + prefs;
/// the 42 token is NOT sent — it stays on the device, doc_v2/10). OFF → delete
/// the device registration from the server.
class _NotifMasterToggle extends ConsumerWidget {
  const _NotifMasterToggle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final optin = ref.watch(notificationOptInProvider);
    return SwitchListTile(
      secondary: const Icon(Icons.notifications_active),
      title: Text(s.get('notif_enable')),
      value: optin.enabled,
      activeColor: _teal,
      onChanged: (on) async {
        final notifier = ref.read(notificationOptInProvider.notifier);
        final messenger = ScaffoldMessenger.of(context);
        if (on) {
          final agreed = await showConsentDialog(context, s);
          if (!agreed) return;
          await notifier.recordConsent();
          final ok = await _registerDevice(ref);
          if (!ok) {
            messenger.showSnackBar(
                SnackBar(content: Text(s.get('notif_capture_failed'))));
            return;
          }
          await notifier.setEnabled(true);
        } else {
          await notifier.setEnabled(false);
          await EvalFetcher.resetBaseline();
          final fcm = await FcmService.getToken();
          final access = await ref.read(tokenStorageProvider).getAccessToken();
          if (fcm != null && access != null) {
            await ref
                .read(backendClientProvider)
                .deleteCredential(fcmToken: fcm, accessToken: access);
          }
        }
      },
    );
  }
}

/// Register the device for notifications. Sends fcm + current prefs + consent.
/// The 42 access token is sent only for identity verification (not stored).
Future<bool> _registerDevice(WidgetRef ref) async {
  final access = await ref.read(tokenStorageProvider).getAccessToken();
  if (access == null) {
    debugPrint('registerDevice: no access token');
    return false;
  }
  final fcm = await FcmService.getToken();
  if (fcm == null) {
    debugPrint('registerDevice: FCM token null (APNS not ready?)');
    return false;
  }
  final optin = ref.read(notificationOptInProvider);
  final prefs = ref.read(notificationPreferencesProvider);
  final watchIds = await ref.read(databaseProvider).getFriendWatchIds();
  final ok = await ref.read(backendClientProvider).register(
        accessToken: access,
        fcmToken: fcm,
        platform: defaultTargetPlatform.name,
        language: ref.read(localeProvider),
        prefEvent: prefs.event,
        prefReview: prefs.review,
        prefFriend: prefs.friend,
        friendWatchIds: watchIds,
        consentVersion: optin.consentVersion,
        consentedAt: optin.consentedAt,
      );
  debugPrint('registerDevice: backend register returned $ok');
  return ok;
}

/// "My data (server)" — delete the device registration from the backend.
class _ServerDataSection extends ConsumerWidget {
  const _ServerDataSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    return ListTile(
      leading: const Icon(Icons.delete_outline, color: Colors.redAccent),
      title: Text(s.get('notif_delete_data')),
      onTap: () => _delete(context, ref),
    );
  }

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final s = ref.read(stringsProvider);
    final messenger = ScaffoldMessenger.of(context);
    final fcm = await FcmService.getToken();
    final access = await ref.read(tokenStorageProvider).getAccessToken();
    if (fcm == null || access == null) return;
    final ok = await ref
        .read(backendClientProvider)
        .deleteCredential(fcmToken: fcm, accessToken: access);
    await ref.read(notificationOptInProvider.notifier).setEnabled(false);
    await EvalFetcher.resetBaseline();
    messenger.showSnackBar(
        SnackBar(content: Text(ok ? s.get('notif_deleted') : 'Error')));
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
