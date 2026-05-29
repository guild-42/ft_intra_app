import 'package:freezed_annotation/freezed_annotation.dart';

part 'slot.freezed.dart';
part 'slot.g.dart';

@freezed
class FtSlot with _$FtSlot {
  const factory FtSlot({
    required int id,
    @JsonKey(name: 'begin_at') required String beginAt,
    @JsonKey(name: 'end_at') required String endAt,
    @JsonKey(name: 'scale_team') dynamic scaleTeam,
    @JsonKey(name: 'user') dynamic user,
  }) = _FtSlot;

  factory FtSlot.fromJson(Map<String, dynamic> json) => _$FtSlotFromJson(json);
}
