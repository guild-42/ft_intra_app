import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/checkin/checkin_permissions.dart';

class CheckinOnboardingSheet extends ConsumerStatefulWidget {
  const CheckinOnboardingSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const CheckinOnboardingSheet(),
    );
  }

  @override
  ConsumerState<CheckinOnboardingSheet> createState() =>
      _CheckinOnboardingSheetState();
}

class _CheckinOnboardingSheetState
    extends ConsumerState<CheckinOnboardingSheet> {
  bool _busy = false;

  Future<void> _enable() async {
    setState(() => _busy = true);
    final s = ref.read(stringsProvider);
    final messenger = ScaffoldMessenger.of(context);
    final result = await CheckinPermissions.requestAll();

    if (result != CheckinPermissionResult.granted) {
      if (!mounted) return;
      setState(() => _busy = false);
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

    final campusId = ref.read(selectedCampusIdProvider);
    await ref.read(checkinServiceProvider).enableGeofencing(campusId);
    await ref.read(geofenceEnabledProvider.notifier).setEnabled(true);

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(stringsProvider);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        24,
        24,
        24,
        24 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.location_on, size: 40, color: Color(0xFF00BABC)),
          const SizedBox(height: 12),
          Text(
            s.get('checkin_enable_title'),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            s.get('checkin_enable_body'),
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _busy ? null : _enable,
              child: _busy
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(s.get('checkin_enable_button')),
            ),
          ),
        ],
      ),
    );
  }
}
