// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FtUser {

 int get id; String get login; String get email;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName;@JsonKey(name: 'displayname') String get displayName;@JsonKey(name: 'image') FtUserImage? get image;@JsonKey(name: 'correction_point') int get correctionPoint;@JsonKey(name: 'wallet') int get wallet; String? get location;@JsonKey(name: 'pool_month') String? get poolMonth;@JsonKey(name: 'pool_year') String? get poolYear;@JsonKey(name: 'staff?') bool get isStaff;@JsonKey(name: 'alumni?') bool get isAlumni;@JsonKey(name: 'active?') bool get isActive;@JsonKey(name: 'cursus_users') List<CursusUser> get cursusUsers;@JsonKey(name: 'projects_users') List<ProjectUser> get projectsUsers;
/// Create a copy of FtUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtUserCopyWith<FtUser> get copyWith => _$FtUserCopyWithImpl<FtUser>(this as FtUser, _$identity);

  /// Serializes this FtUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtUser&&(identical(other.id, id) || other.id == id)&&(identical(other.login, login) || other.login == login)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.image, image) || other.image == image)&&(identical(other.correctionPoint, correctionPoint) || other.correctionPoint == correctionPoint)&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.location, location) || other.location == location)&&(identical(other.poolMonth, poolMonth) || other.poolMonth == poolMonth)&&(identical(other.poolYear, poolYear) || other.poolYear == poolYear)&&(identical(other.isStaff, isStaff) || other.isStaff == isStaff)&&(identical(other.isAlumni, isAlumni) || other.isAlumni == isAlumni)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.cursusUsers, cursusUsers)&&const DeepCollectionEquality().equals(other.projectsUsers, projectsUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,login,email,firstName,lastName,displayName,image,correctionPoint,wallet,location,poolMonth,poolYear,isStaff,isAlumni,isActive,const DeepCollectionEquality().hash(cursusUsers),const DeepCollectionEquality().hash(projectsUsers));

@override
String toString() {
  return 'FtUser(id: $id, login: $login, email: $email, firstName: $firstName, lastName: $lastName, displayName: $displayName, image: $image, correctionPoint: $correctionPoint, wallet: $wallet, location: $location, poolMonth: $poolMonth, poolYear: $poolYear, isStaff: $isStaff, isAlumni: $isAlumni, isActive: $isActive, cursusUsers: $cursusUsers, projectsUsers: $projectsUsers)';
}


}

/// @nodoc
abstract mixin class $FtUserCopyWith<$Res>  {
  factory $FtUserCopyWith(FtUser value, $Res Function(FtUser) _then) = _$FtUserCopyWithImpl;
@useResult
$Res call({
 int id, String login, String email,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'displayname') String displayName,@JsonKey(name: 'image') FtUserImage? image,@JsonKey(name: 'correction_point') int correctionPoint,@JsonKey(name: 'wallet') int wallet, String? location,@JsonKey(name: 'pool_month') String? poolMonth,@JsonKey(name: 'pool_year') String? poolYear,@JsonKey(name: 'staff?') bool isStaff,@JsonKey(name: 'alumni?') bool isAlumni,@JsonKey(name: 'active?') bool isActive,@JsonKey(name: 'cursus_users') List<CursusUser> cursusUsers,@JsonKey(name: 'projects_users') List<ProjectUser> projectsUsers
});


