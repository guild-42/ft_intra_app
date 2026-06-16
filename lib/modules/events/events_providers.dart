import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/core/models/event.dart';
import 'package:ft_intra/core/providers.dart';
import 'package:ft_intra/core/demo/demo_mode.dart';
import 'package:ft_intra/core/demo/demo_data.dart';

final campusEventsProvider =
    FutureProvider.autoDispose<List<FtEvent>>((ref) async {
  if (ref.watch(demoModeProvider)) return DemoData.events;
  final api = ref.watch(apiClientProvider);
  final campusId = ref.watch(selectedCampusIdProvider);
  return api.getCampusEvents(campusId);
});
