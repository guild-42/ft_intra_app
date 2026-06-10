// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scale_team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScaleTeam {

 int get id;@JsonKey(name: 'scale_id') int get scaleId;@JsonKey(name: 'begin_at') String get beginAt;@JsonKey(name: 'filled_at') String? get filledAt;@JsonKey(name: 'final_mark') int? get finalMark; String? get comment; String? get feedback;@JsonKey(name: 'corrector') dynamic get corrector;@JsonKey(name: 'correcteds') List<dynamic> get correcteds;@JsonKey(name: 'team') ScaleTeamTeam? get team;
/// Create a copy of ScaleTeam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScaleTeamCopyWith<ScaleTeam> get copyWith => _$ScaleTeamCopyWithImpl<ScaleTeam>(this as ScaleTeam, _$identity);

  /// Serializes this ScaleTeam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScaleTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.scaleId, scaleId) || other.scaleId == scaleId)&&(identical(other.beginAt, beginAt) || other.beginAt == beginAt)&&(identical(other.filledAt, filledAt) || other.filledAt == filledAt)&&(identical(other.finalMark, finalMark) || other.finalMark == finalMark)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&const DeepCollectionEquality().equals(other.corrector, corrector)&&const DeepCollectionEquality().equals(other.correcteds, correcteds)&&(identical(other.team, team) || other.team == team));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scaleId,beginAt,filledAt,finalMark,comment,feedback,const DeepCollectionEquality().hash(corrector),const DeepCollectionEquality().hash(correcteds),team);

@override
String toString() {
  return 'ScaleTeam(id: $id, scaleId: $scaleId, beginAt: $beginAt, filledAt: $filledAt, finalMark: $finalMark, comment: $comment, feedback: $feedback, corrector: $corrector, correcteds: $correcteds, team: $team)';
}


}

/// @nodoc
abstract mixin class $ScaleTeamCopyWith<$Res>  {
  factory $ScaleTeamCopyWith(ScaleTeam value, $Res Function(ScaleTeam) _then) = _$ScaleTeamCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'scale_id') int scaleId,@JsonKey(name: 'begin_at') String beginAt,@JsonKey(name: 'filled_at') String? filledAt,@JsonKey(name: 'final_mark') int? finalMark, String? comment, String? feedback,@JsonKey(name: 'corrector') dynamic corrector,@JsonKey(name: 'correcteds') List<dynamic> correcteds,@JsonKey(name: 'team') ScaleTeamTeam? team
});


