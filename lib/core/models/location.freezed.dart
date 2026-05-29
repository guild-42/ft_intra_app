// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FtLocation _$FtLocationFromJson(Map<String, dynamic> json) {
  return _FtLocation.fromJson(json);
}

/// @nodoc
mixin _$FtLocation {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'begin_at')
  String get beginAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_at')
  String? get endAt => throw _privateConstructorUsedError;
  bool get primary => throw _privateConstructorUsedError;
  String? get floor => throw _privateConstructorUsedError;
  String? get row => throw _privateConstructorUsedError;
  String? get post => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  @JsonKey(name: 'campus_id')
  int get campusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  LocationUser get user => throw _privateConstructorUsedError;

  /// Serializes this FtLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FtLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FtLocationCopyWith<FtLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FtLocationCopyWith<$Res> {
  factory $FtLocationCopyWith(
          FtLocation value, $Res Function(FtLocation) then) =
      _$FtLocationCopyWithImpl<$Res, FtLocation>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'begin_at') String beginAt,
      @JsonKey(name: 'end_at') String? endAt,
      bool primary,
      String? floor,
      String? row,
      String? post,
      String host,
      @JsonKey(name: 'campus_id') int campusId,
      @JsonKey(name: 'user') LocationUser user});

  $LocationUserCopyWith<$Res> get user;
}

/// @nodoc
class _$FtLocationCopyWithImpl<$Res, $Val extends FtLocation>
    implements $FtLocationCopyWith<$Res> {
  _$FtLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FtLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? beginAt = null,
    Object? endAt = freezed,
    Object? primary = null,
    Object? floor = freezed,
    Object? row = freezed,
    Object? post = freezed,
    Object? host = null,
    Object? campusId = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      beginAt: null == beginAt
          ? _value.beginAt
          : beginAt // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String?,
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as bool,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      row: freezed == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as String?,
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String?,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      campusId: null == campusId
          ? _value.campusId
          : campusId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as LocationUser,
    ) as $Val);
  }

  /// Create a copy of FtLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationUserCopyWith<$Res> get user {
    return $LocationUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FtLocationImplCopyWith<$Res>
    implements $FtLocationCopyWith<$Res> {
  factory _$$FtLocationImplCopyWith(
          _$FtLocationImpl value, $Res Function(_$FtLocationImpl) then) =
      __$$FtLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'begin_at') String beginAt,
      @JsonKey(name: 'end_at') String? endAt,
      bool primary,
      String? floor,
      String? row,
      String? post,
      String host,
      @JsonKey(name: 'campus_id') int campusId,
      @JsonKey(name: 'user') LocationUser user});

  @override
  $LocationUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$FtLocationImplCopyWithImpl<$Res>
    extends _$FtLocationCopyWithImpl<$Res, _$FtLocationImpl>
    implements _$$FtLocationImplCopyWith<$Res> {
  __$$FtLocationImplCopyWithImpl(
      _$FtLocationImpl _value, $Res Function(_$FtLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of FtLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? beginAt = null,
    Object? endAt = freezed,
    Object? primary = null,
    Object? floor = freezed,
    Object? row = freezed,
    Object? post = freezed,
    Object? host = null,
    Object? campusId = null,
    Object? user = null,
  }) {
    return _then(_$FtLocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      beginAt: null == beginAt
          ? _value.beginAt
          : beginAt // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String?,
      primary: null == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as bool,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      row: freezed == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as String?,
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as String?,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      campusId: null == campusId
          ? _value.campusId
          : campusId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as LocationUser,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FtLocationImpl implements _FtLocation {
  const _$FtLocationImpl(
      {required this.id,
      @JsonKey(name: 'begin_at') required this.beginAt,
      @JsonKey(name: 'end_at') this.endAt,
      required this.primary,
      this.floor,
      this.row,
      this.post,
      required this.host,
      @JsonKey(name: 'campus_id') required this.campusId,
      @JsonKey(name: 'user') required this.user});

  factory _$FtLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FtLocationImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'begin_at')
  final String beginAt;
  @override
  @JsonKey(name: 'end_at')
  final String? endAt;
  @override
  final bool primary;
  @override
  final String? floor;
  @override
  final String? row;
  @override
  final String? post;
  @override
  final String host;
  @override
  @JsonKey(name: 'campus_id')
  final int campusId;
  @override
  @JsonKey(name: 'user')
  final LocationUser user;

  @override
  String toString() {
    return 'FtLocation(id: $id, beginAt: $beginAt, endAt: $endAt, primary: $primary, floor: $floor, row: $row, post: $post, host: $host, campusId: $campusId, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FtLocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.beginAt, beginAt) || other.beginAt == beginAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.campusId, campusId) ||
                other.campusId == campusId) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, beginAt, endAt, primary,
      floor, row, post, host, campusId, user);

  /// Create a copy of FtLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FtLocationImplCopyWith<_$FtLocationImpl> get copyWith =>
      __$$FtLocationImplCopyWithImpl<_$FtLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FtLocationImplToJson(
      this,
    );
  }
}

