import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ft_intra/core/api/ft_api_client.dart';
import 'package:ft_intra/core/demo/demo_mode.dart';
import 'package:ft_intra/core/demo/demo_data.dart';
import 'package:ft_intra/core/providers.dart';

/// A Dio that fails any request — proves demo-mode providers never hit network.
class _ThrowingDio implements Dio {
  @override
  noSuchMethod(Invocation invocation) =>
      throw StateError('network called in demo mode');
}

void main() {
  ProviderContainer demoContainer() => ProviderContainer(overrides: [
        demoModeProvider.overrideWith((_) => true),
        // If any guarded provider fell through to the API, this Dio throws.
        apiClientProvider.overrideWithValue(FtApiClient(_ThrowingDio())),
        dioProvider.overrideWithValue(_ThrowingDio()),
      ]);

  test('demo mode serves mock data without touching the network', () async {
    final c = demoContainer();
    addTearDown(c.dispose);

    final user = await c.read(currentUserProvider.future);
    expect(user.login, 'demo');

    final presence = await c.read(campusPresenceProvider.future);
    expect(presence, isNotEmpty);
    // Includes a check-in-only user (no host).
    expect(presence.any((p) => p.isCheckinOnly), isTrue);

    final history = await c.read(evalHistoryProvider.future);
    expect(history, isNotEmpty);

    final slots = await c.read(mySlotsProvider.future);
    expect(slots, isNotEmpty);

    final campuses = await c.read(allCampusesProvider.future);
    expect(campuses, isNotEmpty);
  });

  test('demo notification/friend data is present', () {
    // The stream providers just return Stream.value of these in demo mode.
    expect(DemoData.notifications(), isNotEmpty);
    expect(DemoData.friends(), isNotEmpty);
  });
}
