// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FtLocation _$FtLocationFromJson(Map<String, dynamic> json) => _FtLocation(
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

Map<String, dynamic> _$FtLocationToJson(_FtLocation instance) =>
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

_LocationUser _$LocationUserFromJson(Map<String, dynamic> json) =>
    _LocationUser(
      id: (json['id'] as num).toInt(),
      login: json['login'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$LocationUserToJson(_LocationUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'url': instance.url,
    };
