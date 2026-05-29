// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FtLocationImpl _$$FtLocationImplFromJson(Map<String, dynamic> json) =>
    _$FtLocationImpl(
      id: (json['id'] as num).toInt(),
      beginAt: json['begin_at'] as String,
      endAt: json['end_at'] as String?,
      primary: json['primary'] as bool,
      floor: json['floor'] as String?,
      row: json['row'] as String?,
      post: json['post'] as String?,
      host: json['host'] as String,
      campusId: (json['campus_id'] as num).toInt(),
      user: LocationUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FtLocationImplToJson(_$FtLocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'begin_at': instance.beginAt,
      'end_at': instance.endAt,
      'primary': instance.primary,
      'floor': instance.floor,
      'row': instance.row,
      'post': instance.post,
      'host': instance.host,
      'campus_id': instance.campusId,
      'user': instance.user,
    };

_$LocationUserImpl _$$LocationUserImplFromJson(Map<String, dynamic> json) =>
    _$LocationUserImpl(
      id: (json['id'] as num).toInt(),
      login: json['login'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$LocationUserImplToJson(_$LocationUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'url': instance.url,
    };
