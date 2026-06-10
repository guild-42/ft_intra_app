// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FtSlot {

 int get id;@JsonKey(name: 'begin_at') String get beginAt;@JsonKey(name: 'end_at') String get endAt;@JsonKey(name: 'scale_team') dynamic get scaleTeam;@JsonKey(name: 'user') dynamic get user;
/// Create a copy of FtSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtSlotCopyWith<FtSlot> get copyWith => _$FtSlotCopyWithImpl<FtSlot>(this as FtSlot, _$identity);

  /// Serializes this FtSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.beginAt, beginAt) || other.beginAt == beginAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&const DeepCollectionEquality().equals(other.scaleTeam, scaleTeam)&&const DeepCollectionEquality().equals(other.user, user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,beginAt,endAt,const DeepCollectionEquality().hash(scaleTeam),const DeepCollectionEquality().hash(user));

@override
String toString() {
  return 'FtSlot(id: $id, beginAt: $beginAt, endAt: $endAt, scaleTeam: $scaleTeam, user: $user)';
}


}

/// @nodoc
abstract mixin class $FtSlotCopyWith<$Res>  {
  factory $FtSlotCopyWith(FtSlot value, $Res Function(FtSlot) _then) = _$FtSlotCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'begin_at') String beginAt,@JsonKey(name: 'end_at') String endAt,@JsonKey(name: 'scale_team') dynamic scaleTeam,@JsonKey(name: 'user') dynamic user
});




}
/// @nodoc
class _$FtSlotCopyWithImpl<$Res>
    implements $FtSlotCopyWith<$Res> {
  _$FtSlotCopyWithImpl(this._self, this._then);

  final FtSlot _self;
  final $Res Function(FtSlot) _then;

/// Create a copy of FtSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? beginAt = null,Object? endAt = null,Object? scaleTeam = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,beginAt: null == beginAt ? _self.beginAt : beginAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,scaleTeam: freezed == scaleTeam ? _self.scaleTeam : scaleTeam // ignore: cast_nullable_to_non_nullable
as dynamic,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [FtSlot].
extension FtSlotPatterns on FtSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtSlot value)  $default,){
final _that = this;
switch (_that) {
case _FtSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtSlot value)?  $default,){
final _that = this;
switch (_that) {
case _FtSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'begin_at')  String beginAt, @JsonKey(name: 'end_at')  String endAt, @JsonKey(name: 'scale_team')  dynamic scaleTeam, @JsonKey(name: 'user')  dynamic user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtSlot() when $default != null:
return $default(_that.id,_that.beginAt,_that.endAt,_that.scaleTeam,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'begin_at')  String beginAt, @JsonKey(name: 'end_at')  String endAt, @JsonKey(name: 'scale_team')  dynamic scaleTeam, @JsonKey(name: 'user')  dynamic user)  $default,) {final _that = this;
switch (_that) {
case _FtSlot():
return $default(_that.id,_that.beginAt,_that.endAt,_that.scaleTeam,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'begin_at')  String beginAt, @JsonKey(name: 'end_at')  String endAt, @JsonKey(name: 'scale_team')  dynamic scaleTeam, @JsonKey(name: 'user')  dynamic user)?  $default,) {final _that = this;
switch (_that) {
case _FtSlot() when $default != null:
return $default(_that.id,_that.beginAt,_that.endAt,_that.scaleTeam,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FtSlot implements FtSlot {
  const _FtSlot({required this.id, @JsonKey(name: 'begin_at') required this.beginAt, @JsonKey(name: 'end_at') required this.endAt, @JsonKey(name: 'scale_team') this.scaleTeam, @JsonKey(name: 'user') this.user});
  factory _FtSlot.fromJson(Map<String, dynamic> json) => _$FtSlotFromJson(json);

@override final  int id;
@override@JsonKey(name: 'begin_at') final  String beginAt;
@override@JsonKey(name: 'end_at') final  String endAt;
@override@JsonKey(name: 'scale_team') final  dynamic scaleTeam;
@override@JsonKey(name: 'user') final  dynamic user;

/// Create a copy of FtSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtSlotCopyWith<_FtSlot> get copyWith => __$FtSlotCopyWithImpl<_FtSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtSlot&&(identical(other.id, id) || other.id == id)&&(identical(other.beginAt, beginAt) || other.beginAt == beginAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&const DeepCollectionEquality().equals(other.scaleTeam, scaleTeam)&&const DeepCollectionEquality().equals(other.user, user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,beginAt,endAt,const DeepCollectionEquality().hash(scaleTeam),const DeepCollectionEquality().hash(user));

@override
String toString() {
  return 'FtSlot(id: $id, beginAt: $beginAt, endAt: $endAt, scaleTeam: $scaleTeam, user: $user)';
}


}

/// @nodoc
abstract mixin class _$FtSlotCopyWith<$Res> implements $FtSlotCopyWith<$Res> {
  factory _$FtSlotCopyWith(_FtSlot value, $Res Function(_FtSlot) _then) = __$FtSlotCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'begin_at') String beginAt,@JsonKey(name: 'end_at') String endAt,@JsonKey(name: 'scale_team') dynamic scaleTeam,@JsonKey(name: 'user') dynamic user
});




}
/// @nodoc
class __$FtSlotCopyWithImpl<$Res>
    implements _$FtSlotCopyWith<$Res> {
  __$FtSlotCopyWithImpl(this._self, this._then);

  final _FtSlot _self;
  final $Res Function(_FtSlot) _then;

/// Create a copy of FtSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? beginAt = null,Object? endAt = null,Object? scaleTeam = freezed,Object? user = freezed,}) {
  return _then(_FtSlot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,beginAt: null == beginAt ? _self.beginAt : beginAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,scaleTeam: freezed == scaleTeam ? _self.scaleTeam : scaleTeam // ignore: cast_nullable_to_non_nullable
as dynamic,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
