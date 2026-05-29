// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FtSlot _$FtSlotFromJson(Map<String, dynamic> json) {
  return _FtSlot.fromJson(json);
}

/// @nodoc
mixin _$FtSlot {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'begin_at')
  String get beginAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_at')
  String get endAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'scale_team')
  dynamic get scaleTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  dynamic get user => throw _privateConstructorUsedError;

  /// Serializes this FtSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FtSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FtSlotCopyWith<FtSlot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FtSlotCopyWith<$Res> {
  factory $FtSlotCopyWith(FtSlot value, $Res Function(FtSlot) then) =
      _$FtSlotCopyWithImpl<$Res, FtSlot>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'begin_at') String beginAt,
      @JsonKey(name: 'end_at') String endAt,
      @JsonKey(name: 'scale_team') dynamic scaleTeam,
      @JsonKey(name: 'user') dynamic user});
}

/// @nodoc
class _$FtSlotCopyWithImpl<$Res, $Val extends FtSlot>
    implements $FtSlotCopyWith<$Res> {
  _$FtSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FtSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? beginAt = null,
    Object? endAt = null,
    Object? scaleTeam = freezed,
    Object? user = freezed,
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
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String,
      scaleTeam: freezed == scaleTeam
          ? _value.scaleTeam
          : scaleTeam // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FtSlotImplCopyWith<$Res> implements $FtSlotCopyWith<$Res> {
  factory _$$FtSlotImplCopyWith(
          _$FtSlotImpl value, $Res Function(_$FtSlotImpl) then) =
      __$$FtSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'begin_at') String beginAt,
      @JsonKey(name: 'end_at') String endAt,
      @JsonKey(name: 'scale_team') dynamic scaleTeam,
      @JsonKey(name: 'user') dynamic user});
}

/// @nodoc
class __$$FtSlotImplCopyWithImpl<$Res>
    extends _$FtSlotCopyWithImpl<$Res, _$FtSlotImpl>
    implements _$$FtSlotImplCopyWith<$Res> {
  __$$FtSlotImplCopyWithImpl(
      _$FtSlotImpl _value, $Res Function(_$FtSlotImpl) _then)
      : super(_value, _then);

  /// Create a copy of FtSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? beginAt = null,
    Object? endAt = null,
    Object? scaleTeam = freezed,
    Object? user = freezed,
  }) {
    return _then(_$FtSlotImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      beginAt: null == beginAt
          ? _value.beginAt
          : beginAt // ignore: cast_nullable_to_non_nullable
              as String,
      endAt: null == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String,
      scaleTeam: freezed == scaleTeam
          ? _value.scaleTeam
          : scaleTeam // ignore: cast_nullable_to_non_nullable
              as dynamic,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FtSlotImpl implements _FtSlot {
  const _$FtSlotImpl(
      {required this.id,
      @JsonKey(name: 'begin_at') required this.beginAt,
      @JsonKey(name: 'end_at') required this.endAt,
      @JsonKey(name: 'scale_team') this.scaleTeam,
      @JsonKey(name: 'user') this.user});

  factory _$FtSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$FtSlotImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'begin_at')
  final String beginAt;
  @override
  @JsonKey(name: 'end_at')
  final String endAt;
  @override
  @JsonKey(name: 'scale_team')
  final dynamic scaleTeam;
  @override
  @JsonKey(name: 'user')
  final dynamic user;

  @override
  String toString() {
    return 'FtSlot(id: $id, beginAt: $beginAt, endAt: $endAt, scaleTeam: $scaleTeam, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FtSlotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.beginAt, beginAt) || other.beginAt == beginAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            const DeepCollectionEquality().equals(other.scaleTeam, scaleTeam) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      beginAt,
      endAt,
      const DeepCollectionEquality().hash(scaleTeam),
      const DeepCollectionEquality().hash(user));

  /// Create a copy of FtSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FtSlotImplCopyWith<_$FtSlotImpl> get copyWith =>
      __$$FtSlotImplCopyWithImpl<_$FtSlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FtSlotImplToJson(
      this,
    );
  }
}

abstract class _FtSlot implements FtSlot {
  const factory _FtSlot(
      {required final int id,
      @JsonKey(name: 'begin_at') required final String beginAt,
      @JsonKey(name: 'end_at') required final String endAt,
      @JsonKey(name: 'scale_team') final dynamic scaleTeam,
      @JsonKey(name: 'user') final dynamic user}) = _$FtSlotImpl;

  factory _FtSlot.fromJson(Map<String, dynamic> json) = _$FtSlotImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'begin_at')
  String get beginAt;
  @override
  @JsonKey(name: 'end_at')
  String get endAt;
  @override
  @JsonKey(name: 'scale_team')
  dynamic get scaleTeam;
  @override
  @JsonKey(name: 'user')
  dynamic get user;

  /// Create a copy of FtSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FtSlotImplCopyWith<_$FtSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