$FtUserImageCopyWith<$Res>? get image;

}
/// @nodoc
class _$FtUserCopyWithImpl<$Res>
    implements $FtUserCopyWith<$Res> {
  _$FtUserCopyWithImpl(this._self, this._then);

  final FtUser _self;
  final $Res Function(FtUser) _then;

/// Create a copy of FtUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? login = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? displayName = null,Object? image = freezed,Object? correctionPoint = null,Object? wallet = null,Object? location = freezed,Object? poolMonth = freezed,Object? poolYear = freezed,Object? isStaff = null,Object? isAlumni = null,Object? isActive = null,Object? cursusUsers = null,Object? projectsUsers = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as FtUserImage?,correctionPoint: null == correctionPoint ? _self.correctionPoint : correctionPoint // ignore: cast_nullable_to_non_nullable
as int,wallet: null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,poolMonth: freezed == poolMonth ? _self.poolMonth : poolMonth // ignore: cast_nullable_to_non_nullable
as String?,poolYear: freezed == poolYear ? _self.poolYear : poolYear // ignore: cast_nullable_to_non_nullable
as String?,isStaff: null == isStaff ? _self.isStaff : isStaff // ignore: cast_nullable_to_non_nullable
as bool,isAlumni: null == isAlumni ? _self.isAlumni : isAlumni // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,cursusUsers: null == cursusUsers ? _self.cursusUsers : cursusUsers // ignore: cast_nullable_to_non_nullable
as List<CursusUser>,projectsUsers: null == projectsUsers ? _self.projectsUsers : projectsUsers // ignore: cast_nullable_to_non_nullable
as List<ProjectUser>,
  ));
}
/// Create a copy of FtUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtUserImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $FtUserImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// Adds pattern-matching-related methods to [FtUser].
extension FtUserPatterns on FtUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtUser value)  $default,){
final _that = this;
switch (_that) {
case _FtUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtUser value)?  $default,){
final _that = this;
switch (_that) {
case _FtUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String login,  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'displayname')  String displayName, @JsonKey(name: 'image')  FtUserImage? image, @JsonKey(name: 'correction_point')  int correctionPoint, @JsonKey(name: 'wallet')  int wallet,  String? location, @JsonKey(name: 'pool_month')  String? poolMonth, @JsonKey(name: 'pool_year')  String? poolYear, @JsonKey(name: 'staff?')  bool isStaff, @JsonKey(name: 'alumni?')  bool isAlumni, @JsonKey(name: 'active?')  bool isActive, @JsonKey(name: 'cursus_users')  List<CursusUser> cursusUsers, @JsonKey(name: 'projects_users')  List<ProjectUser> projectsUsers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtUser() when $default != null:
return $default(_that.id,_that.login,_that.email,_that.firstName,_that.lastName,_that.displayName,_that.image,_that.correctionPoint,_that.wallet,_that.location,_that.poolMonth,_that.poolYear,_that.isStaff,_that.isAlumni,_that.isActive,_that.cursusUsers,_that.projectsUsers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String login,  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'displayname')  String displayName, @JsonKey(name: 'image')  FtUserImage? image, @JsonKey(name: 'correction_point')  int correctionPoint, @JsonKey(name: 'wallet')  int wallet,  String? location, @JsonKey(name: 'pool_month')  String? poolMonth, @JsonKey(name: 'pool_year')  String? poolYear, @JsonKey(name: 'staff?')  bool isStaff, @JsonKey(name: 'alumni?')  bool isAlumni, @JsonKey(name: 'active?')  bool isActive, @JsonKey(name: 'cursus_users')  List<CursusUser> cursusUsers, @JsonKey(name: 'projects_users')  List<ProjectUser> projectsUsers)  $default,) {final _that = this;
switch (_that) {
case _FtUser():
return $default(_that.id,_that.login,_that.email,_that.firstName,_that.lastName,_that.displayName,_that.image,_that.correctionPoint,_that.wallet,_that.location,_that.poolMonth,_that.poolYear,_that.isStaff,_that.isAlumni,_that.isActive,_that.cursusUsers,_that.projectsUsers);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String login,  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'displayname')  String displayName, @JsonKey(name: 'image')  FtUserImage? image, @JsonKey(name: 'correction_point')  int correctionPoint, @JsonKey(name: 'wallet')  int wallet,  String? location, @JsonKey(name: 'pool_month')  String? poolMonth, @JsonKey(name: 'pool_year')  String? poolYear, @JsonKey(name: 'staff?')  bool isStaff, @JsonKey(name: 'alumni?')  bool isAlumni, @JsonKey(name: 'active?')  bool isActive, @JsonKey(name: 'cursus_users')  List<CursusUser> cursusUsers, @JsonKey(name: 'projects_users')  List<ProjectUser> projectsUsers)?  $default,) {final _that = this;
switch (_that) {
case _FtUser() when $default != null:
return $default(_that.id,_that.login,_that.email,_that.firstName,_that.lastName,_that.displayName,_that.image,_that.correctionPoint,_that.wallet,_that.location,_that.poolMonth,_that.poolYear,_that.isStaff,_that.isAlumni,_that.isActive,_that.cursusUsers,_that.projectsUsers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FtUser implements FtUser {
  const _FtUser({required this.id, required this.login, required this.email, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, @JsonKey(name: 'displayname') required this.displayName, @JsonKey(name: 'image') this.image, @JsonKey(name: 'correction_point') this.correctionPoint = 0, @JsonKey(name: 'wallet') this.wallet = 0, this.location, @JsonKey(name: 'pool_month') this.poolMonth, @JsonKey(name: 'pool_year') this.poolYear, @JsonKey(name: 'staff?') this.isStaff = false, @JsonKey(name: 'alumni?') this.isAlumni = false, @JsonKey(name: 'active?') this.isActive = true, @JsonKey(name: 'cursus_users') final  List<CursusUser> cursusUsers = const [], @JsonKey(name: 'projects_users') final  List<ProjectUser> projectsUsers = const []}): _cursusUsers = cursusUsers,_projectsUsers = projectsUsers;
  factory _FtUser.fromJson(Map<String, dynamic> json) => _$FtUserFromJson(json);

@override final  int id;
@override final  String login;
@override final  String email;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'displayname') final  String displayName;
@override@JsonKey(name: 'image') final  FtUserImage? image;
@override@JsonKey(name: 'correction_point') final  int correctionPoint;
@override@JsonKey(name: 'wallet') final  int wallet;
@override final  String? location;
@override@JsonKey(name: 'pool_month') final  String? poolMonth;
@override@JsonKey(name: 'pool_year') final  String? poolYear;
@override@JsonKey(name: 'staff?') final  bool isStaff;
@override@JsonKey(name: 'alumni?') final  bool isAlumni;
@override@JsonKey(name: 'active?') final  bool isActive;
 final  List<CursusUser> _cursusUsers;
@override@JsonKey(name: 'cursus_users') List<CursusUser> get cursusUsers {
  if (_cursusUsers is EqualUnmodifiableListView) return _cursusUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cursusUsers);
}

 final  List<ProjectUser> _projectsUsers;
@override@JsonKey(name: 'projects_users') List<ProjectUser> get projectsUsers {
  if (_projectsUsers is EqualUnmodifiableListView) return _projectsUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projectsUsers);
}


/// Create a copy of FtUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtUserCopyWith<_FtUser> get copyWith => __$FtUserCopyWithImpl<_FtUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtUser&&(identical(other.id, id) || other.id == id)&&(identical(other.login, login) || other.login == login)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.image, image) || other.image == image)&&(identical(other.correctionPoint, correctionPoint) || other.correctionPoint == correctionPoint)&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.location, location) || other.location == location)&&(identical(other.poolMonth, poolMonth) || other.poolMonth == poolMonth)&&(identical(other.poolYear, poolYear) || other.poolYear == poolYear)&&(identical(other.isStaff, isStaff) || other.isStaff == isStaff)&&(identical(other.isAlumni, isAlumni) || other.isAlumni == isAlumni)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._cursusUsers, _cursusUsers)&&const DeepCollectionEquality().equals(other._projectsUsers, _projectsUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,login,email,firstName,lastName,displayName,image,correctionPoint,wallet,location,poolMonth,poolYear,isStaff,isAlumni,isActive,const DeepCollectionEquality().hash(_cursusUsers),const DeepCollectionEquality().hash(_projectsUsers));

@override
String toString() {
  return 'FtUser(id: $id, login: $login, email: $email, firstName: $firstName, lastName: $lastName, displayName: $displayName, image: $image, correctionPoint: $correctionPoint, wallet: $wallet, location: $location, poolMonth: $poolMonth, poolYear: $poolYear, isStaff: $isStaff, isAlumni: $isAlumni, isActive: $isActive, cursusUsers: $cursusUsers, projectsUsers: $projectsUsers)';
}


}

