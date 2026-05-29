import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class FtUser with _$FtUser {
  const factory FtUser({
    required int id,
    required String login,
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'displayname') required String displayName,
    @JsonKey(name: 'image') FtUserImage? image,
    @JsonKey(name: 'correction_point') @Default(0) int correctionPoint,
    @JsonKey(name: 'wallet') @Default(0) int wallet,
    String? location,
    @JsonKey(name: 'pool_month') String? poolMonth,
    @JsonKey(name: 'pool_year') String? poolYear,
    @JsonKey(name: 'staff?') @Default(false) bool isStaff,
    @JsonKey(name: 'alumni?') @Default(false) bool isAlumni,
    @JsonKey(name: 'active?') @Default(true) bool isActive,
    @JsonKey(name: 'cursus_users') @Default([]) List<CursusUser> cursusUsers,
    @JsonKey(name: 'projects_users') @Default([]) List<ProjectUser> projectsUsers,
  }) = _FtUser;

  factory FtUser.fromJson(Map<String, dynamic> json) => _$FtUserFromJson(json);
}

@freezed
class FtUserImage with _$FtUserImage {
  const factory FtUserImage({
    String? link,
    FtImageVersions? versions,
  }) = _FtUserImage;

  factory FtUserImage.fromJson(Map<String, dynamic> json) =>
      _$FtUserImageFromJson(json);
}

@freezed
class FtImageVersions with _$FtImageVersions {
  const factory FtImageVersions({
    String? large,
    String? medium,
    String? small,
    String? micro,
  }) = _FtImageVersions;

  factory FtImageVersions.fromJson(Map<String, dynamic> json) =>
      _$FtImageVersionsFromJson(json);
}

@freezed
class CursusUser with _$CursusUser {
  const factory CursusUser({
    required int id,
    @JsonKey(name: 'begin_at') String? beginAt,
    @JsonKey(name: 'end_at') String? endAt,
    @JsonKey(name: 'blackholed_at') String? blackholedAt,
    String? grade,
    @Default(0.0) double level,
    @JsonKey(name: 'cursus_id') required int cursusId,
    @JsonKey(name: 'cursus') CursusInfo? cursus,
  }) = _CursusUser;

  factory CursusUser.fromJson(Map<String, dynamic> json) =>
      _$CursusUserFromJson(json);
}

@freezed
class CursusInfo with _$CursusInfo {
  const factory CursusInfo({
    required int id,
    required String name,
    required String slug,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _CursusInfo;

  factory CursusInfo.fromJson(Map<String, dynamic> json) =>
      _$CursusInfoFromJson(json);
}

@freezed
class ProjectUser with _$ProjectUser {
  const factory ProjectUser({
    required int id,
    @JsonKey(name: 'final_mark') int? finalMark,
    required String status,
    @JsonKey(name: 'validated?') bool? validated,
    @JsonKey(name: 'marked_at') String? markedAt,
    @JsonKey(name: 'project') required ProjectInfo project,
    @JsonKey(name: 'cursus_ids') @Default([]) List<int> cursusIds,
  }) = _ProjectUser;

  factory ProjectUser.fromJson(Map<String, dynamic> json) =>
      _$ProjectUserFromJson(json);
}

@freezed
class ProjectInfo with _$ProjectInfo {
  const factory ProjectInfo({
    required int id,
    required String name,
    required String slug,
  }) = _ProjectInfo;

  factory ProjectInfo.fromJson(Map<String, dynamic> json) =>
      _$ProjectInfoFromJson(json);
}