abstract class _FtLocation implements FtLocation {
  const factory _FtLocation(
          {required final int id,
          @JsonKey(name: 'begin_at') required final String beginAt,
          @JsonKey(name: 'end_at') final String? endAt,
          required final bool primary,
          final String? floor,
          final String? row,
          final String? post,
          required final String host,
          @JsonKey(name: 'campus_id') required final int campusId,
          @JsonKey(name: 'user') required final LocationUser user}) =
      _$FtLocationImpl;

  factory _FtLocation.fromJson(Map<String, dynamic> json) =
      _$FtLocationImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'begin_at')
  String get beginAt;
  @override
  @JsonKey(name: 'end_at')
  String? get endAt;
  @override
  bool get primary;
  @override
  String? get floor;
  @override
  String? get row;
  @override
  String? get post;
  @override
  String get host;
  @override
  @JsonKey(name: 'campus_id')
  int get campusId;
  @override
  @JsonKey(name: 'user')
  LocationUser get user;

  /// Create a copy of FtLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FtLocationImplCopyWith<_$FtLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationUser _$LocationUserFromJson(Map<String, dynamic> json) {
  return _LocationUser.fromJson(json);
}

/// @nodoc
mixin _$LocationUser {
  int get id => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this LocationUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationUserCopyWith<LocationUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationUserCopyWith<$Res> {
  factory $LocationUserCopyWith(
          LocationUser value, $Res Function(LocationUser) then) =
      _$LocationUserCopyWithImpl<$Res, LocationUser>;
  @useResult
  $Res call({int id, String login, String url});
}

/// @nodoc
class _$LocationUserCopyWithImpl<$Res, $Val extends LocationUser>
    implements $LocationUserCopyWith<$Res> {
  _$LocationUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationUserImplCopyWith<$Res>
    implements $LocationUserCopyWith<$Res> {
  factory _$$LocationUserImplCopyWith(
          _$LocationUserImpl value, $Res Function(_$LocationUserImpl) then) =
      __$$LocationUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String login, String url});
}

/// @nodoc
class __$$LocationUserImplCopyWithImpl<$Res>
    extends _$LocationUserCopyWithImpl<$Res, _$LocationUserImpl>
    implements _$$LocationUserImplCopyWith<$Res> {
  __$$LocationUserImplCopyWithImpl(
      _$LocationUserImpl _value, $Res Function(_$LocationUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? url = null,
  }) {
    return _then(_$LocationUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationUserImpl implements _LocationUser {
  const _$LocationUserImpl(
      {required this.id, required this.login, required this.url});

  factory _$LocationUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationUserImplFromJson(json);

  @override
  final int id;
  @override
  final String login;
  @override
  final String url;

  @override
  String toString() {
    return 'LocationUser(id: $id, login: $login, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, login, url);

  /// Create a copy of LocationUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationUserImplCopyWith<_$LocationUserImpl> get copyWith =>
      __$$LocationUserImplCopyWithImpl<_$LocationUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationUserImplToJson(
      this,
    );
  }
}

abstract class _LocationUser implements LocationUser {
  const factory _LocationUser(
      {required final int id,
      required final String login,
      required final String url}) = _$LocationUserImpl;

  factory _LocationUser.fromJson(Map<String, dynamic> json) =
      _$LocationUserImpl.fromJson;

  @override
  int get id;
  @override
  String get login;
  @override
  String get url;

  /// Create a copy of LocationUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationUserImplCopyWith<_$LocationUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
