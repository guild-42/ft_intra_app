import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/main.dart';

void main() {
  testWidgets('App renders login or dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: FtIntra42App()),
    );
    await tester.pumpAndSettle();
    expect(find.text('Dashboard'), findsAny);
  });
}