$ScaleTeamTeamCopyWith<$Res>? get team;

}
/// @nodoc
class _$ScaleTeamCopyWithImpl<$Res>
    implements $ScaleTeamCopyWith<$Res> {
  _$ScaleTeamCopyWithImpl(this._self, this._then);

  final ScaleTeam _self;
  final $Res Function(ScaleTeam) _then;

/// Create a copy of ScaleTeam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? scaleId = null,Object? beginAt = null,Object? filledAt = freezed,Object? finalMark = freezed,Object? comment = freezed,Object? feedback = freezed,Object? corrector = freezed,Object? correcteds = null,Object? team = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,scaleId: null == scaleId ? _self.scaleId : scaleId // ignore: cast_nullable_to_non_nullable
as int,beginAt: null == beginAt ? _self.beginAt : beginAt // ignore: cast_nullable_to_non_nullable
as String,filledAt: freezed == filledAt ? _self.filledAt : filledAt // ignore: cast_nullable_to_non_nullable
as String?,finalMark: freezed == finalMark ? _self.finalMark : finalMark // ignore: cast_nullable_to_non_nullable
as int?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,corrector: freezed == corrector ? _self.corrector : corrector // ignore: cast_nullable_to_non_nullable
as dynamic,correcteds: null == correcteds ? _self.correcteds : correcteds // ignore: cast_nullable_to_non_nullable
as List<dynamic>,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as ScaleTeamTeam?,
  ));
}
/// Create a copy of ScaleTeam
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScaleTeamTeamCopyWith<$Res>? get team {
    if (_self.team == null) {
    return null;
  }

  return $ScaleTeamTeamCopyWith<$Res>(_self.team!, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// Adds pattern-matching-related methods to [ScaleTeam].
extension ScaleTeamPatterns on ScaleTeam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScaleTeam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScaleTeam() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScaleTeam value)  $default,){
final _that = this;
switch (_that) {
case _ScaleTeam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScaleTeam value)?  $default,){
final _that = this;
switch (_that) {
case _ScaleTeam() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'scale_id')  int scaleId, @JsonKey(name: 'begin_at')  String beginAt, @JsonKey(name: 'filled_at')  String? filledAt, @JsonKey(name: 'final_mark')  int? finalMark,  String? comment,  String? feedback, @JsonKey(name: 'corrector')  dynamic corrector, @JsonKey(name: 'correcteds')  List<dynamic> correcteds, @JsonKey(name: 'team')  ScaleTeamTeam? team)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScaleTeam() when $default != null:
return $default(_that.id,_that.scaleId,_that.beginAt,_that.filledAt,_that.finalMark,_that.comment,_that.feedback,_that.corrector,_that.correcteds,_that.team);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'scale_id')  int scaleId, @JsonKey(name: 'begin_at')  String beginAt, @JsonKey(name: 'filled_at')  String? filledAt, @JsonKey(name: 'final_mark')  int? finalMark,  String? comment,  String? feedback, @JsonKey(name: 'corrector')  dynamic corrector, @JsonKey(name: 'correcteds')  List<dynamic> correcteds, @JsonKey(name: 'team')  ScaleTeamTeam? team)  $default,) {final _that = this;
switch (_that) {
case _ScaleTeam():
return $default(_that.id,_that.scaleId,_that.beginAt,_that.filledAt,_that.finalMark,_that.comment,_that.feedback,_that.corrector,_that.correcteds,_that.team);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'scale_id')  int scaleId, @JsonKey(name: 'begin_at')  String beginAt, @JsonKey(name: 'filled_at')  String? filledAt, @JsonKey(name: 'final_mark')  int? finalMark,  String? comment,  String? feedback, @JsonKey(name: 'corrector')  dynamic corrector, @JsonKey(name: 'correcteds')  List<dynamic> correcteds, @JsonKey(name: 'team')  ScaleTeamTeam? team)?  $default,) {final _that = this;
switch (_that) {
case _ScaleTeam() when $default != null:
return $default(_that.id,_that.scaleId,_that.beginAt,_that.filledAt,_that.finalMark,_that.comment,_that.feedback,_that.corrector,_that.correcteds,_that.team);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScaleTeam implements ScaleTeam {
  const _ScaleTeam({required this.id, @JsonKey(name: 'scale_id') required this.scaleId, @JsonKey(name: 'begin_at') required this.beginAt, @JsonKey(name: 'filled_at') this.filledAt, @JsonKey(name: 'final_mark') this.finalMark, this.comment, this.feedback, @JsonKey(name: 'corrector') required this.corrector, @JsonKey(name: 'correcteds') final  List<dynamic> correcteds = const [], @JsonKey(name: 'team') this.team}): _correcteds = correcteds;
  factory _ScaleTeam.fromJson(Map<String, dynamic> json) => _$ScaleTeamFromJson(json);

@override final  int id;
@override@JsonKey(name: 'scale_id') final  int scaleId;
@override@JsonKey(name: 'begin_at') final  String beginAt;
@override@JsonKey(name: 'filled_at') final  String? filledAt;
@override@JsonKey(name: 'final_mark') final  int? finalMark;
@override final  String? comment;
@override final  String? feedback;
@override@JsonKey(name: 'corrector') final  dynamic corrector;
 final  List<dynamic> _correcteds;
@override@JsonKey(name: 'correcteds') List<dynamic> get correcteds {
  if (_correcteds is EqualUnmodifiableListView) return _correcteds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_correcteds);
}

@override@JsonKey(name: 'team') final  ScaleTeamTeam? team;

/// Create a copy of ScaleTeam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScaleTeamCopyWith<_ScaleTeam> get copyWith => __$ScaleTeamCopyWithImpl<_ScaleTeam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScaleTeamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScaleTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.scaleId, scaleId) || other.scaleId == scaleId)&&(identical(other.beginAt, beginAt) || other.beginAt == beginAt)&&(identical(other.filledAt, filledAt) || other.filledAt == filledAt)&&(identical(other.finalMark, finalMark) || other.finalMark == finalMark)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&const DeepCollectionEquality().equals(other.corrector, corrector)&&const DeepCollectionEquality().equals(other._correcteds, _correcteds)&&(identical(other.team, team) || other.team == team));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,scaleId,beginAt,filledAt,finalMark,comment,feedback,const DeepCollectionEquality().hash(corrector),const DeepCollectionEquality().hash(_correcteds),team);

@override
String toString() {
  return 'ScaleTeam(id: $id, scaleId: $scaleId, beginAt: $beginAt, filledAt: $filledAt, finalMark: $finalMark, comment: $comment, feedback: $feedback, corrector: $corrector, correcteds: $correcteds, team: $team)';
}


}

/// @nodoc
abstract mixin class _$ScaleTeamCopyWith<$Res> implements $ScaleTeamCopyWith<$Res> {
  factory _$ScaleTeamCopyWith(_ScaleTeam value, $Res Function(_ScaleTeam) _then) = __$ScaleTeamCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'scale_id') int scaleId,@JsonKey(name: 'begin_at') String beginAt,@JsonKey(name: 'filled_at') String? filledAt,@JsonKey(name: 'final_mark') int? finalMark, String? comment, String? feedback,@JsonKey(name: 'corrector') dynamic corrector,@JsonKey(name: 'correcteds') List<dynamic> correcteds,@JsonKey(name: 'team') ScaleTeamTeam? team
});


