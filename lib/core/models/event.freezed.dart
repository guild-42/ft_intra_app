// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FtEvent _$FtEventFromJson(Map<String, dynamic> json) {
  return _FtEvent.fromJson(json);
}

/// @nodoc
mixin _$FtEvent {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_people')
  int? get maxPeople => throw _privateConstructorUsedError;
  @JsonKey(name: 'nbr_subscribers')
  int get nbrSubscribers => throw _privateConstructorUsedError;
  @JsonKey(name: 'begin_at')
  String? get beginAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_at')
  String? get endAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'campus_ids')
  List<int> get campusIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FtEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FtEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FtEventCopyWith<FtEvent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FtEventCopyWith<$Res> {
  factory $FtEventCopyWith(FtEvent value, $Res Function(FtEvent) then) =
      _$FtEventCopyWithImpl<$Res, FtEvent>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      String? location,
      String kind,
      @JsonKey(name: 'max_people') int? maxPeople,
      @JsonKey(name: 'nbr_subscribers') int nbrSubscribers,
      @JsonKey(name: 'begin_at') String? beginAt,
      @JsonKey(name: 'end_at') String? endAt,
      @JsonKey(name: 'campus_ids') List<int> campusIds,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$FtEventCopyWithImpl<$Res, $Val extends FtEvent>
    implements $FtEventCopyWith<$Res> {
  _$FtEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FtEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? location = freezed,
    Object? kind = null,
    Object? maxPeople = freezed,
    Object? nbrSubscribers = null,
    Object? beginAt = freezed,
    Object? endAt = freezed,
    Object? campusIds = null,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      maxPeople: freezed == maxPeople
          ? _value.maxPeople
          : maxPeople // ignore: cast_nullable_to_non_nullable
              as int?,
      nbrSubscribers: null == nbrSubscribers
          ? _value.nbrSubscribers
          : nbrSubscribers // ignore: cast_nullable_to_non_nullable
              as int,
      beginAt: freezed == beginAt
          ? _value.beginAt
          : beginAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String?,
      campusIds: null == campusIds
          ? _value.campusIds
          : campusIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FtEventImplCopyWith<$Res> implements $FtEventCopyWith<$Res> {
  factory _$$FtEventImplCopyWith(
          _$FtEventImpl value, $Res Function(_$FtEventImpl) then) =
      __$$FtEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      String? location,
      String kind,
      @JsonKey(name: 'max_people') int? maxPeople,
      @JsonKey(name: 'nbr_subscribers') int nbrSubscribers,
      @JsonKey(name: 'begin_at') String? beginAt,
      @JsonKey(name: 'end_at') String? endAt,
      @JsonKey(name: 'campus_ids') List<int> campusIds,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$FtEventImplCopyWithImpl<$Res>
    extends _$FtEventCopyWithImpl<$Res, _$FtEventImpl>
    implements _$$FtEventImplCopyWith<$Res> {
  __$$FtEventImplCopyWithImpl(
      _$FtEventImpl _value, $Res Function(_$FtEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of FtEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? location = freezed,
    Object? kind = null,
    Object? maxPeople = freezed,
    Object? nbrSubscribers = null,
    Object? beginAt = freezed,
    Object? endAt = freezed,
    Object? campusIds = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$FtEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      maxPeople: freezed == maxPeople
          ? _value.maxPeople
          : maxPeople // ignore: cast_nullable_to_non_nullable
              as int?,
      nbrSubscribers: null == nbrSubscribers
          ? _value.nbrSubscribers
          : nbrSubscribers // ignore: cast_nullable_to_non_nullable
              as int,
      beginAt: freezed == beginAt
          ? _value.beginAt
          : beginAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String?,
      campusIds: null == campusIds
          ? _value._campusIds
          : campusIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FtEventImpl implements _FtEvent {
  const _$FtEventImpl(
      {required this.id,
      required this.name,
      this.description,
      this.location,
      required this.kind,
      @JsonKey(name: 'max_people') this.maxPeople,
      @JsonKey(name: 'nbr_subscribers') this.nbrSubscribers = 0,
      @JsonKey(name: 'begin_at') this.beginAt,
      @JsonKey(name: 'end_at') this.endAt,
      @JsonKey(name: 'campus_ids') final List<int> campusIds = const [],
      @JsonKey(name: 'created_at') this.createdAt})
      : _campusIds = campusIds;

  factory _$FtEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$FtEventImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? location;
  @override
  final String kind;
  @override
  @JsonKey(name: 'max_people')
  final int? maxPeople;
  @override
  @JsonKey(name: 'nbr_subscribers')
  final int nbrSubscribers;
  @override
  @JsonKey(name: 'begin_at')
  final String? beginAt;
  @override
  @JsonKey(name: 'end_at')
  final String? endAt;
  final List<int> _campusIds;
  @override
  @JsonKey(name: 'campus_ids')
  List<int> get campusIds {
    if (_campusIds is EqualUnmodifiableListView) return _campusIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_campusIds);
  }

  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'FtEvent(id: $id, name: $name, description: $description, location: $location, kind: $kind, maxPeople: $maxPeople, nbrSubscribers: $nbrSubscribers, beginAt: $beginAt, endAt: $endAt, campusIds: $campusIds, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FtEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.maxPeople, maxPeople) ||
                other.maxPeople == maxPeople) &&
            (identical(other.nbrSubscribers, nbrSubscribers) ||
                other.nbrSubscribers == nbrSubscribers) &&
            (identical(other.beginAt, beginAt) || other.beginAt == beginAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            const DeepCollectionEquality()
                .equals(other._campusIds, _campusIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      location,
      kind,
      maxPeople,
      nbrSubscribers,
      beginAt,
      endAt,
      const DeepCollectionEquality().hash(_campusIds),
      createdAt);

  /// Create a copy of FtEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FtEventImplCopyWith<_$FtEventImpl> get copyWith =>
      __$$FtEventImplCopyWithImpl<_$FtEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FtEventImplToJson(
      this,
    );
  }
}

abstract class _FtEvent implements FtEvent {
  const factory _FtEvent(
      {required final int id,
      required final String name,
      final String? description,
      final String? location,
      required final String kind,
      @JsonKey(name: 'max_people') final int? maxPeople,
      @JsonKey(name: 'nbr_subscribers') final int nbrSubscribers,
      @JsonKey(name: 'begin_at') final String? beginAt,
      @JsonKey(name: 'end_at') final String? endAt,
      @JsonKey(name: 'campus_ids') final List<int> campusIds,
      @JsonKey(name: 'created_at') final String? createdAt}) = _$FtEventImpl;

  factory _FtEvent.fromJson(Map<String, dynamic> json) = _$FtEventImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get location;
  @override
  String get kind;
  @override
  @JsonKey(name: 'max_people')
  int? get maxPeople;
  @override
  @JsonKey(name: 'nbr_subscribers')
  int get nbrSubscribers;
  @override
  @JsonKey(name: 'begin_at')
  String? get beginAt;
  @override
  @JsonKey(name: 'end_at')
  String? get endAt;
  @override
  @JsonKey(name: 'campus_ids')
  List<int> get campusIds;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of FtEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FtEventImplCopyWith<_$FtEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
