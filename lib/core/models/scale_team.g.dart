// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scale_team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScaleTeamImpl _$$ScaleTeamImplFromJson(Map<String, dynamic> json) =>
    _$ScaleTeamImpl(
      id: (json['id'] as num).toInt(),
      scaleId: (json['scale_id'] as num).toInt(),
      beginAt: json['begin_at'] as String,
      filledAt: json['filled_at'] as String?,
      finalMark: (json['final_mark'] as num?)?.toInt(),
      comment: json['comment'] as String?,
      feedback: json['feedback'] as String?,
      corrector: json['corrector'],
      correcteds: json['correcteds'] as List<dynamic>? ?? const [],
      team: json['team'] == null
          ? null
          : ScaleTeamTeam.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScaleTeamImplToJson(_$ScaleTeamImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scale_id': instance.scaleId,
      'begin_at': instance.beginAt,
      'filled_at': instance.filledAt,
      'final_mark': instance.finalMark,
      'comment': instance.comment,
      'feedback': instance.feedback,
      'corrector': instance.corrector,
      'correcteds': instance.correcteds,
      'team': instance.team,
    };

_$ScaleTeamTeamImpl _$$ScaleTeamTeamImplFromJson(Map<String, dynamic> json) =>
    _$ScaleTeamTeamImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      projectId: (json['project_id'] as num).toInt(),
      status: json['status'] as String?,
      finalMark: (json['final_mark'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ScaleTeamTeamImplToJson(_$ScaleTeamTeamImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'project_id': instance.projectId,
      'status': instance.status,
      'final_mark': instance.finalMark,
    };