/// @nodoc
abstract mixin class _$FtUserCopyWith<$Res> implements $FtUserCopyWith<$Res> {
  factory _$FtUserCopyWith(_FtUser value, $Res Function(_FtUser) _then) = __$FtUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String login, String email,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'displayname') String displayName,@JsonKey(name: 'image') FtUserImage? image,@JsonKey(name: 'correction_point') int correctionPoint,@JsonKey(name: 'wallet') int wallet, String? location,@JsonKey(name: 'pool_month') String? poolMonth,@JsonKey(name: 'pool_year') String? poolYear,@JsonKey(name: 'staff?') bool isStaff,@JsonKey(name: 'alumni?') bool isAlumni,@JsonKey(name: 'active?') bool isActive,@JsonKey(name: 'cursus_users') List<CursusUser> cursusUsers,@JsonKey(name: 'projects_users') List<ProjectUser> projectsUsers
});


@override $FtUserImageCopyWith<$Res>? get image;

}
/// @nodoc
class __$FtUserCopyWithImpl<$Res>
    implements _$FtUserCopyWith<$Res> {
  __$FtUserCopyWithImpl(this._self, this._then);

  final _FtUser _self;
  final $Res Function(_FtUser) _then;

/// Create a copy of FtUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? login = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? displayName = null,Object? image = freezed,Object? correctionPoint = null,Object? wallet = null,Object? location = freezed,Object? poolMonth = freezed,Object? poolYear = freezed,Object? isStaff = null,Object? isAlumni = null,Object? isActive = null,Object? cursusUsers = null,Object? projectsUsers = null,}) {
  return _then(_FtUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as FtUserImage?,correctionPoint: null == correctionPoint ? _self.correctionPoint : correctionPoint // ignore: cast_nullable_to_non_nullable
as int,wallet: null == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,poolMonth: freezed == poolMonth ? _self.poolMonth : poolMonth // ignore: cast_nullable_to_non_nullable
as String?,poolYear: freezed == poolYear ? _self.poolYear : poolYear // ignore: cast_nullable_to_non_nullable
as String?,isStaff: null == isStaff ? _self.isStaff : isStaff // ignore: cast_nullable_to_non_nullable
as bool,isAlumni: null == isAlumni ? _self.isAlumni : isAlumni // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,cursusUsers: null == cursusUsers ? _self._cursusUsers : cursusUsers // ignore: cast_nullable_to_non_nullable
as List<CursusUser>,projectsUsers: null == projectsUsers ? _self._projectsUsers : projectsUsers // ignore: cast_nullable_to_non_nullable
as List<ProjectUser>,
  ));
}

/// Create a copy of FtUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtUserImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $FtUserImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// @nodoc
mixin _$FtUserImage {

 String? get link; FtImageVersions? get versions;
/// Create a copy of FtUserImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtUserImageCopyWith<FtUserImage> get copyWith => _$FtUserImageCopyWithImpl<FtUserImage>(this as FtUserImage, _$identity);

  /// Serializes this FtUserImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtUserImage&&(identical(other.link, link) || other.link == link)&&(identical(other.versions, versions) || other.versions == versions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,link,versions);

@override
String toString() {
  return 'FtUserImage(link: $link, versions: $versions)';
}


}

/// @nodoc
abstract mixin class $FtUserImageCopyWith<$Res>  {
  factory $FtUserImageCopyWith(FtUserImage value, $Res Function(FtUserImage) _then) = _$FtUserImageCopyWithImpl;
@useResult
$Res call({
 String? link, FtImageVersions? versions
});


$FtImageVersionsCopyWith<$Res>? get versions;

}
/// @nodoc
class _$FtUserImageCopyWithImpl<$Res>
    implements $FtUserImageCopyWith<$Res> {
  _$FtUserImageCopyWithImpl(this._self, this._then);

  final FtUserImage _self;
  final $Res Function(FtUserImage) _then;

/// Create a copy of FtUserImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? link = freezed,Object? versions = freezed,}) {
  return _then(_self.copyWith(
link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,versions: freezed == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as FtImageVersions?,
  ));
}
/// Create a copy of FtUserImage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtImageVersionsCopyWith<$Res>? get versions {
    if (_self.versions == null) {
    return null;
  }

  return $FtImageVersionsCopyWith<$Res>(_self.versions!, (value) {
    return _then(_self.copyWith(versions: value));
  });
}
}


