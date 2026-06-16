import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ft_intra/core/auth/token_storage.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/features/auth/login_screen.dart';
import 'package:ft_intra/main.dart';

void main() {
  testWidgets('App boots to the login screen when no token is stored',
      (WidgetTester tester) async {
    // Splash decides on cold start by reading the token store. Use the web
    // (SharedPreferences-backed) store with no tokens so the decision is
    // deterministic without the secure-storage platform channel.
    // seen_intro=true so splash skips the intro and makes the token decision.
    SharedPreferences.setMockInitialValues({'seen_intro': true});
    await tester.pumpWidget(
      ProviderScope(
        overrides: [tokenStorageProvider.overrideWithValue(TokenStorage.web())],
        child: const FtIntra42App(),
      ),
    );
    await tester.pumpAndSettle();
    // No stored token → splash routes to login (dashboard needs a real session).
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
