// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FtUser _$FtUserFromJson(Map<String, dynamic> json) {
  return _FtUser.fromJson(json);
}

/// @nodoc
mixin _$FtUser {
  int get id => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayname')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  FtUserImage? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'correction_point')
  int get correctionPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet')
  int get wallet => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'pool_month')
  String? get poolMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'pool_year')
  String? get poolYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff?')
  bool get isStaff => throw _privateConstructorUsedError;
  @JsonKey(name: 'alumni?')
  bool get isAlumni => throw _privateConstructorUsedError;
  @JsonKey(name: 'active?')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'cursus_users')
  List<CursusUser> get cursusUsers => throw _privateConstructorUsedError;
  @JsonKey(name: 'projects_users')
  List<ProjectUser> get projectsUsers => throw _privateConstructorUsedError;

  /// Serializes this FtUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FtUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FtUserCopyWith<FtUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FtUserCopyWith<$Res> {
  factory $FtUserCopyWith(FtUser value, $Res Function(FtUser) then) =
      _$FtUserCopyWithImpl<$Res, FtUser>;
  @useResult
  $Res call(
      {int id,
      String login,
      String email,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'displayname') String displayName,
      @JsonKey(name: 'image') FtUserImage? image,
      @JsonKey(name: 'correction_point') int correctionPoint,
      @JsonKey(name: 'wallet') int wallet,
      String? location,
      @JsonKey(name: 'pool_month') String? poolMonth,
      @JsonKey(name: 'pool_year') String? poolYear,
      @JsonKey(name: 'staff?') bool isStaff,
      @JsonKey(name: 'alumni?') bool isAlumni,
      @JsonKey(name: 'active?') bool isActive,
      @JsonKey(name: 'cursus_users') List<CursusUser> cursusUsers,
      @JsonKey(name: 'projects_users') List<ProjectUser> projectsUsers});

  $FtUserImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$FtUserCopyWithImpl<$Res, $Val extends FtUser>
    implements $FtUserCopyWith<$Res> {
  _$FtUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FtUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? displayName = null,
    Object? image = freezed,
    Object? correctionPoint = null,
    Object? wallet = null,
    Object? location = freezed,
    Object? poolMonth = freezed,
    Object? poolYear = freezed,
    Object? isStaff = null,
    Object? isAlumni = null,
    Object? isActive = null,
    Object? cursusUsers = null,
    Object? projectsUsers = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as FtUserImage?,
      correctionPoint: null == correctionPoint
          ? _value.correctionPoint
          : correctionPoint // ignore: cast_nullable_to_non_nullable
              as int,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as int,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      poolMonth: freezed == poolMonth
          ? _value.poolMonth
          : poolMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      poolYear: freezed == poolYear
          ? _value.poolYear
          : poolYear // ignore: cast_nullable_to_non_nullable
              as String?,
      isStaff: null == isStaff
          ? _value.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlumni: null == isAlumni
          ? _value.isAlumni
          : isAlumni // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      cursusUsers: null == cursusUsers
          ? _value.cursusUsers
          : cursusUsers // ignore: cast_nullable_to_non_nullable
              as List<CursusUser>,
      projectsUsers: null == projectsUsers
          ? _value.projectsUsers
          : projectsUsers // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>,
    ) as $Val);
  }

  /// Create a copy of FtUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FtUserImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $FtUserImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FtUserImplCopyWith<$Res> implements $FtUserCopyWith<$Res> {
  factory _$$FtUserImplCopyWith(
          _$FtUserImpl value, $Res Function(_$FtUserImpl) then) =
      __$$FtUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String login,
      String email,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'displayname') String displayName,
      @JsonKey(name: 'image') FtUserImage? image,
      @JsonKey(name: 'correction_point') int correctionPoint,
      @JsonKey(name: 'wallet') int wallet,
      String? location,
      @JsonKey(name: 'pool_month') String? poolMonth,
      @JsonKey(name: 'pool_year') String? poolYear,
      @JsonKey(name: 'staff?') bool isStaff,
      @JsonKey(name: 'alumni?') bool isAlumni,
      @JsonKey(name: 'active?') bool isActive,
      @JsonKey(name: 'cursus_users') List<CursusUser> cursusUsers,
      @JsonKey(name: 'projects_users') List<ProjectUser> projectsUsers});

  @override
  $FtUserImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$$FtUserImplCopyWithImpl<$Res>
    extends _$FtUserCopyWithImpl<$Res, _$FtUserImpl>
    implements _$$FtUserImplCopyWith<$Res> {
  __$$FtUserImplCopyWithImpl(
      _$FtUserImpl _value, $Res Function(_$FtUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of FtUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? displayName = null,
    Object? image = freezed,
    Object? correctionPoint = null,
    Object? wallet = null,
    Object? location = freezed,
    Object? poolMonth = freezed,
    Object? poolYear = freezed,
    Object? isStaff = null,
    Object? isAlumni = null,
    Object? isActive = null,
    Object? cursusUsers = null,
    Object? projectsUsers = null,
  }) {
    return _then(_$FtUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as FtUserImage?,
      correctionPoint: null == correctionPoint
          ? _value.correctionPoint
          : correctionPoint // ignore: cast_nullable_to_non_nullable
              as int,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as int,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      poolMonth: freezed == poolMonth
          ? _value.poolMonth
          : poolMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      poolYear: freezed == poolYear
          ? _value.poolYear
          : poolYear // ignore: cast_nullable_to_non_nullable
              as String?,
      isStaff: null == isStaff
          ? _value.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool,
      isAlumni: null == isAlumni
          ? _value.isAlumni
          : isAlumni // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      cursusUsers: null == cursusUsers
          ? _value._cursusUsers
          : cursusUsers // ignore: cast_nullable_to_non_nullable
              as List<CursusUser>,
      projectsUsers: null == projectsUsers
          ? _value._projectsUsers
          : projectsUsers // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FtUserImpl implements _FtUser {
  const _$FtUserImpl(
      {required this.id,
      required this.login,
      required this.email,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      @JsonKey(name: 'displayname') required this.displayName,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'correction_point') this.correctionPoint = 0,
      @JsonKey(name: 'wallet') this.wallet = 0,
      this.location,
      @JsonKey(name: 'pool_month') this.poolMonth,
      @JsonKey(name: 'pool_year') this.poolYear,
      @JsonKey(name: 'staff?') this.isStaff = false,
      @JsonKey(name: 'alumni?') this.isAlumni = false,
      @JsonKey(name: 'active?') this.isActive = true,
      @JsonKey(name: 'cursus_users')
      final List<CursusUser> cursusUsers = const [],
      @JsonKey(name: 'projects_users')
      final List<ProjectUser> projectsUsers = const []})
      : _cursusUsers = cursusUsers,
        _projectsUsers = projectsUsers;

  factory _$FtUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$FtUserImplFromJson(json);

  @override
  final int id;
  @override
  final String login;
  @override
  final String email;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'displayname')
  final String displayName;
  @override
  @JsonKey(name: 'image')
  final FtUserImage? image;
  @override
  @JsonKey(name: 'correction_point')
  final int correctionPoint;
  @override
  @JsonKey(name: 'wallet')
  final int wallet;
  @override
  final String? location;
  @override
  @JsonKey(name: 'pool_month')
  final String? poolMonth;
  @override
  @JsonKey(name: 'pool_year')
  final String? poolYear;
  @override
  @JsonKey(name: 'staff?')
  final bool isStaff;
  @override
  @JsonKey(name: 'alumni?')
  final bool isAlumni;
  @override
  @JsonKey(name: 'active?')
  final bool isActive;
  final List<CursusUser> _cursusUsers;
  @override
  @JsonKey(name: 'cursus_users')
  List<CursusUser> get cursusUsers {
    if (_cursusUsers is EqualUnmodifiableListView) return _cursusUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cursusUsers);
  }

  final List<ProjectUser> _projectsUsers;
  @override
  @JsonKey(name: 'projects_users')
  List<ProjectUser> get projectsUsers {
    if (_projectsUsers is EqualUnmodifiableListView) return _projectsUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectsUsers);
  }

  @override
  String toString() {
    return 'FtUser(id: $id, login: $login, email: $email, firstName: $firstName, lastName: $lastName, displayName: $displayName, image: $image, correctionPoint: $correctionPoint, wallet: $wallet, location: $location, poolMonth: $poolMonth, poolYear: $poolYear, isStaff: $isStaff, isAlumni: $isAlumni, isActive: $isActive, cursusUsers: $cursusUsers, projectsUsers: $projectsUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FtUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.correctionPoint, correctionPoint) ||
                other.correctionPoint == correctionPoint) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.poolMonth, poolMonth) ||
                other.poolMonth == poolMonth) &&
            (identical(other.poolYear, poolYear) ||
                other.poolYear == poolYear) &&
            (identical(other.isStaff, isStaff) || other.isStaff == isStaff) &&
            (identical(other.isAlumni, isAlumni) ||
                other.isAlumni == isAlumni) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._cursusUsers, _cursusUsers) &&
            const DeepCollectionEquality()
                .equals(other._projectsUsers, _projectsUsers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      login,
      email,
      firstName,
      lastName,
      displayName,
      image,
      correctionPoint,
      wallet,
      location,
      poolMonth,
      poolYear,
      isStaff,
      isAlumni,
      isActive,
      const DeepCollectionEquality().hash(_cursusUsers),
      const DeepCollectionEquality().hash(_projectsUsers));

  /// Create a copy of FtUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FtUserImplCopyWith<_$FtUserImpl> get copyWith =>
      __$$FtUserImplCopyWithImpl<_$FtUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FtUserImplToJson(
      this,
    );
  }
}