/// Adds pattern-matching-related methods to [FtUserImage].
extension FtUserImagePatterns on FtUserImage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtUserImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtUserImage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtUserImage value)  $default,){
final _that = this;
switch (_that) {
case _FtUserImage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtUserImage value)?  $default,){
final _that = this;
switch (_that) {
case _FtUserImage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? link,  FtImageVersions? versions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtUserImage() when $default != null:
return $default(_that.link,_that.versions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? link,  FtImageVersions? versions)  $default,) {final _that = this;
switch (_that) {
case _FtUserImage():
return $default(_that.link,_that.versions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? link,  FtImageVersions? versions)?  $default,) {final _that = this;
switch (_that) {
case _FtUserImage() when $default != null:
return $default(_that.link,_that.versions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FtUserImage implements FtUserImage {
  const _FtUserImage({this.link, this.versions});
  factory _FtUserImage.fromJson(Map<String, dynamic> json) => _$FtUserImageFromJson(json);

@override final  String? link;
@override final  FtImageVersions? versions;

/// Create a copy of FtUserImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtUserImageCopyWith<_FtUserImage> get copyWith => __$FtUserImageCopyWithImpl<_FtUserImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtUserImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtUserImage&&(identical(other.link, link) || other.link == link)&&(identical(other.versions, versions) || other.versions == versions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,link,versions);

@override
String toString() {
  return 'FtUserImage(link: $link, versions: $versions)';
}


}

/// @nodoc
abstract mixin class _$FtUserImageCopyWith<$Res> implements $FtUserImageCopyWith<$Res> {
  factory _$FtUserImageCopyWith(_FtUserImage value, $Res Function(_FtUserImage) _then) = __$FtUserImageCopyWithImpl;
@override @useResult
$Res call({
 String? link, FtImageVersions? versions
});


@override $FtImageVersionsCopyWith<$Res>? get versions;

}
/// @nodoc
class __$FtUserImageCopyWithImpl<$Res>
    implements _$FtUserImageCopyWith<$Res> {
  __$FtUserImageCopyWithImpl(this._self, this._then);

  final _FtUserImage _self;
  final $Res Function(_FtUserImage) _then;

/// Create a copy of FtUserImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? link = freezed,Object? versions = freezed,}) {
  return _then(_FtUserImage(
link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,versions: freezed == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as FtImageVersions?,
  ));
}

/// Create a copy of FtUserImage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FtImageVersionsCopyWith<$Res>? get versions {
    if (_self.versions == null) {
    return null;
  }

  return $FtImageVersionsCopyWith<$Res>(_self.versions!, (value) {
    return _then(_self.copyWith(versions: value));
  });
}
}


/// @nodoc
mixin _$FtImageVersions {

 String? get large; String? get medium; String? get small; String? get micro;
/// Create a copy of FtImageVersions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtImageVersionsCopyWith<FtImageVersions> get copyWith => _$FtImageVersionsCopyWithImpl<FtImageVersions>(this as FtImageVersions, _$identity);

  /// Serializes this FtImageVersions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtImageVersions&&(identical(other.large, large) || other.large == large)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.small, small) || other.small == small)&&(identical(other.micro, micro) || other.micro == micro));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,large,medium,small,micro);

@override
String toString() {
  return 'FtImageVersions(large: $large, medium: $medium, small: $small, micro: $micro)';
}


}

/// @nodoc
abstract mixin class $FtImageVersionsCopyWith<$Res>  {
  factory $FtImageVersionsCopyWith(FtImageVersions value, $Res Function(FtImageVersions) _then) = _$FtImageVersionsCopyWithImpl;
@useResult
$Res call({
 String? large, String? medium, String? small, String? micro
});




}
/// @nodoc
class _$FtImageVersionsCopyWithImpl<$Res>
    implements $FtImageVersionsCopyWith<$Res> {
  _$FtImageVersionsCopyWithImpl(this._self, this._then);

  final FtImageVersions _self;
  final $Res Function(FtImageVersions) _then;

/// Create a copy of FtImageVersions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? large = freezed,Object? medium = freezed,Object? small = freezed,Object? micro = freezed,}) {
  return _then(_self.copyWith(
large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,small: freezed == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String?,micro: freezed == micro ? _self.micro : micro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FtImageVersions].
extension FtImageVersionsPatterns on FtImageVersions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtImageVersions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtImageVersions() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtImageVersions value)  $default,){
final _that = this;
switch (_that) {
case _FtImageVersions():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtImageVersions value)?  $default,){
final _that = this;
switch (_that) {
case _FtImageVersions() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? large,  String? medium,  String? small,  String? micro)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtImageVersions() when $default != null:
return $default(_that.large,_that.medium,_that.small,_that.micro);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? large,  String? medium,  String? small,  String? micro)  $default,) {final _that = this;
switch (_that) {
case _FtImageVersions():
return $default(_that.large,_that.medium,_that.small,_that.micro);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? large,  String? medium,  String? small,  String? micro)?  $default,) {final _that = this;
switch (_that) {
case _FtImageVersions() when $default != null:
return $default(_that.large,_that.medium,_that.small,_that.micro);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FtImageVersions implements FtImageVersions {
  const _FtImageVersions({this.large, this.medium, this.small, this.micro});
  factory _FtImageVersions.fromJson(Map<String, dynamic> json) => _$FtImageVersionsFromJson(json);

@override final  String? large;
@override final  String? medium;
@override final  String? small;
@override final  String? micro;

/// Create a copy of FtImageVersions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtImageVersionsCopyWith<_FtImageVersions> get copyWith => __$FtImageVersionsCopyWithImpl<_FtImageVersions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtImageVersionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtImageVersions&&(identical(other.large, large) || other.large == large)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.small, small) || other.small == small)&&(identical(other.micro, micro) || other.micro == micro));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,large,medium,small,micro);

@override
String toString() {
  return 'FtImageVersions(large: $large, medium: $medium, small: $small, micro: $micro)';
}


}

/// @nodoc
abstract mixin class _$FtImageVersionsCopyWith<$Res> implements $FtImageVersionsCopyWith<$Res> {
  factory _$FtImageVersionsCopyWith(_FtImageVersions value, $Res Function(_FtImageVersions) _then) = __$FtImageVersionsCopyWithImpl;
@override @useResult
$Res call({
 String? large, String? medium, String? small, String? micro
});




}
/// @nodoc
class __$FtImageVersionsCopyWithImpl<$Res>
    implements _$FtImageVersionsCopyWith<$Res> {
  __$FtImageVersionsCopyWithImpl(this._self, this._then);

  final _FtImageVersions _self;
  final $Res Function(_FtImageVersions) _then;

/// Create a copy of FtImageVersions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? large = freezed,Object? medium = freezed,Object? small = freezed,Object? micro = freezed,}) {
  return _then(_FtImageVersions(
large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,small: freezed == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String?,micro: freezed == micro ? _self.micro : micro // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CursusUser {

 int get id;@JsonKey(name: 'begin_at') String? get beginAt;@JsonKey(name: 'end_at') String? get endAt;@JsonKey(name: 'blackholed_at') String? get blackholedAt; String? get grade; double get level;@JsonKey(name: 'cursus_id') int get cursusId;@JsonKey(name: 'cursus') CursusInfo? get cursus;
/// Create a copy of CursusUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursusUserCopyWith<CursusUser> get copyWith => _$CursusUserCopyWithImpl<CursusUser>(this as CursusUser, _$identity);

  /// Serializes this CursusUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CursusUser&&(identical(other.id, id) || other.id == id)&&(identical(other.beginAt, beginAt) || other.beginAt == beginAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.blackholedAt, blackholedAt) || other.blackholedAt == blackholedAt)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.level, level) || other.level == level)&&(identical(other.cursusId, cursusId) || other.cursusId == cursusId)&&(identical(other.cursus, cursus) || other.cursus == cursus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,beginAt,endAt,blackholedAt,grade,level,cursusId,cursus);

@override
String toString() {
  return 'CursusUser(id: $id, beginAt: $beginAt, endAt: $endAt, blackholedAt: $blackholedAt, grade: $grade, level: $level, cursusId: $cursusId, cursus: $cursus)';
}


}

/// @nodoc
abstract mixin class $CursusUserCopyWith<$Res>  {
  factory $CursusUserCopyWith(CursusUser value, $Res Function(CursusUser) _then) = _$CursusUserCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'begin_at') String? beginAt,@JsonKey(name: 'end_at') String? endAt,@JsonKey(name: 'blackholed_at') String? blackholedAt, String? grade, double level,@JsonKey(name: 'cursus_id') int cursusId,@JsonKey(name: 'cursus') CursusInfo? cursus
});


$CursusInfoCopyWith<$Res>? get cursus;

}
/// @nodoc
class _$CursusUserCopyWithImpl<$Res>
    implements $CursusUserCopyWith<$Res> {
  _$CursusUserCopyWithImpl(this._self, this._then);

  final CursusUser _self;
  final $Res Function(CursusUser) _then;

/// Create a copy of CursusUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? beginAt = freezed,Object? endAt = freezed,Object? blackholedAt = freezed,Object? grade = freezed,Object? level = null,Object? cursusId = null,Object? cursus = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,beginAt: freezed == beginAt ? _self.beginAt : beginAt // ignore: cast_nullable_to_non_nullable
as String?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,blackholedAt: freezed == blackholedAt ? _self.blackholedAt : blackholedAt // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as double,cursusId: null == cursusId ? _self.cursusId : cursusId // ignore: cast_nullable_to_non_nullable
as int,cursus: freezed == cursus ? _self.cursus : cursus // ignore: cast_nullable_to_non_nullable
as CursusInfo?,
  ));
}
/// Create a copy of CursusUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CursusInfoCopyWith<$Res>? get cursus {
    if (_self.cursus == null) {
    return null;
  }

  return $CursusInfoCopyWith<$Res>(_self.cursus!, (value) {
    return _then(_self.copyWith(cursus: value));
  });
}
}