@override $ScaleTeamTeamCopyWith<$Res>? get team;

}
/// @nodoc
class __$ScaleTeamCopyWithImpl<$Res>
    implements _$ScaleTeamCopyWith<$Res> {
  __$ScaleTeamCopyWithImpl(this._self, this._then);

  final _ScaleTeam _self;
  final $Res Function(_ScaleTeam) _then;

/// Create a copy of ScaleTeam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? scaleId = null,Object? beginAt = null,Object? filledAt = freezed,Object? finalMark = freezed,Object? comment = freezed,Object? feedback = freezed,Object? corrector = freezed,Object? correcteds = null,Object? team = freezed,}) {
  return _then(_ScaleTeam(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,scaleId: null == scaleId ? _self.scaleId : scaleId // ignore: cast_nullable_to_non_nullable
as int,beginAt: null == beginAt ? _self.beginAt : beginAt // ignore: cast_nullable_to_non_nullable
as String,filledAt: freezed == filledAt ? _self.filledAt : filledAt // ignore: cast_nullable_to_non_nullable
as String?,finalMark: freezed == finalMark ? _self.finalMark : finalMark // ignore: cast_nullable_to_non_nullable
as int?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,corrector: freezed == corrector ? _self.corrector : corrector // ignore: cast_nullable_to_non_nullable
as dynamic,correcteds: null == correcteds ? _self._correcteds : correcteds // ignore: cast_nullable_to_non_nullable
as List<dynamic>,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as ScaleTeamTeam?,
  ));
}

