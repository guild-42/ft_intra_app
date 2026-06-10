// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FtCampus _$FtCampusFromJson(Map<String, dynamic> json) => _FtCampus(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  timeZone: json['time_zone'] as String?,
  usersCount: (json['users_count'] as num?)?.toInt() ?? 0,
  city: json['city'] as String?,
  country: json['country'] as String?,
  vogsphereId: (json['vogsphere_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$FtCampusToJson(_FtCampus instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'time_zone': instance.timeZone,
  'users_count': instance.usersCount,
  'city': instance.city,
  'country': instance.country,
  'vogsphere_id': instance.vogsphereId,
};