/// Adds pattern-matching-related methods to [CursusUser].
extension CursusUserPatterns on CursusUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CursusUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CursusUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CursusUser value)  $default,){
final _that = this;
switch (_that) {
case _CursusUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CursusUser value)?  $default,){
final _that = this;
switch (_that) {
case _CursusUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'begin_at')  String? beginAt, @JsonKey(name: 'end_at')  String? endAt, @JsonKey(name: 'blackholed_at')  String? blackholedAt,  String? grade,  double level, @JsonKey(name: 'cursus_id')  int cursusId, @JsonKey(name: 'cursus')  CursusInfo? cursus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CursusUser() when $default != null:
return $default(_that.id,_that.beginAt,_that.endAt,_that.blackholedAt,_that.grade,_that.level,_that.cursusId,_that.cursus);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'begin_at')  String? beginAt, @JsonKey(name: 'end_at')  String? endAt, @JsonKey(name: 'blackholed_at')  String? blackholedAt,  String? grade,  double level, @JsonKey(name: 'cursus_id')  int cursusId, @JsonKey(name: 'cursus')  CursusInfo? cursus)  $default,) {final _that = this;
switch (_that) {
case _CursusUser():
return $default(_that.id,_that.beginAt,_that.endAt,_that.blackholedAt,_that.grade,_that.level,_that.cursusId,_that.cursus);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'begin_at')  String? beginAt, @JsonKey(name: 'end_at')  String? endAt, @JsonKey(name: 'blackholed_at')  String? blackholedAt,  String? grade,  double level, @JsonKey(name: 'cursus_id')  int cursusId, @JsonKey(name: 'cursus')  CursusInfo? cursus)?  $default,) {final _that = this;
switch (_that) {
case _CursusUser() when $default != null:
return $default(_that.id,_that.beginAt,_that.endAt,_that.blackholedAt,_that.grade,_that.level,_that.cursusId,_that.cursus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CursusUser implements CursusUser {
  const _CursusUser({required this.id, @JsonKey(name: 'begin_at') this.beginAt, @JsonKey(name: 'end_at') this.endAt, @JsonKey(name: 'blackholed_at') this.blackholedAt, this.grade, this.level = 0.0, @JsonKey(name: 'cursus_id') required this.cursusId, @JsonKey(name: 'cursus') this.cursus});
  factory _CursusUser.fromJson(Map<String, dynamic> json) => _$CursusUserFromJson(json);

@override final  int id;
@override@JsonKey(name: 'begin_at') final  String? beginAt;
@override@JsonKey(name: 'end_at') final  String? endAt;
@override@JsonKey(name: 'blackholed_at') final  String? blackholedAt;
@override final  String? grade;
@override@JsonKey() final  double level;
@override@JsonKey(name: 'cursus_id') final  int cursusId;
@override@JsonKey(name: 'cursus') final  CursusInfo? cursus;

/// Create a copy of CursusUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CursusUserCopyWith<_CursusUser> get copyWith => __$CursusUserCopyWithImpl<_CursusUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CursusUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CursusUser&&(identical(other.id, id) || other.id == id)&&(identical(other.beginAt, beginAt) || other.beginAt == beginAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.blackholedAt, blackholedAt) || other.blackholedAt == blackholedAt)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.level, level) || other.level == level)&&(identical(other.cursusId, cursusId) || other.cursusId == cursusId)&&(identical(other.cursus, cursus) || other.cursus == cursus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,beginAt,endAt,blackholedAt,grade,level,cursusId,cursus);

@override
String toString() {
  return 'CursusUser(id: $id, beginAt: $beginAt, endAt: $endAt, blackholedAt: $blackholedAt, grade: $grade, level: $level, cursusId: $cursusId, cursus: $cursus)';
}


}

/// @nodoc
abstract mixin class _$CursusUserCopyWith<$Res> implements $CursusUserCopyWith<$Res> {
  factory _$CursusUserCopyWith(_CursusUser value, $Res Function(_CursusUser) _then) = __$CursusUserCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'begin_at') String? beginAt,@JsonKey(name: 'end_at') String? endAt,@JsonKey(name: 'blackholed_at') String? blackholedAt, String? grade, double level,@JsonKey(name: 'cursus_id') int cursusId,@JsonKey(name: 'cursus') CursusInfo? cursus
});


@override $CursusInfoCopyWith<$Res>? get cursus;

}
/// @nodoc
class __$CursusUserCopyWithImpl<$Res>
    implements _$CursusUserCopyWith<$Res> {
  __$CursusUserCopyWithImpl(this._self, this._then);

  final _CursusUser _self;
  final $Res Function(_CursusUser) _then;

/// Create a copy of CursusUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? beginAt = freezed,Object? endAt = freezed,Object? blackholedAt = freezed,Object? grade = freezed,Object? level = null,Object? cursusId = null,Object? cursus = freezed,}) {
  return _then(_CursusUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,beginAt: freezed == beginAt ? _self.beginAt : beginAt // ignore: cast_nullable_to_non_nullable
as String?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,blackholedAt: freezed == blackholedAt ? _self.blackholedAt : blackholedAt // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as double,cursusId: null == cursusId ? _self.cursusId : cursusId // ignore: cast_nullable_to_non_nullable
as int,cursus: freezed == cursus ? _self.cursus : cursus // ignore: cast_nullable_to_non_nullable
as CursusInfo?,
  ));
}

