// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FtEvent {

 int get id; String get name; String? get description; String? get location; String get kind;@JsonKey(name: 'max_people') int? get maxPeople;@JsonKey(name: 'nbr_subscribers') int get nbrSubscribers;@JsonKey(name: 'begin_at') String? get beginAt;@JsonKey(name: 'end_at') String? get endAt;@JsonKey(name: 'campus_ids') List<int> get campusIds;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of FtEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FtEventCopyWith<FtEvent> get copyWith => _$FtEventCopyWithImpl<FtEvent>(this as FtEvent, _$identity);

  /// Serializes this FtEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FtEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.maxPeople, maxPeople) || other.maxPeople == maxPeople)&&(identical(other.nbrSubscribers, nbrSubscribers) || other.nbrSubscribers == nbrSubscribers)&&(identical(other.beginAt, beginAt) || other.beginAt == beginAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&const DeepCollectionEquality().equals(other.campusIds, campusIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,location,kind,maxPeople,nbrSubscribers,beginAt,endAt,const DeepCollectionEquality().hash(campusIds),createdAt);

@override
String toString() {
  return 'FtEvent(id: $id, name: $name, description: $description, location: $location, kind: $kind, maxPeople: $maxPeople, nbrSubscribers: $nbrSubscribers, beginAt: $beginAt, endAt: $endAt, campusIds: $campusIds, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FtEventCopyWith<$Res>  {
  factory $FtEventCopyWith(FtEvent value, $Res Function(FtEvent) _then) = _$FtEventCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? description, String? location, String kind,@JsonKey(name: 'max_people') int? maxPeople,@JsonKey(name: 'nbr_subscribers') int nbrSubscribers,@JsonKey(name: 'begin_at') String? beginAt,@JsonKey(name: 'end_at') String? endAt,@JsonKey(name: 'campus_ids') List<int> campusIds,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$FtEventCopyWithImpl<$Res>
    implements $FtEventCopyWith<$Res> {
  _$FtEventCopyWithImpl(this._self, this._then);

  final FtEvent _self;
  final $Res Function(FtEvent) _then;

/// Create a copy of FtEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? location = freezed,Object? kind = null,Object? maxPeople = freezed,Object? nbrSubscribers = null,Object? beginAt = freezed,Object? endAt = freezed,Object? campusIds = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,maxPeople: freezed == maxPeople ? _self.maxPeople : maxPeople // ignore: cast_nullable_to_non_nullable
as int?,nbrSubscribers: null == nbrSubscribers ? _self.nbrSubscribers : nbrSubscribers // ignore: cast_nullable_to_non_nullable
as int,beginAt: freezed == beginAt ? _self.beginAt : beginAt // ignore: cast_nullable_to_non_nullable
as String?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,campusIds: null == campusIds ? _self.campusIds : campusIds // ignore: cast_nullable_to_non_nullable
as List<int>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FtEvent].
extension FtEventPatterns on FtEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FtEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FtEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FtEvent value)  $default,){
final _that = this;
switch (_that) {
case _FtEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FtEvent value)?  $default,){
final _that = this;
switch (_that) {
case _FtEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? location,  String kind, @JsonKey(name: 'max_people')  int? maxPeople, @JsonKey(name: 'nbr_subscribers')  int nbrSubscribers, @JsonKey(name: 'begin_at')  String? beginAt, @JsonKey(name: 'end_at')  String? endAt, @JsonKey(name: 'campus_ids')  List<int> campusIds, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FtEvent() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.location,_that.kind,_that.maxPeople,_that.nbrSubscribers,_that.beginAt,_that.endAt,_that.campusIds,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? location,  String kind, @JsonKey(name: 'max_people')  int? maxPeople, @JsonKey(name: 'nbr_subscribers')  int nbrSubscribers, @JsonKey(name: 'begin_at')  String? beginAt, @JsonKey(name: 'end_at')  String? endAt, @JsonKey(name: 'campus_ids')  List<int> campusIds, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FtEvent():
return $default(_that.id,_that.name,_that.description,_that.location,_that.kind,_that.maxPeople,_that.nbrSubscribers,_that.beginAt,_that.endAt,_that.campusIds,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? description,  String? location,  String kind, @JsonKey(name: 'max_people')  int? maxPeople, @JsonKey(name: 'nbr_subscribers')  int nbrSubscribers, @JsonKey(name: 'begin_at')  String? beginAt, @JsonKey(name: 'end_at')  String? endAt, @JsonKey(name: 'campus_ids')  List<int> campusIds, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FtEvent() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.location,_that.kind,_that.maxPeople,_that.nbrSubscribers,_that.beginAt,_that.endAt,_that.campusIds,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FtEvent implements FtEvent {
  const _FtEvent({required this.id, required this.name, this.description, this.location, required this.kind, @JsonKey(name: 'max_people') this.maxPeople, @JsonKey(name: 'nbr_subscribers') this.nbrSubscribers = 0, @JsonKey(name: 'begin_at') this.beginAt, @JsonKey(name: 'end_at') this.endAt, @JsonKey(name: 'campus_ids') final  List<int> campusIds = const [], @JsonKey(name: 'created_at') this.createdAt}): _campusIds = campusIds;
  factory _FtEvent.fromJson(Map<String, dynamic> json) => _$FtEventFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? description;
@override final  String? location;
@override final  String kind;
@override@JsonKey(name: 'max_people') final  int? maxPeople;
@override@JsonKey(name: 'nbr_subscribers') final  int nbrSubscribers;
@override@JsonKey(name: 'begin_at') final  String? beginAt;
@override@JsonKey(name: 'end_at') final  String? endAt;
 final  List<int> _campusIds;
@override@JsonKey(name: 'campus_ids') List<int> get campusIds {
  if (_campusIds is EqualUnmodifiableListView) return _campusIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_campusIds);
}

@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of FtEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FtEventCopyWith<_FtEvent> get copyWith => __$FtEventCopyWithImpl<_FtEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FtEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FtEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.maxPeople, maxPeople) || other.maxPeople == maxPeople)&&(identical(other.nbrSubscribers, nbrSubscribers) || other.nbrSubscribers == nbrSubscribers)&&(identical(other.beginAt, beginAt) || other.beginAt == beginAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&const DeepCollectionEquality().equals(other._campusIds, _campusIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,location,kind,maxPeople,nbrSubscribers,beginAt,endAt,const DeepCollectionEquality().hash(_campusIds),createdAt);

@override
String toString() {
  return 'FtEvent(id: $id, name: $name, description: $description, location: $location, kind: $kind, maxPeople: $maxPeople, nbrSubscribers: $nbrSubscribers, beginAt: $beginAt, endAt: $endAt, campusIds: $campusIds, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FtEventCopyWith<$Res> implements $FtEventCopyWith<$Res> {
  factory _$FtEventCopyWith(_FtEvent value, $Res Function(_FtEvent) _then) = __$FtEventCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? description, String? location, String kind,@JsonKey(name: 'max_people') int? maxPeople,@JsonKey(name: 'nbr_subscribers') int nbrSubscribers,@JsonKey(name: 'begin_at') String? beginAt,@JsonKey(name: 'end_at') String? endAt,@JsonKey(name: 'campus_ids') List<int> campusIds,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$FtEventCopyWithImpl<$Res>
    implements _$FtEventCopyWith<$Res> {
  __$FtEventCopyWithImpl(this._self, this._then);

  final _FtEvent _self;
  final $Res Function(_FtEvent) _then;

/// Create a copy of FtEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? location = freezed,Object? kind = null,Object? maxPeople = freezed,Object? nbrSubscribers = null,Object? beginAt = freezed,Object? endAt = freezed,Object? campusIds = null,Object? createdAt = freezed,}) {
  return _then(_FtEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,maxPeople: freezed == maxPeople ? _self.maxPeople : maxPeople // ignore: cast_nullable_to_non_nullable
as int?,nbrSubscribers: null == nbrSubscribers ? _self.nbrSubscribers : nbrSubscribers // ignore: cast_nullable_to_non_nullable
as int,beginAt: freezed == beginAt ? _self.beginAt : beginAt // ignore: cast_nullable_to_non_nullable
as String?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String?,campusIds: null == campusIds ? _self._campusIds : campusIds // ignore: cast_nullable_to_non_nullable
as List<int>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
