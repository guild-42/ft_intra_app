import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class FtEvent with _$FtEvent {
  const factory FtEvent({
    required int id,
    required String name,
    String? description,
    String? location,
    required String kind,
    @JsonKey(name: 'max_people') int? maxPeople,
    @JsonKey(name: 'nbr_subscribers') @Default(0) int nbrSubscribers,
    @JsonKey(name: 'begin_at') String? beginAt,
    @JsonKey(name: 'end_at') String? endAt,
    @JsonKey(name: 'campus_ids') @Default([]) List<int> campusIds,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _FtEvent;

  factory FtEvent.fromJson(Map<String, dynamic> json) =>
      _$FtEventFromJson(json);
}