/// Create a copy of CursusUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CursusInfoCopyWith<$Res>? get cursus {
    if (_self.cursus == null) {
    return null;
  }

  return $CursusInfoCopyWith<$Res>(_self.cursus!, (value) {
    return _then(_self.copyWith(cursus: value));
  });
}
}


/// @nodoc
mixin _$CursusInfo {

 int get id; String get name; String get slug;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of CursusInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursusInfoCopyWith<CursusInfo> get copyWith => _$CursusInfoCopyWithImpl<CursusInfo>(this as CursusInfo, _$identity);

  /// Serializes this CursusInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CursusInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,createdAt);

@override
String toString() {
  return 'CursusInfo(id: $id, name: $name, slug: $slug, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CursusInfoCopyWith<$Res>  {
  factory $CursusInfoCopyWith(CursusInfo value, $Res Function(CursusInfo) _then) = _$CursusInfoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$CursusInfoCopyWithImpl<$Res>
    implements $CursusInfoCopyWith<$Res> {
  _$CursusInfoCopyWithImpl(this._self, this._then);

  final CursusInfo _self;
  final $Res Function(CursusInfo) _then;

/// Create a copy of CursusInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CursusInfo].
extension CursusInfoPatterns on CursusInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CursusInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CursusInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CursusInfo value)  $default,){
final _that = this;
switch (_that) {
case _CursusInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CursusInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CursusInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CursusInfo() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CursusInfo():
return $default(_that.id,_that.name,_that.slug,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CursusInfo() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CursusInfo implements CursusInfo {
  const _CursusInfo({required this.id, required this.name, required this.slug, @JsonKey(name: 'created_at') this.createdAt});
  factory _CursusInfo.fromJson(Map<String, dynamic> json) => _$CursusInfoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String slug;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of CursusInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CursusInfoCopyWith<_CursusInfo> get copyWith => __$CursusInfoCopyWithImpl<_CursusInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CursusInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CursusInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,createdAt);

@override
String toString() {
  return 'CursusInfo(id: $id, name: $name, slug: $slug, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CursusInfoCopyWith<$Res> implements $CursusInfoCopyWith<$Res> {
  factory _$CursusInfoCopyWith(_CursusInfo value, $Res Function(_CursusInfo) _then) = __$CursusInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$CursusInfoCopyWithImpl<$Res>
    implements _$CursusInfoCopyWith<$Res> {
  __$CursusInfoCopyWithImpl(this._self, this._then);

  final _CursusInfo _self;
  final $Res Function(_CursusInfo) _then;

/// Create a copy of CursusInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? createdAt = freezed,}) {
  return _then(_CursusInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProjectUser {

 int get id;@JsonKey(name: 'final_mark') int? get finalMark; String get status;@JsonKey(name: 'validated?') bool? get validated;@JsonKey(name: 'marked_at') String? get markedAt;@JsonKey(name: 'project') ProjectInfo get project;@JsonKey(name: 'cursus_ids') List<int> get cursusIds;
/// Create a copy of ProjectUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectUserCopyWith<ProjectUser> get copyWith => _$ProjectUserCopyWithImpl<ProjectUser>(this as ProjectUser, _$identity);

  /// Serializes this ProjectUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectUser&&(identical(other.id, id) || other.id == id)&&(identical(other.finalMark, finalMark) || other.finalMark == finalMark)&&(identical(other.status, status) || other.status == status)&&(identical(other.validated, validated) || other.validated == validated)&&(identical(other.markedAt, markedAt) || other.markedAt == markedAt)&&(identical(other.project, project) || other.project == project)&&const DeepCollectionEquality().equals(other.cursusIds, cursusIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,finalMark,status,validated,markedAt,project,const DeepCollectionEquality().hash(cursusIds));

@override
String toString() {
  return 'ProjectUser(id: $id, finalMark: $finalMark, status: $status, validated: $validated, markedAt: $markedAt, project: $project, cursusIds: $cursusIds)';
}


}

/// @nodoc
abstract mixin class $ProjectUserCopyWith<$Res>  {
  factory $ProjectUserCopyWith(ProjectUser value, $Res Function(ProjectUser) _then) = _$ProjectUserCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'final_mark') int? finalMark, String status,@JsonKey(name: 'validated?') bool? validated,@JsonKey(name: 'marked_at') String? markedAt,@JsonKey(name: 'project') ProjectInfo project,@JsonKey(name: 'cursus_ids') List<int> cursusIds
});


$ProjectInfoCopyWith<$Res> get project;

}
/// @nodoc
class _$ProjectUserCopyWithImpl<$Res>
    implements $ProjectUserCopyWith<$Res> {
  _$ProjectUserCopyWithImpl(this._self, this._then);

  final ProjectUser _self;
  final $Res Function(ProjectUser) _then;

/// Create a copy of ProjectUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? finalMark = freezed,Object? status = null,Object? validated = freezed,Object? markedAt = freezed,Object? project = null,Object? cursusIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,finalMark: freezed == finalMark ? _self.finalMark : finalMark // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,validated: freezed == validated ? _self.validated : validated // ignore: cast_nullable_to_non_nullable
as bool?,markedAt: freezed == markedAt ? _self.markedAt : markedAt // ignore: cast_nullable_to_non_nullable
as String?,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectInfo,cursusIds: null == cursusIds ? _self.cursusIds : cursusIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}
/// Create a copy of ProjectUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectInfoCopyWith<$Res> get project {
  
  return $ProjectInfoCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectUser].
extension ProjectUserPatterns on ProjectUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectUser value)  $default,){
final _that = this;
switch (_that) {
case _ProjectUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectUser value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'final_mark')  int? finalMark,  String status, @JsonKey(name: 'validated?')  bool? validated, @JsonKey(name: 'marked_at')  String? markedAt, @JsonKey(name: 'project')  ProjectInfo project, @JsonKey(name: 'cursus_ids')  List<int> cursusIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectUser() when $default != null:
return $default(_that.id,_that.finalMark,_that.status,_that.validated,_that.markedAt,_that.project,_that.cursusIds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'final_mark')  int? finalMark,  String status, @JsonKey(name: 'validated?')  bool? validated, @JsonKey(name: 'marked_at')  String? markedAt, @JsonKey(name: 'project')  ProjectInfo project, @JsonKey(name: 'cursus_ids')  List<int> cursusIds)  $default,) {final _that = this;
switch (_that) {
case _ProjectUser():
return $default(_that.id,_that.finalMark,_that.status,_that.validated,_that.markedAt,_that.project,_that.cursusIds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'final_mark')  int? finalMark,  String status, @JsonKey(name: 'validated?')  bool? validated, @JsonKey(name: 'marked_at')  String? markedAt, @JsonKey(name: 'project')  ProjectInfo project, @JsonKey(name: 'cursus_ids')  List<int> cursusIds)?  $default,) {final _that = this;
switch (_that) {
case _ProjectUser() when $default != null:
return $default(_that.id,_that.finalMark,_that.status,_that.validated,_that.markedAt,_that.project,_that.cursusIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectUser implements ProjectUser {
  const _ProjectUser({required this.id, @JsonKey(name: 'final_mark') this.finalMark, required this.status, @JsonKey(name: 'validated?') this.validated, @JsonKey(name: 'marked_at') this.markedAt, @JsonKey(name: 'project') required this.project, @JsonKey(name: 'cursus_ids') final  List<int> cursusIds = const []}): _cursusIds = cursusIds;
  factory _ProjectUser.fromJson(Map<String, dynamic> json) => _$ProjectUserFromJson(json);

@override final  int id;
@override@JsonKey(name: 'final_mark') final  int? finalMark;
@override final  String status;
@override@JsonKey(name: 'validated?') final  bool? validated;
@override@JsonKey(name: 'marked_at') final  String? markedAt;
@override@JsonKey(name: 'project') final  ProjectInfo project;
 final  List<int> _cursusIds;
@override@JsonKey(name: 'cursus_ids') List<int> get cursusIds {
  if (_cursusIds is EqualUnmodifiableListView) return _cursusIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cursusIds);
}


/// Create a copy of ProjectUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectUserCopyWith<_ProjectUser> get copyWith => __$ProjectUserCopyWithImpl<_ProjectUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectUser&&(identical(other.id, id) || other.id == id)&&(identical(other.finalMark, finalMark) || other.finalMark == finalMark)&&(identical(other.status, status) || other.status == status)&&(identical(other.validated, validated) || other.validated == validated)&&(identical(other.markedAt, markedAt) || other.markedAt == markedAt)&&(identical(other.project, project) || other.project == project)&&const DeepCollectionEquality().equals(other._cursusIds, _cursusIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,finalMark,status,validated,markedAt,project,const DeepCollectionEquality().hash(_cursusIds));

@override
String toString() {
  return 'ProjectUser(id: $id, finalMark: $finalMark, status: $status, validated: $validated, markedAt: $markedAt, project: $project, cursusIds: $cursusIds)';
}


}

/// @nodoc
abstract mixin class _$ProjectUserCopyWith<$Res> implements $ProjectUserCopyWith<$Res> {
  factory _$ProjectUserCopyWith(_ProjectUser value, $Res Function(_ProjectUser) _then) = __$ProjectUserCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'final_mark') int? finalMark, String status,@JsonKey(name: 'validated?') bool? validated,@JsonKey(name: 'marked_at') String? markedAt,@JsonKey(name: 'project') ProjectInfo project,@JsonKey(name: 'cursus_ids') List<int> cursusIds
});