abstract class _FtUser implements FtUser {
  const factory _FtUser(
      {required final int id,
      required final String login,
      required final String email,
      @JsonKey(name: 'first_name') required final String firstName,
      @JsonKey(name: 'last_name') required final String lastName,
      @JsonKey(name: 'displayname') required final String displayName,
      @JsonKey(name: 'image') final FtUserImage? image,
      @JsonKey(name: 'correction_point') final int correctionPoint,
      @JsonKey(name: 'wallet') final int wallet,
      final String? location,
      @JsonKey(name: 'pool_month') final String? poolMonth,
      @JsonKey(name: 'pool_year') final String? poolYear,
      @JsonKey(name: 'staff?') final bool isStaff,
      @JsonKey(name: 'alumni?') final bool isAlumni,
      @JsonKey(name: 'active?') final bool isActive,
      @JsonKey(name: 'cursus_users') final List<CursusUser> cursusUsers,
      @JsonKey(name: 'projects_users')
      final List<ProjectUser> projectsUsers}) = _$FtUserImpl;

  factory _FtUser.fromJson(Map<String, dynamic> json) = _$FtUserImpl.fromJson;

  @override
  int get id;
  @override
  String get login;
  @override
  String get email;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'displayname')
  String get displayName;
  @override
  @JsonKey(name: 'image')
  FtUserImage? get image;
  @override
  @JsonKey(name: 'correction_point')
  int get correctionPoint;
  @override
  @JsonKey(name: 'wallet')
  int get wallet;
  @override
  String? get location;
  @override
  @JsonKey(name: 'pool_month')
  String? get poolMonth;
  @override
  @JsonKey(name: 'pool_year')
  String? get poolYear;
  @override
  @JsonKey(name: 'staff?')
  bool get isStaff;
  @override
  @JsonKey(name: 'alumni?')
  bool get isAlumni;
  @override
  @JsonKey(name: 'active?')
  bool get isActive;
  @override
  @JsonKey(name: 'cursus_users')
  List<CursusUser> get cursusUsers;
  @override
  @JsonKey(name: 'projects_users')
  List<ProjectUser> get projectsUsers;

  /// Create a copy of FtUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FtUserImplCopyWith<_$FtUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FtUserImage _$FtUserImageFromJson(Map<String, dynamic> json) {
  return _FtUserImage.fromJson(json);
}

