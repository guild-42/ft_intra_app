// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FtUser _$FtUserFromJson(Map<String, dynamic> json) => _FtUser(
  id: (json['id'] as num).toInt(),
  login: json['login'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  displayName: json['displayname'] as String,
  image: json['image'] == null
      ? null
      : FtUserImage.fromJson(json['image'] as Map<String, dynamic>),
  correctionPoint: (json['correction_point'] as num?)?.toInt() ?? 0,
  wallet: (json['wallet'] as num?)?.toInt() ?? 0,
  location: json['location'] as String?,
  poolMonth: json['pool_month'] as String?,
  poolYear: json['pool_year'] as String?,
  isStaff: json['staff?'] as bool? ?? false,
  isAlumni: json['alumni?'] as bool? ?? false,
  isActive: json['active?'] as bool? ?? true,
  cursusUsers:
      (json['cursus_users'] as List<dynamic>?)
          ?.map((e) => CursusUser.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  projectsUsers:
      (json['projects_users'] as List<dynamic>?)
          ?.map((e) => ProjectUser.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$FtUserToJson(_FtUser instance) => <String, dynamic>{
  'id': instance.id,
  'login': instance.login,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'displayname': instance.displayName,
  'image': instance.image,
  'correction_point': instance.correctionPoint,
  'wallet': instance.wallet,
  'location': instance.location,
  'pool_month': instance.poolMonth,
  'pool_year': instance.poolYear,
  'staff?': instance.isStaff,
  'alumni?': instance.isAlumni,
  'active?': instance.isActive,
  'cursus_users': instance.cursusUsers,
  'projects_users': instance.projectsUsers,
};

_FtUserImage _$FtUserImageFromJson(Map<String, dynamic> json) => _FtUserImage(
  link: json['link'] as String?,
  versions: json['versions'] == null
      ? null
      : FtImageVersions.fromJson(json['versions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FtUserImageToJson(_FtUserImage instance) =>
    <String, dynamic>{'link': instance.link, 'versions': instance.versions};

_FtImageVersions _$FtImageVersionsFromJson(Map<String, dynamic> json) =>
    _FtImageVersions(
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
      micro: json['micro'] as String?,
    );

Map<String, dynamic> _$FtImageVersionsToJson(_FtImageVersions instance) =>
    <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'micro': instance.micro,
    };

_CursusUser _$CursusUserFromJson(Map<String, dynamic> json) => _CursusUser(
  id: (json['id'] as num).toInt(),
  beginAt: json['begin_at'] as String?,
  endAt: json['end_at'] as String?,
  blackholedAt: json['blackholed_at'] as String?,
  grade: json['grade'] as String?,
  level: (json['level'] as num?)?.toDouble() ?? 0.0,
  cursusId: (json['cursus_id'] as num).toInt(),
  cursus: json['cursus'] == null
      ? null
      : CursusInfo.fromJson(json['cursus'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CursusUserToJson(_CursusUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'begin_at': instance.beginAt,
      'end_at': instance.endAt,
      'blackholed_at': instance.blackholedAt,
      'grade': instance.grade,
      'level': instance.level,
      'cursus_id': instance.cursusId,
      'cursus': instance.cursus,
    };

_CursusInfo _$CursusInfoFromJson(Map<String, dynamic> json) => _CursusInfo(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$CursusInfoToJson(_CursusInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'created_at': instance.createdAt,
    };

_ProjectUser _$ProjectUserFromJson(Map<String, dynamic> json) => _ProjectUser(
  id: (json['id'] as num).toInt(),
  finalMark: (json['final_mark'] as num?)?.toInt(),
  status: json['status'] as String,
  validated: json['validated?'] as bool?,
  markedAt: json['marked_at'] as String?,
  project: ProjectInfo.fromJson(json['project'] as Map<String, dynamic>),
  cursusIds:
      (json['cursus_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
);

Map<String, dynamic> _$ProjectUserToJson(_ProjectUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'final_mark': instance.finalMark,
      'status': instance.status,
      'validated?': instance.validated,
      'marked_at': instance.markedAt,
      'project': instance.project,
      'cursus_ids': instance.cursusIds,
    };

_ProjectInfo _$ProjectInfoFromJson(Map<String, dynamic> json) => _ProjectInfo(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
);

Map<String, dynamic> _$ProjectInfoToJson(_ProjectInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