@override $ProjectInfoCopyWith<$Res> get project;

}
/// @nodoc
class __$ProjectUserCopyWithImpl<$Res>
    implements _$ProjectUserCopyWith<$Res> {
  __$ProjectUserCopyWithImpl(this._self, this._then);

  final _ProjectUser _self;
  final $Res Function(_ProjectUser) _then;

/// Create a copy of ProjectUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? finalMark = freezed,Object? status = null,Object? validated = freezed,Object? markedAt = freezed,Object? project = null,Object? cursusIds = null,}) {
  return _then(_ProjectUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,finalMark: freezed == finalMark ? _self.finalMark : finalMark // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,validated: freezed == validated ? _self.validated : validated // ignore: cast_nullable_to_non_nullable
as bool?,markedAt: freezed == markedAt ? _self.markedAt : markedAt // ignore: cast_nullable_to_non_nullable
as String?,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectInfo,cursusIds: null == cursusIds ? _self._cursusIds : cursusIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

/// Create a copy of ProjectUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectInfoCopyWith<$Res> get project {
  
  return $ProjectInfoCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// @nodoc
mixin _$ProjectInfo {

 int get id; String get name; String get slug;
/// Create a copy of ProjectInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectInfoCopyWith<ProjectInfo> get copyWith => _$ProjectInfoCopyWithImpl<ProjectInfo>(this as ProjectInfo, _$identity);

  /// Serializes this ProjectInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'ProjectInfo(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $ProjectInfoCopyWith<$Res>  {
  factory $ProjectInfoCopyWith(ProjectInfo value, $Res Function(ProjectInfo) _then) = _$ProjectInfoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug
});




}
/// @nodoc
class _$ProjectInfoCopyWithImpl<$Res>
    implements $ProjectInfoCopyWith<$Res> {
  _$ProjectInfoCopyWithImpl(this._self, this._then);

  final ProjectInfo _self;
  final $Res Function(ProjectInfo) _then;

/// Create a copy of ProjectInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectInfo].
extension ProjectInfoPatterns on ProjectInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectInfo value)  $default,){
final _that = this;
switch (_that) {
case _ProjectInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectInfo() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug)  $default,) {final _that = this;
switch (_that) {
case _ProjectInfo():
return $default(_that.id,_that.name,_that.slug);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug)?  $default,) {final _that = this;
switch (_that) {
case _ProjectInfo() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectInfo implements ProjectInfo {
  const _ProjectInfo({required this.id, required this.name, required this.slug});
  factory _ProjectInfo.fromJson(Map<String, dynamic> json) => _$ProjectInfoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String slug;

/// Create a copy of ProjectInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectInfoCopyWith<_ProjectInfo> get copyWith => __$ProjectInfoCopyWithImpl<_ProjectInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'ProjectInfo(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$ProjectInfoCopyWith<$Res> implements $ProjectInfoCopyWith<$Res> {
  factory _$ProjectInfoCopyWith(_ProjectInfo value, $Res Function(_ProjectInfo) _then) = __$ProjectInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug
});




}
/// @nodoc
class __$ProjectInfoCopyWithImpl<$Res>
    implements _$ProjectInfoCopyWith<$Res> {
  __$ProjectInfoCopyWithImpl(this._self, this._then);

  final _ProjectInfo _self;
  final $Res Function(_ProjectInfo) _then;

/// Create a copy of ProjectInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,}) {
  return _then(_ProjectInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
