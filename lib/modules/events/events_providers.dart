import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ft_intra/core/models/event.dart';
import 'package:ft_intra/core/providers.dart';

final campusEventsProvider =
    FutureProvider.autoDispose<List<FtEvent>>((ref) async {
  final api = ref.watch(apiClientProvider);
  final campusId = ref.watch(selectedCampusIdProvider);
  return api.getCampusEvents(campusId);
});
