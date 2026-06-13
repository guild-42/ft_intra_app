// On-device smoke test. Run on the booted simulator:
//   flutter test integration_test/smoke_test.dart -d <device-id>
//
// Unlike widget tests (test/), this runs the REAL app on a real iOS/Android
// runtime — native plugins (secure storage, webview, FCM init) are live — so
// it catches integration breakage the Chrome web build and pure widget tests
// can't. Keep flows here deterministic (no live network / OAuth); use
// provider overrides for anything that would hit the 42 API.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ft_intra/features/auth/login_screen.dart';
import 'package:ft_intra/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('app boots to the login screen on a real device', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: FtIntra42App()));
    await tester.pumpAndSettle();
    // No stored OAuth session in a fresh install → must land on login.
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
