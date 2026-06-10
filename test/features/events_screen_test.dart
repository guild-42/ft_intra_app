import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ft_intra/core/models/event.dart';
import 'package:ft_intra/features/events/events_screen.dart';
import 'package:ft_intra/modules/events/events_module.dart';

FtEvent _event({
  required int id,
  required String name,
  required DateTime beginAt,
}) {
  return FtEvent(
    id: id,
    name: name,
    kind: 'event',
    beginAt: beginAt.toUtc().toIso8601String(),
    nbrSubscribers: 3,
    maxPeople: 50,
  );
}

Widget _wrap(List<FtEvent> events) {
  return ProviderScope(
    overrides: [
      campusEventsProvider.overrideWith((ref) async => events),
    ],
    child: const MaterialApp(home: EventsScreen()),
  );
}

void main() {
  testWidgets('splits events into upcoming and past sections', (tester) async {
    final now = DateTime.now();
    await tester.pumpWidget(_wrap([
      _event(id: 1, name: 'Future workshop',
          beginAt: now.add(const Duration(days: 2))),
      _event(id: 2, name: 'Old exam',
          beginAt: now.subtract(const Duration(days: 2))),
    ]));
    await tester.pumpAndSettle();

    expect(find.text('Upcoming'), findsOneWidget);
    expect(find.text('Past'), findsOneWidget);
    expect(find.text('Future workshop'), findsOneWidget);
    expect(find.text('Old exam'), findsOneWidget);
    expect(find.text('3/50'), findsNWidgets(2));
  });

  testWidgets('shows empty state when there are no events', (tester) async {
    await tester.pumpWidget(_wrap([]));
    await tester.pumpAndSettle();
    expect(find.text('No events'), findsOneWidget);
  });
}