/// @nodoc
mixin _$FtUserImage {
  String? get link => throw _privateConstructorUsedError;
  FtImageVersions? get versions => throw _privateConstructorUsedError;

  /// Serializes this FtUserImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FtUserImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FtUserImageCopyWith<FtUserImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FtUserImageCopyWith<$Res> {
  factory $FtUserImageCopyWith(
          FtUserImage value, $Res Function(FtUserImage) then) =
      _$FtUserImageCopyWithImpl<$Res, FtUserImage>;
  @useResult
  $Res call({String? link, FtImageVersions? versions});

  $FtImageVersionsCopyWith<$Res>? get versions;
}

/// @nodoc
class _$FtUserImageCopyWithImpl<$Res, $Val extends FtUserImage>
    implements $FtUserImageCopyWith<$Res> {
  _$FtUserImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FtUserImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? versions = freezed,
  }) {
    return _then(_value.copyWith(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      versions: freezed == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as FtImageVersions?,
    ) as $Val);
  }

  /// Create a copy of FtUserImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FtImageVersionsCopyWith<$Res>? get versions {
    if (_value.versions == null) {
      return null;
    }

    return $FtImageVersionsCopyWith<$Res>(_value.versions!, (value) {
      return _then(_value.copyWith(versions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FtUserImageImplCopyWith<$Res>
    implements $FtUserImageCopyWith<$Res> {
  factory _$$FtUserImageImplCopyWith(
          _$FtUserImageImpl value, $Res Function(_$FtUserImageImpl) then) =
      __$$FtUserImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? link, FtImageVersions? versions});

  @override
  $FtImageVersionsCopyWith<$Res>? get versions;
}

/// @nodoc
class __$$FtUserImageImplCopyWithImpl<$Res>
    extends _$FtUserImageCopyWithImpl<$Res, _$FtUserImageImpl>
    implements _$$FtUserImageImplCopyWith<$Res> {
  __$$FtUserImageImplCopyWithImpl(
      _$FtUserImageImpl _value, $Res Function(_$FtUserImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of FtUserImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? versions = freezed,
  }) {
    return _then(_$FtUserImageImpl(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      versions: freezed == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as FtImageVersions?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FtUserImageImpl implements _FtUserImage {
  const _$FtUserImageImpl({this.link, this.versions});

  factory _$FtUserImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$FtUserImageImplFromJson(json);

  @override
  final String? link;
  @override
  final FtImageVersions? versions;

  @override
  String toString() {
    return 'FtUserImage(link: $link, versions: $versions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FtUserImageImpl &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.versions, versions) ||
                other.versions == versions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, link, versions);

  /// Create a copy of FtUserImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FtUserImageImplCopyWith<_$FtUserImageImpl> get copyWith =>
      __$$FtUserImageImplCopyWithImpl<_$FtUserImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FtUserImageImplToJson(
      this,
    );
  }
}

abstract class _FtUserImage implements FtUserImage {
  const factory _FtUserImage(
      {final String? link,
      final FtImageVersions? versions}) = _$FtUserImageImpl;

  factory _FtUserImage.fromJson(Map<String, dynamic> json) =
      _$FtUserImageImpl.fromJson;

  @override
  String? get link;
  @override
  FtImageVersions? get versions;

  /// Create a copy of FtUserImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FtUserImageImplCopyWith<_$FtUserImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FtImageVersions _$FtImageVersionsFromJson(Map<String, dynamic> json) {
  return _FtImageVersions.fromJson(json);
}

/// @nodoc
mixin _$FtImageVersions {
  String? get large => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;
  String? get small => throw _privateConstructorUsedError;
  String? get micro => throw _privateConstructorUsedError;

  /// Serializes this FtImageVersions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FtImageVersions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FtImageVersionsCopyWith<FtImageVersions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FtImageVersionsCopyWith<$Res> {
  factory $FtImageVersionsCopyWith(
          FtImageVersions value, $Res Function(FtImageVersions) then) =
      _$FtImageVersionsCopyWithImpl<$Res, FtImageVersions>;
  @useResult
  $Res call({String? large, String? medium, String? small, String? micro});
}

/// @nodoc
class _$FtImageVersionsCopyWithImpl<$Res, $Val extends FtImageVersions>
    implements $FtImageVersionsCopyWith<$Res> {
  _$FtImageVersionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FtImageVersions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? large = freezed,
    Object? medium = freezed,
    Object? small = freezed,
    Object? micro = freezed,
  }) {
    return _then(_value.copyWith(
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      micro: freezed == micro
          ? _value.micro
          : micro // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FtImageVersionsImplCopyWith<$Res>
    implements $FtImageVersionsCopyWith<$Res> {
  factory _$$FtImageVersionsImplCopyWith(_$FtImageVersionsImpl value,
          $Res Function(_$FtImageVersionsImpl) then) =
      __$$FtImageVersionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? large, String? medium, String? small, String? micro});
}

/// @nodoc
class __$$FtImageVersionsImplCopyWithImpl<$Res>
    extends _$FtImageVersionsCopyWithImpl<$Res, _$FtImageVersionsImpl>
    implements _$$FtImageVersionsImplCopyWith<$Res> {
  __$$FtImageVersionsImplCopyWithImpl(
      _$FtImageVersionsImpl _value, $Res Function(_$FtImageVersionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FtImageVersions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? large = freezed,
    Object? medium = freezed,
    Object? small = freezed,
    Object? micro = freezed,
  }) {
    return _then(_$FtImageVersionsImpl(
      large: freezed == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String?,
      small: freezed == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String?,
      micro: freezed == micro
          ? _value.micro
          : micro // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FtImageVersionsImpl implements _FtImageVersions {
  const _$FtImageVersionsImpl(
      {this.large, this.medium, this.small, this.micro});

  factory _$FtImageVersionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FtImageVersionsImplFromJson(json);

  @override
  final String? large;
  @override
  final String? medium;
  @override
  final String? small;
  @override
  final String? micro;

  @override
  String toString() {
    return 'FtImageVersions(large: $large, medium: $medium, small: $small, micro: $micro)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FtImageVersionsImpl &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.micro, micro) || other.micro == micro));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, large, medium, small, micro);

  /// Create a copy of FtImageVersions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FtImageVersionsImplCopyWith<_$FtImageVersionsImpl> get copyWith =>
      __$$FtImageVersionsImplCopyWithImpl<_$FtImageVersionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FtImageVersionsImplToJson(
      this,
    );
  }
}

abstract class _FtImageVersions implements FtImageVersions {
  const factory _FtImageVersions(
      {final String? large,
      final String? medium,
      final String? small,
      final String? micro}) = _$FtImageVersionsImpl;

  factory _FtImageVersions.fromJson(Map<String, dynamic> json) =
      _$FtImageVersionsImpl.fromJson;

  @override
  String? get large;
  @override
  String? get medium;
  @override
  String? get small;
  @override
  String? get micro;

  /// Create a copy of FtImageVersions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FtImageVersionsImplCopyWith<_$FtImageVersionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CursusUser _$CursusUserFromJson(Map<String, dynamic> json) {
  return _CursusUser.fromJson(json);
}

/// @nodoc
mixin _$CursusUser {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'begin_at')
  String? get beginAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_at')
  String? get endAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'blackholed_at')
  String? get blackholedAt => throw _privateConstructorUsedError;
  String? get grade => throw _privateConstructorUsedError;
  double get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'cursus_id')
  int get cursusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cursus')
  CursusInfo? get cursus => throw _privateConstructorUsedError;

  /// Serializes this CursusUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CursusUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CursusUserCopyWith<CursusUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursusUserCopyWith<$Res> {
  factory $CursusUserCopyWith(
          CursusUser value, $Res Function(CursusUser) then) =
      _$CursusUserCopyWithImpl<$Res, CursusUser>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'begin_at') String? beginAt,
      @JsonKey(name: 'end_at') String? endAt,
      @JsonKey(name: 'blackholed_at') String? blackholedAt,
      String? grade,
      double level,
      @JsonKey(name: 'cursus_id') int cursusId,
      @JsonKey(name: 'cursus') CursusInfo? cursus});

  $CursusInfoCopyWith<$Res>? get cursus;
}

/// @nodoc
class _$CursusUserCopyWithImpl<$Res, $Val extends CursusUser>
    implements $CursusUserCopyWith<$Res> {
  _$CursusUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CursusUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? beginAt = freezed,
    Object? endAt = freezed,
    Object? blackholedAt = freezed,
    Object? grade = freezed,
    Object? level = null,
    Object? cursusId = null,
    Object? cursus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      beginAt: freezed == beginAt
          ? _value.beginAt
          : beginAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String?,
      blackholedAt: freezed == blackholedAt
          ? _value.blackholedAt
          : blackholedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
      cursusId: null == cursusId
          ? _value.cursusId
          : cursusId // ignore: cast_nullable_to_non_nullable
              as int,
      cursus: freezed == cursus
          ? _value.cursus
          : cursus // ignore: cast_nullable_to_non_nullable
              as CursusInfo?,
    ) as $Val);
  }

  /// Create a copy of CursusUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CursusInfoCopyWith<$Res>? get cursus {
    if (_value.cursus == null) {
      return null;
    }

    return $CursusInfoCopyWith<$Res>(_value.cursus!, (value) {
      return _then(_value.copyWith(cursus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CursusUserImplCopyWith<$Res>
    implements $CursusUserCopyWith<$Res> {
  factory _$$CursusUserImplCopyWith(
          _$CursusUserImpl value, $Res Function(_$CursusUserImpl) then) =
      __$$CursusUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'begin_at') String? beginAt,
      @JsonKey(name: 'end_at') String? endAt,
      @JsonKey(name: 'blackholed_at') String? blackholedAt,
      String? grade,
      double level,
      @JsonKey(name: 'cursus_id') int cursusId,
      @JsonKey(name: 'cursus') CursusInfo? cursus});

  @override
  $CursusInfoCopyWith<$Res>? get cursus;
}

/// @nodoc
class __$$CursusUserImplCopyWithImpl<$Res>
    extends _$CursusUserCopyWithImpl<$Res, _$CursusUserImpl>
    implements _$$CursusUserImplCopyWith<$Res> {
  __$$CursusUserImplCopyWithImpl(
      _$CursusUserImpl _value, $Res Function(_$CursusUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of CursusUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? beginAt = freezed,
    Object? endAt = freezed,
    Object? blackholedAt = freezed,
    Object? grade = freezed,
    Object? level = null,
    Object? cursusId = null,
    Object? cursus = freezed,
  }) {
    return _then(_$CursusUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      beginAt: freezed == beginAt
          ? _value.beginAt
          : beginAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String?,
      blackholedAt: freezed == blackholedAt
          ? _value.blackholedAt
          : blackholedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
      cursusId: null == cursusId
          ? _value.cursusId
          : cursusId // ignore: cast_nullable_to_non_nullable
              as int,
      cursus: freezed == cursus
          ? _value.cursus
          : cursus // ignore: cast_nullable_to_non_nullable
              as CursusInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CursusUserImpl implements _CursusUser {
  const _$CursusUserImpl(
      {required this.id,
      @JsonKey(name: 'begin_at') this.beginAt,
      @JsonKey(name: 'end_at') this.endAt,
      @JsonKey(name: 'blackholed_at') this.blackholedAt,
      this.grade,
      this.level = 0.0,
      @JsonKey(name: 'cursus_id') required this.cursusId,
      @JsonKey(name: 'cursus') this.cursus});

  factory _$CursusUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$CursusUserImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'begin_at')
  final String? beginAt;
  @override
  @JsonKey(name: 'end_at')
  final String? endAt;
  @override
  @JsonKey(name: 'blackholed_at')
  final String? blackholedAt;
  @override
  final String? grade;
  @override
  @JsonKey()
  final double level;
  @override
  @JsonKey(name: 'cursus_id')
  final int cursusId;
  @override
  @JsonKey(name: 'cursus')
  final CursusInfo? cursus;

  @override
  String toString() {
    return 'CursusUser(id: $id, beginAt: $beginAt, endAt: $endAt, blackholedAt: $blackholedAt, grade: $grade, level: $level, cursusId: $cursusId, cursus: $cursus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CursusUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.beginAt, beginAt) || other.beginAt == beginAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.blackholedAt, blackholedAt) ||
                other.blackholedAt == blackholedAt) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.cursusId, cursusId) ||
                other.cursusId == cursusId) &&
            (identical(other.cursus, cursus) || other.cursus == cursus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, beginAt, endAt, blackholedAt,
      grade, level, cursusId, cursus);

  /// Create a copy of CursusUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CursusUserImplCopyWith<_$CursusUserImpl> get copyWith =>
      __$$CursusUserImplCopyWithImpl<_$CursusUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CursusUserImplToJson(
      this,
    );
  }
}

