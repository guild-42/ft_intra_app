// App Store screenshot capture in demo mode (no network/login required).
// Run on a 6.9" / 6.7" simulator:
//   flutter drive --driver=test_driver/integration_test.dart \
//     --target=integration_test/screenshots_test.dart -d <sim-id>
// Output: app/screenshots/*.png (device resolution).
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ft_intra/config/router.dart';
import 'package:ft_intra/core/demo/demo_mode.dart';
import 'package:ft_intra/main.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture store screenshots (demo mode)', (tester) async {
    SharedPreferences.setMockInitialValues({'seen_intro': true});

    await tester.pumpWidget(
      ProviderScope(
        overrides: [demoModeProvider.overrideWith((ref) => true)],
        child: const FtIntra42App(),
      ),
    );
    // Let the router attach + splash resolve.
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 400));
    }

    Future<void> shot(String route, String name) async {
      routerConfig.go(route);
      // Fixed pumps (not pumpAndSettle: demo streams + cached images keep timers).
      for (var i = 0; i < 12; i++) {
        await tester.pump(const Duration(milliseconds: 400));
      }
      await binding.takeScreenshot(name);
    }

    await shot('/dashboard', '01_dashboard');
    await shot('/campus', '02_campus');
    await shot('/evaluations', '03_evaluations');
    await shot('/notifications', '04_notifications');
    await shot('/settings', '05_settings');
  });
}
