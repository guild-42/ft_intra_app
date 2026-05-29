import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:ft_intra/config/constants.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/notifications/notification_preferences.dart';
import 'package:ft_intra/core/notifications/fcm_service.dart';
import 'package:ft_intra/core/checkin/checkin_permissions.dart';
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
                  hint: const Text('Select'),
                  underline: const SizedBox.shrink(),
                  dropdownColor: Theme.of(context).cardTheme.color,
                  items: campuses.map((c) {
                    return DropdownMenuItem(
                      value: c.id,
                      child: Text('${c.name}'),
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
            _NotificationToggle(
              icon: Icons.rate_review,
              title: s.get('notification_review'),
              value: prefs.review,
              type: NotificationPrefType.review,
            ),
            _NotificationToggle(
              icon: Icons.monetization_on,
              title: s.get('notification_evalpo'),
              value: prefs.evalpo,
              type: NotificationPrefType.evalpo,
            ),
            _NotificationToggle(
              icon: Icons.event,
              title: s.get('notification_event'),
              value: prefs.event,
              type: NotificationPrefType.event,
            ),
            _NotificationToggle(
              icon: Icons.people,
              title: s.get('notification_friend'),
              value: prefs.friend,
              type: NotificationPrefType.friend,
            ),
            const Divider(),
            const _SectionHeader(title: 'Developer'),
            ListTile(
              leading: const Icon(Icons.send, color: Colors.blue),
              title: const Text('Send test push notification'),
              subtitle: const Text('Triggers Backend → FCM → device'),
              onTap: () => _post(context, '/api/test-push'),
            ),
            ListTile(
              leading: const Icon(Icons.bug_report, color: Colors.orange),
              title: const Text('Send fake notification'),
              subtitle: const Text('Pretend an evalpo sale just started'),
              onTap: () => _post(context, '/api/test-notification'),
            ),
            ListTile(
              leading: const Icon(Icons.cloud_sync, color: Colors.teal),
              title: const Text('Poll intra now'),
              subtitle: const Text("Don't wait 5 min, fetch right now"),
              onTap: () => _post(context, '/api/poll-now'),
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

  Future<void> _post(BuildContext context, String path) async {
    try {
      final resp = await Dio().post('${FtConstants.backendBaseUrl}$path');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${resp.data}'),
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

  const _NotificationToggle({
    required this.icon,
    required this.title,
    required this.value,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title),
      value: value,
      activeColor: const Color(0xFF00BABC),
      onChanged: (enabled) async {
        await ref
            .read(notificationPreferencesProvider.notifier)
            .set(type, enabled);
        final fcmToken = await FcmService.getToken();
        if (fcmToken == null) return;
        final backend = ref.read(backendClientProvider);
        await backend.updatePreferences(
          fcmToken: fcmToken,
          prefEvalpo: type == NotificationPrefType.evalpo ? enabled : null,
          prefEvent: type == NotificationPrefType.event ? enabled : null,
          prefReview: type == NotificationPrefType.review ? enabled : null,
          prefFriend: type == NotificationPrefType.friend ? enabled : null,
        );
      },
    );
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