abstract class _CursusUser implements CursusUser {
  const factory _CursusUser(
      {required final int id,
      @JsonKey(name: 'begin_at') final String? beginAt,
      @JsonKey(name: 'end_at') final String? endAt,
      @JsonKey(name: 'blackholed_at') final String? blackholedAt,
      final String? grade,
      final double level,
      @JsonKey(name: 'cursus_id') required final int cursusId,
      @JsonKey(name: 'cursus') final CursusInfo? cursus}) = _$CursusUserImpl;

  factory _CursusUser.fromJson(Map<String, dynamic> json) =
      _$CursusUserImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'begin_at')
  String? get beginAt;
  @override
  @JsonKey(name: 'end_at')
  String? get endAt;
  @override
  @JsonKey(name: 'blackholed_at')
  String? get blackholedAt;
  @override
  String? get grade;
  @override
  double get level;
  @override
  @JsonKey(name: 'cursus_id')
  int get cursusId;
  @override
  @JsonKey(name: 'cursus')
  CursusInfo? get cursus;

  /// Create a copy of CursusUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CursusUserImplCopyWith<_$CursusUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CursusInfo _$CursusInfoFromJson(Map<String, dynamic> json) {
  return _CursusInfo.fromJson(json);
}

/// @nodoc
mixin _$CursusInfo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CursusInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CursusInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CursusInfoCopyWith<CursusInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursusInfoCopyWith<$Res> {
  factory $CursusInfoCopyWith(
          CursusInfo value, $Res Function(CursusInfo) then) =
      _$CursusInfoCopyWithImpl<$Res, CursusInfo>;
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$CursusInfoCopyWithImpl<$Res, $Val extends CursusInfo>
    implements $CursusInfoCopyWith<$Res> {
  _$CursusInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CursusInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? createdAt = freezed,
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
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CursusInfoImplCopyWith<$Res>
    implements $CursusInfoCopyWith<$Res> {
  factory _$$CursusInfoImplCopyWith(
          _$CursusInfoImpl value, $Res Function(_$CursusInfoImpl) then) =
      __$$CursusInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$CursusInfoImplCopyWithImpl<$Res>
    extends _$CursusInfoCopyWithImpl<$Res, _$CursusInfoImpl>
    implements _$$CursusInfoImplCopyWith<$Res> {
  __$$CursusInfoImplCopyWithImpl(
      _$CursusInfoImpl _value, $Res Function(_$CursusInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CursusInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$CursusInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CursusInfoImpl implements _CursusInfo {
  const _$CursusInfoImpl(
      {required this.id,
      required this.name,
      required this.slug,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$CursusInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CursusInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'CursusInfo(id: $id, name: $name, slug: $slug, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CursusInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, createdAt);

  /// Create a copy of CursusInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CursusInfoImplCopyWith<_$CursusInfoImpl> get copyWith =>
      __$$CursusInfoImplCopyWithImpl<_$CursusInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CursusInfoImplToJson(
      this,
    );
  }
}

abstract class _CursusInfo implements CursusInfo {
  const factory _CursusInfo(
      {required final int id,
      required final String name,
      required final String slug,
      @JsonKey(name: 'created_at') final String? createdAt}) = _$CursusInfoImpl;

  factory _CursusInfo.fromJson(Map<String, dynamic> json) =
      _$CursusInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of CursusInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CursusInfoImplCopyWith<_$CursusInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectUser _$ProjectUserFromJson(Map<String, dynamic> json) {
  return _ProjectUser.fromJson(json);
}

/// @nodoc
mixin _$ProjectUser {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_mark')
  int? get finalMark => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'validated?')
  bool? get validated => throw _privateConstructorUsedError;
  @JsonKey(name: 'marked_at')
  String? get markedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'project')
  ProjectInfo get project => throw _privateConstructorUsedError;
  @JsonKey(name: 'cursus_ids')
  List<int> get cursusIds => throw _privateConstructorUsedError;

  /// Serializes this ProjectUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectUserCopyWith<ProjectUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectUserCopyWith<$Res> {
  factory $ProjectUserCopyWith(
          ProjectUser value, $Res Function(ProjectUser) then) =
      _$ProjectUserCopyWithImpl<$Res, ProjectUser>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'final_mark') int? finalMark,
      String status,
      @JsonKey(name: 'validated?') bool? validated,
      @JsonKey(name: 'marked_at') String? markedAt,
      @JsonKey(name: 'project') ProjectInfo project,
      @JsonKey(name: 'cursus_ids') List<int> cursusIds});

  $ProjectInfoCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectUserCopyWithImpl<$Res, $Val extends ProjectUser>
    implements $ProjectUserCopyWith<$Res> {
  _$ProjectUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? finalMark = freezed,
    Object? status = null,
    Object? validated = freezed,
    Object? markedAt = freezed,
    Object? project = null,
    Object? cursusIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      finalMark: freezed == finalMark
          ? _value.finalMark
          : finalMark // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      validated: freezed == validated
          ? _value.validated
          : validated // ignore: cast_nullable_to_non_nullable
              as bool?,
      markedAt: freezed == markedAt
          ? _value.markedAt
          : markedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectInfo,
      cursusIds: null == cursusIds
          ? _value.cursusIds
          : cursusIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }

  /// Create a copy of ProjectUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectInfoCopyWith<$Res> get project {
    return $ProjectInfoCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectUserImplCopyWith<$Res>
    implements $ProjectUserCopyWith<$Res> {
  factory _$$ProjectUserImplCopyWith(
          _$ProjectUserImpl value, $Res Function(_$ProjectUserImpl) then) =
      __$$ProjectUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'final_mark') int? finalMark,
      String status,
      @JsonKey(name: 'validated?') bool? validated,
      @JsonKey(name: 'marked_at') String? markedAt,
      @JsonKey(name: 'project') ProjectInfo project,
      @JsonKey(name: 'cursus_ids') List<int> cursusIds});

  @override
  $ProjectInfoCopyWith<$Res> get project;
}

/// @nodoc
class __$$ProjectUserImplCopyWithImpl<$Res>
    extends _$ProjectUserCopyWithImpl<$Res, _$ProjectUserImpl>
    implements _$$ProjectUserImplCopyWith<$Res> {
  __$$ProjectUserImplCopyWithImpl(
      _$ProjectUserImpl _value, $Res Function(_$ProjectUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? finalMark = freezed,
    Object? status = null,
    Object? validated = freezed,
    Object? markedAt = freezed,
    Object? project = null,
    Object? cursusIds = null,
  }) {
    return _then(_$ProjectUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      finalMark: freezed == finalMark
          ? _value.finalMark
          : finalMark // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      validated: freezed == validated
          ? _value.validated
          : validated // ignore: cast_nullable_to_non_nullable
              as bool?,
      markedAt: freezed == markedAt
          ? _value.markedAt
          : markedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectInfo,
      cursusIds: null == cursusIds
          ? _value._cursusIds
          : cursusIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectUserImpl implements _ProjectUser {
  const _$ProjectUserImpl(
      {required this.id,
      @JsonKey(name: 'final_mark') this.finalMark,
      required this.status,
      @JsonKey(name: 'validated?') this.validated,
      @JsonKey(name: 'marked_at') this.markedAt,
      @JsonKey(name: 'project') required this.project,
      @JsonKey(name: 'cursus_ids') final List<int> cursusIds = const []})
      : _cursusIds = cursusIds;

  factory _$ProjectUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectUserImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'final_mark')
  final int? finalMark;
  @override
  final String status;
  @override
  @JsonKey(name: 'validated?')
  final bool? validated;
  @override
  @JsonKey(name: 'marked_at')
  final String? markedAt;
  @override
  @JsonKey(name: 'project')
  final ProjectInfo project;
  final List<int> _cursusIds;
  @override
  @JsonKey(name: 'cursus_ids')
  List<int> get cursusIds {
    if (_cursusIds is EqualUnmodifiableListView) return _cursusIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cursusIds);
  }

  @override
  String toString() {
    return 'ProjectUser(id: $id, finalMark: $finalMark, status: $status, validated: $validated, markedAt: $markedAt, project: $project, cursusIds: $cursusIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.finalMark, finalMark) ||
                other.finalMark == finalMark) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.validated, validated) ||
                other.validated == validated) &&
            (identical(other.markedAt, markedAt) ||
                other.markedAt == markedAt) &&
            (identical(other.project, project) || other.project == project) &&
            const DeepCollectionEquality()
                .equals(other._cursusIds, _cursusIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, finalMark, status, validated,
      markedAt, project, const DeepCollectionEquality().hash(_cursusIds));

  /// Create a copy of ProjectUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectUserImplCopyWith<_$ProjectUserImpl> get copyWith =>
      __$$ProjectUserImplCopyWithImpl<_$ProjectUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectUserImplToJson(
      this,
    );
  }
}

