// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FtLocation {

 int get id;@JsonKey(name: 'begin_at') String get beginAt;@JsonKey(name: 'end_at') String? get endAt; bool get primary; String? get floor; String? get row; String? get post; String get host;@JsonKey(name: 'campus_id') int get campusId;@JsonKey(name: 'user') LocationUser get user;
/// Create a copy of FtLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtLocationCopyWith<FtLocation> get copyWith => _$FtLocationCopyWithImpl<FtLocation>(this as FtLocation, _$identity);

  /// Serializes this FtLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.beginAt, beginAt) || other.beginAt == beginAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.row, row) || other.row == row)&&(identical(other.post, post) || other.post == post)&&(identical(other.host, host) || other.host == host)&&(identical(other.campusId, campusId) || other.campusId == campusId)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,beginAt,endAt,primary,floor,row,post,host,campusId,user);

@override
String toString() {
  return 'FtLocation(id: $id, beginAt: $beginAt, endAt: $endAt, primary: $primary, floor: $floor, row: $row, post: $post, host: $host, campusId: $campusId, user: $user)';
}


}

/// @nodoc
abstract mixin class $FtLocationCopyWith<$Res>  {
  factory $FtLocationCopyWith(FtLocation value, $Res Function(FtLocation) _then) = _$FtLocationCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'begin_at') String beginAt,@JsonKey(name: 'end_at') String? endAt, bool primary, String? floor, String? row, String? post, String host,@JsonKey(name: 'campus_id') int campusId,@JsonKey(name: 'user') LocationUser user
});


$LocationUserCopyWith<$Res> get user;

}
/// @nodoc
class _$FtLocationCopyWithImpl<$Res>
    implements $FtLocationCopyWith<$Res> {
  _$FtLocationCopyWithImpl(this._self, this._then);

  final FtLocation _self;
  final $Res Function(FtLocation) _then;

/// Create a copy of FtLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? beginAt = null,Object? endAt = freezed,Object? primary = null,Object? floor = freezed,Object? row = freezed,Object? post = freezed,Object? host = null,Object? campusId = null,Object? user = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,beginAt: null == beginAt ? _self.beginAt : beginAt // ignore: cast_nullable_to_non_nullable
as String,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as bool,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,row: freezed == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as String?,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as String?,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,campusId: null == campusId ? _self.campusId : campusId // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as LocationUser,
  ));
}
/// Create a copy of FtLocation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationUserCopyWith<$Res> get user {
  
  return $LocationUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [FtLocation].
extension FtLocationPatterns on FtLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtLocation value)  $default,){
final _that = this;
switch (_that) {
case _FtLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtLocation value)?  $default,){
final _that = this;
switch (_that) {
case _FtLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'begin_at')  String beginAt, @JsonKey(name: 'end_at')  String? endAt,  bool primary,  String? floor,  String? row,  String? post,  String host, @JsonKey(name: 'campus_id')  int campusId, @JsonKey(name: 'user')  LocationUser user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtLocation() when $default != null:
return $default(_that.id,_that.beginAt,_that.endAt,_that.primary,_that.floor,_that.row,_that.post,_that.host,_that.campusId,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'begin_at')  String beginAt, @JsonKey(name: 'end_at')  String? endAt,  bool primary,  String? floor,  String? row,  String? post,  String host, @JsonKey(name: 'campus_id')  int campusId, @JsonKey(name: 'user')  LocationUser user)  $default,) {final _that = this;
switch (_that) {
case _FtLocation():
return $default(_that.id,_that.beginAt,_that.endAt,_that.primary,_that.floor,_that.row,_that.post,_that.host,_that.campusId,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'begin_at')  String beginAt, @JsonKey(name: 'end_at')  String? endAt,  bool primary,  String? floor,  String? row,  String? post,  String host, @JsonKey(name: 'campus_id')  int campusId, @JsonKey(name: 'user')  LocationUser user)?  $default,) {final _that = this;
switch (_that) {
case _FtLocation() when $default != null:
return $default(_that.id,_that.beginAt,_that.endAt,_that.primary,_that.floor,_that.row,_that.post,_that.host,_that.campusId,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FtLocation implements FtLocation {
  const _FtLocation({required this.id, @JsonKey(name: 'begin_at') required this.beginAt, @JsonKey(name: 'end_at') this.endAt, required this.primary, this.floor, this.row, this.post, required this.host, @JsonKey(name: 'campus_id') required this.campusId, @JsonKey(name: 'user') required this.user});
  factory _FtLocation.fromJson(Map<String, dynamic> json) => _$FtLocationFromJson(json);

@override final  int id;
@override@JsonKey(name: 'begin_at') final  String beginAt;
@override@JsonKey(name: 'end_at') final  String? endAt;
@override final  bool primary;
@override final  String? floor;
@override final  String? row;
@override final  String? post;
@override final  String host;
@override@JsonKey(name: 'campus_id') final  int campusId;
@override@JsonKey(name: 'user') final  LocationUser user;

/// Create a copy of FtLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtLocationCopyWith<_FtLocation> get copyWith => __$FtLocationCopyWithImpl<_FtLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.beginAt, beginAt) || other.beginAt == beginAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.row, row) || other.row == row)&&(identical(other.post, post) || other.post == post)&&(identical(other.host, host) || other.host == host)&&(identical(other.campusId, campusId) || other.campusId == campusId)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,beginAt,endAt,primary,floor,row,post,host,campusId,user);

@override
String toString() {
  return 'FtLocation(id: $id, beginAt: $beginAt, endAt: $endAt, primary: $primary, floor: $floor, row: $row, post: $post, host: $host, campusId: $campusId, user: $user)';
}


}

/// @nodoc
abstract mixin class _$FtLocationCopyWith<$Res> implements $FtLocationCopyWith<$Res> {
  factory _$FtLocationCopyWith(_FtLocation value, $Res Function(_FtLocation) _then) = __$FtLocationCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'begin_at') String beginAt,@JsonKey(name: 'end_at') String? endAt, bool primary, String? floor, String? row, String? post, String host,@JsonKey(name: 'campus_id') int campusId,@JsonKey(name: 'user') LocationUser user
});


@override $LocationUserCopyWith<$Res> get user;

}
/// @nodoc
class __$FtLocationCopyWithImpl<$Res>
    implements _$FtLocationCopyWith<$Res> {
  __$FtLocationCopyWithImpl(this._self, this._then);

  final _FtLocation _self;
  final $Res Function(_FtLocation) _then;

/// Create a copy of FtLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? beginAt = null,Object? endAt = freezed,Object? primary = null,Object? floor = freezed,Object? row = freezed,Object? post = freezed,Object? host = null,Object? campusId = null,Object? user = null,}) {
  return _then(_FtLocation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,beginAt: null == beginAt ? _self.beginAt : beginAt // ignore: cast_nullable_to_non_nullable
as String,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as bool,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as String?,row: freezed == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as String?,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as String?,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,campusId: null == campusId ? _self.campusId : campusId // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as LocationUser,
  ));
}

