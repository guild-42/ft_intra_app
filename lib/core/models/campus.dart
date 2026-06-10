import 'package:freezed_annotation/freezed_annotation.dart';

part 'campus.freezed.dart';
part 'campus.g.dart';

@freezed
abstract class FtCampus with _$FtCampus {
  const factory FtCampus({
    required int id,
    required String name,
    @JsonKey(name: 'time_zone') String? timeZone,
    @JsonKey(name: 'users_count') @Default(0) int usersCount,
    String? city,
    String? country,
    @JsonKey(name: 'vogsphere_id') int? vogsphereId,
  }) = _FtCampus;

  factory FtCampus.fromJson(Map<String, dynamic> json) =>
      _$FtCampusFromJson(json);
}