abstract class _ProjectUser implements ProjectUser {
  const factory _ProjectUser(
          {required final int id,
          @JsonKey(name: 'final_mark') final int? finalMark,
          required final String status,
          @JsonKey(name: 'validated?') final bool? validated,
          @JsonKey(name: 'marked_at') final String? markedAt,
          @JsonKey(name: 'project') required final ProjectInfo project,
          @JsonKey(name: 'cursus_ids') final List<int> cursusIds}) =
      _$ProjectUserImpl;

  factory _ProjectUser.fromJson(Map<String, dynamic> json) =
      _$ProjectUserImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'final_mark')
  int? get finalMark;
  @override
  String get status;
  @override
  @JsonKey(name: 'validated?')
  bool? get validated;
  @override
  @JsonKey(name: 'marked_at')
  String? get markedAt;
  @override
  @JsonKey(name: 'project')
  ProjectInfo get project;
  @override
  @JsonKey(name: 'cursus_ids')
  List<int> get cursusIds;

  /// Create a copy of ProjectUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectUserImplCopyWith<_$ProjectUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectInfo _$ProjectInfoFromJson(Map<String, dynamic> json) {
  return _ProjectInfo.fromJson(json);
}

/// @nodoc
mixin _$ProjectInfo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;

  /// Serializes this ProjectInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectInfoCopyWith<ProjectInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectInfoCopyWith<$Res> {
  factory $ProjectInfoCopyWith(
          ProjectInfo value, $Res Function(ProjectInfo) then) =
      _$ProjectInfoCopyWithImpl<$Res, ProjectInfo>;
  @useResult
  $Res call({int id, String name, String slug});
}

