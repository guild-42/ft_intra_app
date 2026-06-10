// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FtCampus {

 int get id; String get name;@JsonKey(name: 'time_zone') String? get timeZone;@JsonKey(name: 'users_count') int get usersCount; String? get city; String? get country;@JsonKey(name: 'vogsphere_id') int? get vogsphereId;
/// Create a copy of FtCampus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtCampusCopyWith<FtCampus> get copyWith => _$FtCampusCopyWithImpl<FtCampus>(this as FtCampus, _$identity);

  /// Serializes this FtCampus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtCampus&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone)&&(identical(other.usersCount, usersCount) || other.usersCount == usersCount)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.vogsphereId, vogsphereId) || other.vogsphereId == vogsphereId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,timeZone,usersCount,city,country,vogsphereId);

@override
String toString() {
  return 'FtCampus(id: $id, name: $name, timeZone: $timeZone, usersCount: $usersCount, city: $city, country: $country, vogsphereId: $vogsphereId)';
}


}

/// @nodoc
abstract mixin class $FtCampusCopyWith<$Res>  {
  factory $FtCampusCopyWith(FtCampus value, $Res Function(FtCampus) _then) = _$FtCampusCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'time_zone') String? timeZone,@JsonKey(name: 'users_count') int usersCount, String? city, String? country,@JsonKey(name: 'vogsphere_id') int? vogsphereId
});




}
/// @nodoc
class _$FtCampusCopyWithImpl<$Res>
    implements $FtCampusCopyWith<$Res> {
  _$FtCampusCopyWithImpl(this._self, this._then);

  final FtCampus _self;
  final $Res Function(FtCampus) _then;

/// Create a copy of FtCampus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? timeZone = freezed,Object? usersCount = null,Object? city = freezed,Object? country = freezed,Object? vogsphereId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timeZone: freezed == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String?,usersCount: null == usersCount ? _self.usersCount : usersCount // ignore: cast_nullable_to_non_nullable
as int,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,vogsphereId: freezed == vogsphereId ? _self.vogsphereId : vogsphereId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FtCampus].
extension FtCampusPatterns on FtCampus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtCampus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtCampus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtCampus value)  $default,){
final _that = this;
switch (_that) {
case _FtCampus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtCampus value)?  $default,){
final _that = this;
switch (_that) {
case _FtCampus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'time_zone')  String? timeZone, @JsonKey(name: 'users_count')  int usersCount,  String? city,  String? country, @JsonKey(name: 'vogsphere_id')  int? vogsphereId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtCampus() when $default != null:
return $default(_that.id,_that.name,_that.timeZone,_that.usersCount,_that.city,_that.country,_that.vogsphereId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'time_zone')  String? timeZone, @JsonKey(name: 'users_count')  int usersCount,  String? city,  String? country, @JsonKey(name: 'vogsphere_id')  int? vogsphereId)  $default,) {final _that = this;
switch (_that) {
case _FtCampus():
return $default(_that.id,_that.name,_that.timeZone,_that.usersCount,_that.city,_that.country,_that.vogsphereId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'time_zone')  String? timeZone, @JsonKey(name: 'users_count')  int usersCount,  String? city,  String? country, @JsonKey(name: 'vogsphere_id')  int? vogsphereId)?  $default,) {final _that = this;
switch (_that) {
case _FtCampus() when $default != null:
return $default(_that.id,_that.name,_that.timeZone,_that.usersCount,_that.city,_that.country,_that.vogsphereId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FtCampus implements FtCampus {
  const _FtCampus({required this.id, required this.name, @JsonKey(name: 'time_zone') this.timeZone, @JsonKey(name: 'users_count') this.usersCount = 0, this.city, this.country, @JsonKey(name: 'vogsphere_id') this.vogsphereId});
  factory _FtCampus.fromJson(Map<String, dynamic> json) => _$FtCampusFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'time_zone') final  String? timeZone;
@override@JsonKey(name: 'users_count') final  int usersCount;
@override final  String? city;
@override final  String? country;
@override@JsonKey(name: 'vogsphere_id') final  int? vogsphereId;

/// Create a copy of FtCampus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtCampusCopyWith<_FtCampus> get copyWith => __$FtCampusCopyWithImpl<_FtCampus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtCampusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtCampus&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone)&&(identical(other.usersCount, usersCount) || other.usersCount == usersCount)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.vogsphereId, vogsphereId) || other.vogsphereId == vogsphereId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,timeZone,usersCount,city,country,vogsphereId);

@override
String toString() {
  return 'FtCampus(id: $id, name: $name, timeZone: $timeZone, usersCount: $usersCount, city: $city, country: $country, vogsphereId: $vogsphereId)';
}


}

/// @nodoc
abstract mixin class _$FtCampusCopyWith<$Res> implements $FtCampusCopyWith<$Res> {
  factory _$FtCampusCopyWith(_FtCampus value, $Res Function(_FtCampus) _then) = __$FtCampusCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'time_zone') String? timeZone,@JsonKey(name: 'users_count') int usersCount, String? city, String? country,@JsonKey(name: 'vogsphere_id') int? vogsphereId
});




}
/// @nodoc
class __$FtCampusCopyWithImpl<$Res>
    implements _$FtCampusCopyWith<$Res> {
  __$FtCampusCopyWithImpl(this._self, this._then);

  final _FtCampus _self;
  final $Res Function(_FtCampus) _then;

/// Create a copy of FtCampus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? timeZone = freezed,Object? usersCount = null,Object? city = freezed,Object? country = freezed,Object? vogsphereId = freezed,}) {
  return _then(_FtCampus(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timeZone: freezed == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String?,usersCount: null == usersCount ? _self.usersCount : usersCount // ignore: cast_nullable_to_non_nullable
as int,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,vogsphereId: freezed == vogsphereId ? _self.vogsphereId : vogsphereId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
