// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FtCampus _$FtCampusFromJson(Map<String, dynamic> json) {
  return _FtCampus.fromJson(json);
}

/// @nodoc
mixin _$FtCampus {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_zone')
  String? get timeZone => throw _privateConstructorUsedError;
  @JsonKey(name: 'users_count')
  int get usersCount => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'vogsphere_id')
  int? get vogsphereId => throw _privateConstructorUsedError;

  /// Serializes this FtCampus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FtCampus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FtCampusCopyWith<FtCampus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FtCampusCopyWith<$Res> {
  factory $FtCampusCopyWith(FtCampus value, $Res Function(FtCampus) then) =
      _$FtCampusCopyWithImpl<$Res, FtCampus>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'time_zone') String? timeZone,
      @JsonKey(name: 'users_count') int usersCount,
      String? city,
      String? country,
      @JsonKey(name: 'vogsphere_id') int? vogsphereId});
}

/// @nodoc
class _$FtCampusCopyWithImpl<$Res, $Val extends FtCampus>
    implements $FtCampusCopyWith<$Res> {
  _$FtCampusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FtCampus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? timeZone = freezed,
    Object? usersCount = null,
    Object? city = freezed,
    Object? country = freezed,
    Object? vogsphereId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: freezed == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String?,
      usersCount: null == usersCount
          ? _value.usersCount
          : usersCount // ignore: cast_nullable_to_non_nullable
              as int,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      vogsphereId: freezed == vogsphereId
          ? _value.vogsphereId
          : vogsphereId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FtCampusImplCopyWith<$Res>
    implements $FtCampusCopyWith<$Res> {
  factory _$$FtCampusImplCopyWith(
          _$FtCampusImpl value, $Res Function(_$FtCampusImpl) then) =
      __$$FtCampusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'time_zone') String? timeZone,
      @JsonKey(name: 'users_count') int usersCount,
      String? city,
      String? country,
      @JsonKey(name: 'vogsphere_id') int? vogsphereId});
}

/// @nodoc
class __$$FtCampusImplCopyWithImpl<$Res>
    extends _$FtCampusCopyWithImpl<$Res, _$FtCampusImpl>
    implements _$$FtCampusImplCopyWith<$Res> {
  __$$FtCampusImplCopyWithImpl(
      _$FtCampusImpl _value, $Res Function(_$FtCampusImpl) _then)
      : super(_value, _then);

  /// Create a copy of FtCampus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? timeZone = freezed,
    Object? usersCount = null,
    Object? city = freezed,
    Object? country = freezed,
    Object? vogsphereId = freezed,
  }) {
    return _then(_$FtCampusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: freezed == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String?,
      usersCount: null == usersCount
          ? _value.usersCount
          : usersCount // ignore: cast_nullable_to_non_nullable
              as int,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      vogsphereId: freezed == vogsphereId
          ? _value.vogsphereId
          : vogsphereId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FtCampusImpl implements _FtCampus {
  const _$FtCampusImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'time_zone') this.timeZone,
      @JsonKey(name: 'users_count') this.usersCount = 0,
      this.city,
      this.country,
      @JsonKey(name: 'vogsphere_id') this.vogsphereId});

  factory _$FtCampusImpl.fromJson(Map<String, dynamic> json) =>
      _$$FtCampusImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'time_zone')
  final String? timeZone;
  @override
  @JsonKey(name: 'users_count')
  final int usersCount;
  @override
  final String? city;
  @override
  final String? country;
  @override
  @JsonKey(name: 'vogsphere_id')
  final int? vogsphereId;

  @override
  String toString() {
    return 'FtCampus(id: $id, name: $name, timeZone: $timeZone, usersCount: $usersCount, city: $city, country: $country, vogsphereId: $vogsphereId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FtCampusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone) &&
            (identical(other.usersCount, usersCount) ||
                other.usersCount == usersCount) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.vogsphereId, vogsphereId) ||
                other.vogsphereId == vogsphereId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, timeZone, usersCount, city, country, vogsphereId);

  /// Create a copy of FtCampus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FtCampusImplCopyWith<_$FtCampusImpl> get copyWith =>
      __$$FtCampusImplCopyWithImpl<_$FtCampusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FtCampusImplToJson(
      this,
    );
  }
}

abstract class _FtCampus implements FtCampus {
  const factory _FtCampus(
      {required final int id,
      required final String name,
      @JsonKey(name: 'time_zone') final String? timeZone,
      @JsonKey(name: 'users_count') final int usersCount,
      final String? city,
      final String? country,
      @JsonKey(name: 'vogsphere_id') final int? vogsphereId}) = _$FtCampusImpl;

  factory _FtCampus.fromJson(Map<String, dynamic> json) =
      _$FtCampusImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'time_zone')
  String? get timeZone;
  @override
  @JsonKey(name: 'users_count')
  int get usersCount;
  @override
  String? get city;
  @override
  String? get country;
  @override
  @JsonKey(name: 'vogsphere_id')
  int? get vogsphereId;

  /// Create a copy of FtCampus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FtCampusImplCopyWith<_$FtCampusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