/// @nodoc
class _$ProjectInfoCopyWithImpl<$Res, $Val extends ProjectInfo>
    implements $ProjectInfoCopyWith<$Res> {
  _$ProjectInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
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
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectInfoImplCopyWith<$Res>
    implements $ProjectInfoCopyWith<$Res> {
  factory _$$ProjectInfoImplCopyWith(
          _$ProjectInfoImpl value, $Res Function(_$ProjectInfoImpl) then) =
      __$$ProjectInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String slug});
}

/// @nodoc
class __$$ProjectInfoImplCopyWithImpl<$Res>
    extends _$ProjectInfoCopyWithImpl<$Res, _$ProjectInfoImpl>
    implements _$$ProjectInfoImplCopyWith<$Res> {
  __$$ProjectInfoImplCopyWithImpl(
      _$ProjectInfoImpl _value, $Res Function(_$ProjectInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
  }) {
    return _then(_$ProjectInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectInfoImpl implements _ProjectInfo {
  const _$ProjectInfoImpl(
      {required this.id, required this.name, required this.slug});

  factory _$ProjectInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;

  @override
  String toString() {
    return 'ProjectInfo(id: $id, name: $name, slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug);

  /// Create a copy of ProjectInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectInfoImplCopyWith<_$ProjectInfoImpl> get copyWith =>
      __$$ProjectInfoImplCopyWithImpl<_$ProjectInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectInfoImplToJson(
      this,
    );
  }
}

abstract class _ProjectInfo implements ProjectInfo {
  const factory _ProjectInfo(
      {required final int id,
      required final String name,
      required final String slug}) = _$ProjectInfoImpl;

  factory _ProjectInfo.fromJson(Map<String, dynamic> json) =
      _$ProjectInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;

  /// Create a copy of ProjectInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectInfoImplCopyWith<_$ProjectInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
