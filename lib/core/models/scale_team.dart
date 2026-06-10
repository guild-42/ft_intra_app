import 'package:freezed_annotation/freezed_annotation.dart';

part 'scale_team.freezed.dart';
part 'scale_team.g.dart';

@freezed
abstract class ScaleTeam with _$ScaleTeam {
  const factory ScaleTeam({
    required int id,
    @JsonKey(name: 'scale_id') required int scaleId,
    @JsonKey(name: 'begin_at') required String beginAt,
    @JsonKey(name: 'filled_at') String? filledAt,
    @JsonKey(name: 'final_mark') int? finalMark,
    String? comment,
    String? feedback,
    @JsonKey(name: 'corrector') required dynamic corrector,
    @JsonKey(name: 'correcteds') @Default([]) List<dynamic> correcteds,
    @JsonKey(name: 'team') ScaleTeamTeam? team,
  }) = _ScaleTeam;

  factory ScaleTeam.fromJson(Map<String, dynamic> json) =>
      _$ScaleTeamFromJson(json);
}

@freezed
abstract class ScaleTeamTeam with _$ScaleTeamTeam {
  const factory ScaleTeamTeam({
    required int id,
    required String name,
    @JsonKey(name: 'project_id') required int projectId,
    String? status,
    @JsonKey(name: 'final_mark') int? finalMark,
  }) = _ScaleTeamTeam;

  factory ScaleTeamTeam.fromJson(Map<String, dynamic> json) =>
      _$ScaleTeamTeamFromJson(json);
}
