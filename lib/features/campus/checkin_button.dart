import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/features/campus/checkin_onboarding_sheet.dart';

const _teal = Color(0xFF00BABC);

/// Compact check-in control shared by both campus tabs (placed above the
/// TabBarView so it's visible on friends and presence alike). Three states:
/// not enabled → opens onboarding; enabled+out → check in; checked in →
/// check out (red).
class CheckinButton extends ConsumerWidget {
  const CheckinButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(stringsProvider);
    final enabled = ref.watch(geofenceEnabledProvider);
    final status = ref.watch(checkinStatusProvider);
    final campusId = ref.watch(selectedCampusIdProvider);
    final service = ref.read(checkinServiceProvider);

    final isCheckedIn = enabled && status.isCheckedIn;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 2),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton.icon(
          style: FilledButton.styleFrom(
            backgroundColor: isCheckedIn ? Colors.red : _teal,
            visualDensity: VisualDensity.compact,
          ),
          icon: Icon(
            isCheckedIn ? Icons.logout : Icons.location_on,
            size: 18,
          ),
          label: Text(
            !enabled
                ? s.get('checkin_enable_button')
                : isCheckedIn
                    ? s.get('checkin_check_out')
                    : s.get('checkin_check_in_now'),
          ),
          onPressed: () async {
            if (!enabled) {
              CheckinOnboardingSheet.show(context);
              return;
            }
            if (isCheckedIn) {
              await service.checkOut(campusId);
            } else {
              await service.checkIn(campusId);
            }
            await ref.read(checkinStatusProvider.notifier).refresh();
            ref.invalidate(checkedInUsersProvider);
          },
        ),
      ),
    );
  }
}
