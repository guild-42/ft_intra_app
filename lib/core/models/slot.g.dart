// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FtSlotImpl _$$FtSlotImplFromJson(Map<String, dynamic> json) => _$FtSlotImpl(
      id: (json['id'] as num).toInt(),
      beginAt: json['begin_at'] as String,
      endAt: json['end_at'] as String,
      scaleTeam: json['scale_team'],
      user: json['user'],
    );

Map<String, dynamic> _$$FtSlotImplToJson(_$FtSlotImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'begin_at': instance.beginAt,
      'end_at': instance.endAt,
      'scale_team': instance.scaleTeam,
      'user': instance.user,
    };