/// Create a copy of FtLocation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationUserCopyWith<$Res> get user {
  
  return $LocationUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$LocationUser {

 int get id; String get login; String get url;
/// Create a copy of LocationUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationUserCopyWith<LocationUser> get copyWith => _$LocationUserCopyWithImpl<LocationUser>(this as LocationUser, _$identity);

  /// Serializes this LocationUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationUser&&(identical(other.id, id) || other.id == id)&&(identical(other.login, login) || other.login == login)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,login,url);

@override
String toString() {
  return 'LocationUser(id: $id, login: $login, url: $url)';
}


}

/// @nodoc
abstract mixin class $LocationUserCopyWith<$Res>  {
  factory $LocationUserCopyWith(LocationUser value, $Res Function(LocationUser) _then) = _$LocationUserCopyWithImpl;
@useResult
$Res call({
 int id, String login, String url
});




}
/// @nodoc
class _$LocationUserCopyWithImpl<$Res>
    implements $LocationUserCopyWith<$Res> {
  _$LocationUserCopyWithImpl(this._self, this._then);

  final LocationUser _self;
  final $Res Function(LocationUser) _then;

/// Create a copy of LocationUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? login = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationUser].
extension LocationUserPatterns on LocationUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationUser value)  $default,){
final _that = this;
switch (_that) {
case _LocationUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationUser value)?  $default,){
final _that = this;
switch (_that) {
case _LocationUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String login,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationUser() when $default != null:
return $default(_that.id,_that.login,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String login,  String url)  $default,) {final _that = this;
switch (_that) {
case _LocationUser():
return $default(_that.id,_that.login,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String login,  String url)?  $default,) {final _that = this;
switch (_that) {
case _LocationUser() when $default != null:
return $default(_that.id,_that.login,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationUser implements LocationUser {
  const _LocationUser({required this.id, required this.login, required this.url});
  factory _LocationUser.fromJson(Map<String, dynamic> json) => _$LocationUserFromJson(json);

@override final  int id;
@override final  String login;
@override final  String url;

/// Create a copy of LocationUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationUserCopyWith<_LocationUser> get copyWith => __$LocationUserCopyWithImpl<_LocationUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationUser&&(identical(other.id, id) || other.id == id)&&(identical(other.login, login) || other.login == login)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,login,url);

@override
String toString() {
  return 'LocationUser(id: $id, login: $login, url: $url)';
}


}

/// @nodoc
abstract mixin class _$LocationUserCopyWith<$Res> implements $LocationUserCopyWith<$Res> {
  factory _$LocationUserCopyWith(_LocationUser value, $Res Function(_LocationUser) _then) = __$LocationUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String login, String url
});




}
/// @nodoc
class __$LocationUserCopyWithImpl<$Res>
    implements _$LocationUserCopyWith<$Res> {
  __$LocationUserCopyWithImpl(this._self, this._then);

  final _LocationUser _self;
  final $Res Function(_LocationUser) _then;

/// Create a copy of LocationUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? login = null,Object? url = null,}) {
  return _then(_LocationUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
