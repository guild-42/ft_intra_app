// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FtEventImpl _$$FtEventImplFromJson(Map<String, dynamic> json) =>
    _$FtEventImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      location: json['location'] as String?,
      kind: json['kind'] as String,
      maxPeople: (json['max_people'] as num?)?.toInt(),
      nbrSubscribers: (json['nbr_subscribers'] as num?)?.toInt() ?? 0,
      beginAt: json['begin_at'] as String?,
      endAt: json['end_at'] as String?,
      campusIds: (json['campus_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$FtEventImplToJson(_$FtEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'kind': instance.kind,
      'max_people': instance.maxPeople,
      'nbr_subscribers': instance.nbrSubscribers,
      'begin_at': instance.beginAt,
      'end_at': instance.endAt,
      'campus_ids': instance.campusIds,
      'created_at': instance.createdAt,
    };
