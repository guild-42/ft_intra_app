import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/features/auth/login_screen.dart';
import 'package:ft_intra/main.dart';

void main() {
  testWidgets('App boots to the login screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: FtIntra42App()),
    );
    await tester.pumpAndSettle();
    // initialLocation is /login; reaching Dashboard requires a real OAuth
    // session, which a widget test doesn't have.
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
