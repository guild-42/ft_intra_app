import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
abstract class FtLocation with _$FtLocation {
  const factory FtLocation({
    required int id,
    @JsonKey(name: 'begin_at') required String beginAt,
    @JsonKey(name: 'end_at') String? endAt,
    required bool primary,
    String? floor,
    String? row,
    String? post,
    required String host,
    @JsonKey(name: 'campus_id') required int campusId,
    @JsonKey(name: 'user') required LocationUser user,
  }) = _FtLocation;

  factory FtLocation.fromJson(Map<String, dynamic> json) =>
      _$FtLocationFromJson(json);
}

@freezed
abstract class LocationUser with _$LocationUser {
  const factory LocationUser({
    required int id,
    required String login,
    required String url,
  }) = _LocationUser;

  factory LocationUser.fromJson(Map<String, dynamic> json) =>
      _$LocationUserFromJson(json);
}