/// Create a copy of ScaleTeam
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScaleTeamTeamCopyWith<$Res>? get team {
    if (_self.team == null) {
    return null;
  }

  return $ScaleTeamTeamCopyWith<$Res>(_self.team!, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// @nodoc
mixin _$ScaleTeamTeam {

 int get id; String get name;@JsonKey(name: 'project_id') int get projectId; String? get status;@JsonKey(name: 'final_mark') int? get finalMark;
/// Create a copy of ScaleTeamTeam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScaleTeamTeamCopyWith<ScaleTeamTeam> get copyWith => _$ScaleTeamTeamCopyWithImpl<ScaleTeamTeam>(this as ScaleTeamTeam, _$identity);

  /// Serializes this ScaleTeamTeam to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScaleTeamTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.status, status) || other.status == status)&&(identical(other.finalMark, finalMark) || other.finalMark == finalMark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,projectId,status,finalMark);

@override
String toString() {
  return 'ScaleTeamTeam(id: $id, name: $name, projectId: $projectId, status: $status, finalMark: $finalMark)';
}


}

/// @nodoc
abstract mixin class $ScaleTeamTeamCopyWith<$Res>  {
  factory $ScaleTeamTeamCopyWith(ScaleTeamTeam value, $Res Function(ScaleTeamTeam) _then) = _$ScaleTeamTeamCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'project_id') int projectId, String? status,@JsonKey(name: 'final_mark') int? finalMark
});




}
/// @nodoc
class _$ScaleTeamTeamCopyWithImpl<$Res>
    implements $ScaleTeamTeamCopyWith<$Res> {
  _$ScaleTeamTeamCopyWithImpl(this._self, this._then);

  final ScaleTeamTeam _self;
  final $Res Function(ScaleTeamTeam) _then;

/// Create a copy of ScaleTeamTeam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? projectId = null,Object? status = freezed,Object? finalMark = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,finalMark: freezed == finalMark ? _self.finalMark : finalMark // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScaleTeamTeam].
extension ScaleTeamTeamPatterns on ScaleTeamTeam {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScaleTeamTeam value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScaleTeamTeam() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScaleTeamTeam value)  $default,){
final _that = this;
switch (_that) {
case _ScaleTeamTeam():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScaleTeamTeam value)?  $default,){
final _that = this;
switch (_that) {
case _ScaleTeamTeam() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'project_id')  int projectId,  String? status, @JsonKey(name: 'final_mark')  int? finalMark)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScaleTeamTeam() when $default != null:
return $default(_that.id,_that.name,_that.projectId,_that.status,_that.finalMark);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'project_id')  int projectId,  String? status, @JsonKey(name: 'final_mark')  int? finalMark)  $default,) {final _that = this;
switch (_that) {
case _ScaleTeamTeam():
return $default(_that.id,_that.name,_that.projectId,_that.status,_that.finalMark);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'project_id')  int projectId,  String? status, @JsonKey(name: 'final_mark')  int? finalMark)?  $default,) {final _that = this;
switch (_that) {
case _ScaleTeamTeam() when $default != null:
return $default(_that.id,_that.name,_that.projectId,_that.status,_that.finalMark);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScaleTeamTeam implements ScaleTeamTeam {
  const _ScaleTeamTeam({required this.id, required this.name, @JsonKey(name: 'project_id') required this.projectId, this.status, @JsonKey(name: 'final_mark') this.finalMark});
  factory _ScaleTeamTeam.fromJson(Map<String, dynamic> json) => _$ScaleTeamTeamFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'project_id') final  int projectId;
@override final  String? status;
@override@JsonKey(name: 'final_mark') final  int? finalMark;

/// Create a copy of ScaleTeamTeam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScaleTeamTeamCopyWith<_ScaleTeamTeam> get copyWith => __$ScaleTeamTeamCopyWithImpl<_ScaleTeamTeam>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScaleTeamTeamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScaleTeamTeam&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.status, status) || other.status == status)&&(identical(other.finalMark, finalMark) || other.finalMark == finalMark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,projectId,status,finalMark);

@override
String toString() {
  return 'ScaleTeamTeam(id: $id, name: $name, projectId: $projectId, status: $status, finalMark: $finalMark)';
}


}

/// @nodoc
abstract mixin class _$ScaleTeamTeamCopyWith<$Res> implements $ScaleTeamTeamCopyWith<$Res> {
  factory _$ScaleTeamTeamCopyWith(_ScaleTeamTeam value, $Res Function(_ScaleTeamTeam) _then) = __$ScaleTeamTeamCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'project_id') int projectId, String? status,@JsonKey(name: 'final_mark') int? finalMark
});




}
/// @nodoc
class __$ScaleTeamTeamCopyWithImpl<$Res>
    implements _$ScaleTeamTeamCopyWith<$Res> {
  __$ScaleTeamTeamCopyWithImpl(this._self, this._then);

  final _ScaleTeamTeam _self;
  final $Res Function(_ScaleTeamTeam) _then;

/// Create a copy of ScaleTeamTeam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? projectId = null,Object? status = freezed,Object? finalMark = freezed,}) {
  return _then(_ScaleTeamTeam(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,finalMark: freezed == finalMark ? _self.finalMark : finalMark // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
