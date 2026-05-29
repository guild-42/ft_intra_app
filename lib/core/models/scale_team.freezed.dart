// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scale_team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScaleTeam _$ScaleTeamFromJson(Map<String, dynamic> json) {
  return _ScaleTeam.fromJson(json);
}

/// @nodoc
mixin _$ScaleTeam {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'scale_id')
  int get scaleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'begin_at')
  String get beginAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'filled_at')
  String? get filledAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_mark')
  int? get finalMark => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get feedback => throw _privateConstructorUsedError;
  @JsonKey(name: 'corrector')
  dynamic get corrector => throw _privateConstructorUsedError;
  @JsonKey(name: 'correcteds')
  List<dynamic> get correcteds => throw _privateConstructorUsedError;
  @JsonKey(name: 'team')
  ScaleTeamTeam? get team => throw _privateConstructorUsedError;

  /// Serializes this ScaleTeam to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScaleTeam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScaleTeamCopyWith<ScaleTeam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScaleTeamCopyWith<$Res> {
  factory $ScaleTeamCopyWith(ScaleTeam value, $Res Function(ScaleTeam) then) =
      _$ScaleTeamCopyWithImpl<$Res, ScaleTeam>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'scale_id') int scaleId,
      @JsonKey(name: 'begin_at') String beginAt,
      @JsonKey(name: 'filled_at') String? filledAt,
      @JsonKey(name: 'final_mark') int? finalMark,
      String? comment,
      String? feedback,
      @JsonKey(name: 'corrector') dynamic corrector,
      @JsonKey(name: 'correcteds') List<dynamic> correcteds,
      @JsonKey(name: 'team') ScaleTeamTeam? team});

  $ScaleTeamTeamCopyWith<$Res>? get team;
}

/// @nodoc
class _$ScaleTeamCopyWithImpl<$Res, $Val extends ScaleTeam>
    implements $ScaleTeamCopyWith<$Res> {
  _$ScaleTeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScaleTeam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? scaleId = null,
    Object? beginAt = null,
    Object? filledAt = freezed,
    Object? finalMark = freezed,
    Object? comment = freezed,
    Object? feedback = freezed,
    Object? corrector = freezed,
    Object? correcteds = null,
    Object? team = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      scaleId: null == scaleId
          ? _value.scaleId
          : scaleId // ignore: cast_nullable_to_non_nullable
              as int,
      beginAt: null == beginAt
          ? _value.beginAt
          : beginAt // ignore: cast_nullable_to_non_nullable
              as String,
      filledAt: freezed == filledAt
          ? _value.filledAt
          : filledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      finalMark: freezed == finalMark
          ? _value.finalMark
          : finalMark // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      corrector: freezed == corrector
          ? _value.corrector
          : corrector // ignore: cast_nullable_to_non_nullable
              as dynamic,
      correcteds: null == correcteds
          ? _value.correcteds
          : correcteds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as ScaleTeamTeam?,
    ) as $Val);
  }

  /// Create a copy of ScaleTeam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScaleTeamTeamCopyWith<$Res>? get team {
    if (_value.team == null) {
      return null;
    }

    return $ScaleTeamTeamCopyWith<$Res>(_value.team!, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScaleTeamImplCopyWith<$Res>
    implements $ScaleTeamCopyWith<$Res> {
  factory _$$ScaleTeamImplCopyWith(
          _$ScaleTeamImpl value, $Res Function(_$ScaleTeamImpl) then) =
      __$$ScaleTeamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'scale_id') int scaleId,
      @JsonKey(name: 'begin_at') String beginAt,
      @JsonKey(name: 'filled_at') String? filledAt,
      @JsonKey(name: 'final_mark') int? finalMark,
      String? comment,
      String? feedback,
      @JsonKey(name: 'corrector') dynamic corrector,
      @JsonKey(name: 'correcteds') List<dynamic> correcteds,
      @JsonKey(name: 'team') ScaleTeamTeam? team});

  @override
  $ScaleTeamTeamCopyWith<$Res>? get team;
}

/// @nodoc
class __$$ScaleTeamImplCopyWithImpl<$Res>
    extends _$ScaleTeamCopyWithImpl<$Res, _$ScaleTeamImpl>
    implements _$$ScaleTeamImplCopyWith<$Res> {
  __$$ScaleTeamImplCopyWithImpl(
      _$ScaleTeamImpl _value, $Res Function(_$ScaleTeamImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScaleTeam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? scaleId = null,
    Object? beginAt = null,
    Object? filledAt = freezed,
    Object? finalMark = freezed,
    Object? comment = freezed,
    Object? feedback = freezed,
    Object? corrector = freezed,
    Object? correcteds = null,
    Object? team = freezed,
  }) {
    return _then(_$ScaleTeamImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      scaleId: null == scaleId
          ? _value.scaleId
          : scaleId // ignore: cast_nullable_to_non_nullable
              as int,
      beginAt: null == beginAt
          ? _value.beginAt
          : beginAt // ignore: cast_nullable_to_non_nullable
              as String,
      filledAt: freezed == filledAt
          ? _value.filledAt
          : filledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      finalMark: freezed == finalMark
          ? _value.finalMark
          : finalMark // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      corrector: freezed == corrector
          ? _value.corrector
          : corrector // ignore: cast_nullable_to_non_nullable
              as dynamic,
      correcteds: null == correcteds
          ? _value._correcteds
          : correcteds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as ScaleTeamTeam?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScaleTeamImpl implements _ScaleTeam {
  const _$ScaleTeamImpl(
      {required this.id,
      @JsonKey(name: 'scale_id') required this.scaleId,
      @JsonKey(name: 'begin_at') required this.beginAt,
      @JsonKey(name: 'filled_at') this.filledAt,
      @JsonKey(name: 'final_mark') this.finalMark,
      this.comment,
      this.feedback,
      @JsonKey(name: 'corrector') required this.corrector,
      @JsonKey(name: 'correcteds') final List<dynamic> correcteds = const [],
      @JsonKey(name: 'team') this.team})
      : _correcteds = correcteds;

  factory _$ScaleTeamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScaleTeamImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'scale_id')
  final int scaleId;
  @override
  @JsonKey(name: 'begin_at')
  final String beginAt;
  @override
  @JsonKey(name: 'filled_at')
  final String? filledAt;
  @override
  @JsonKey(name: 'final_mark')
  final int? finalMark;
  @override
  final String? comment;
  @override
  final String? feedback;
  @override
  @JsonKey(name: 'corrector')
  final dynamic corrector;
  final List<dynamic> _correcteds;
  @override
  @JsonKey(name: 'correcteds')
  List<dynamic> get correcteds {
    if (_correcteds is EqualUnmodifiableListView) return _correcteds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correcteds);
  }

  @override
  @JsonKey(name: 'team')
  final ScaleTeamTeam? team;

  @override
  String toString() {
    return 'ScaleTeam(id: $id, scaleId: $scaleId, beginAt: $beginAt, filledAt: $filledAt, finalMark: $finalMark, comment: $comment, feedback: $feedback, corrector: $corrector, correcteds: $correcteds, team: $team)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScaleTeamImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scaleId, scaleId) || other.scaleId == scaleId) &&
            (identical(other.beginAt, beginAt) || other.beginAt == beginAt) &&
            (identical(other.filledAt, filledAt) ||
                other.filledAt == filledAt) &&
            (identical(other.finalMark, finalMark) ||
                other.finalMark == finalMark) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            const DeepCollectionEquality().equals(other.corrector, corrector) &&
            const DeepCollectionEquality()
                .equals(other._correcteds, _correcteds) &&
            (identical(other.team, team) || other.team == team));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      scaleId,
      beginAt,
      filledAt,
      finalMark,
      comment,
      feedback,
      const DeepCollectionEquality().hash(corrector),
      const DeepCollectionEquality().hash(_correcteds),
      team);

  /// Create a copy of ScaleTeam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScaleTeamImplCopyWith<_$ScaleTeamImpl> get copyWith =>
      __$$ScaleTeamImplCopyWithImpl<_$ScaleTeamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScaleTeamImplToJson(
      this,
    );
  }
}

abstract class _ScaleTeam implements ScaleTeam {
  const factory _ScaleTeam(
      {required final int id,
      @JsonKey(name: 'scale_id') required final int scaleId,
      @JsonKey(name: 'begin_at') required final String beginAt,
      @JsonKey(name: 'filled_at') final String? filledAt,
      @JsonKey(name: 'final_mark') final int? finalMark,
      final String? comment,
      final String? feedback,
      @JsonKey(name: 'corrector') required final dynamic corrector,
      @JsonKey(name: 'correcteds') final List<dynamic> correcteds,
      @JsonKey(name: 'team') final ScaleTeamTeam? team}) = _$ScaleTeamImpl;

  factory _ScaleTeam.fromJson(Map<String, dynamic> json) =
      _$ScaleTeamImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'scale_id')
  int get scaleId;
  @override
  @JsonKey(name: 'begin_at')
  String get beginAt;
  @override
  @JsonKey(name: 'filled_at')
  String? get filledAt;
  @override
  @JsonKey(name: 'final_mark')
  int? get finalMark;
  @override
  String? get comment;
  @override
  String? get feedback;
  @override
  @JsonKey(name: 'corrector')
  dynamic get corrector;
  @override
  @JsonKey(name: 'correcteds')
  List<dynamic> get correcteds;
  @override
  @JsonKey(name: 'team')
  ScaleTeamTeam? get team;

  /// Create a copy of ScaleTeam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScaleTeamImplCopyWith<_$ScaleTeamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScaleTeamTeam _$ScaleTeamTeamFromJson(Map<String, dynamic> json) {
  return _ScaleTeamTeam.fromJson(json);
}

/// @nodoc
mixin _$ScaleTeamTeam {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_id')
  int get projectId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_mark')
  int? get finalMark => throw _privateConstructorUsedError;

  /// Serializes this ScaleTeamTeam to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScaleTeamTeam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScaleTeamTeamCopyWith<ScaleTeamTeam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScaleTeamTeamCopyWith<$Res> {
  factory $ScaleTeamTeamCopyWith(
          ScaleTeamTeam value, $Res Function(ScaleTeamTeam) then) =
      _$ScaleTeamTeamCopyWithImpl<$Res, ScaleTeamTeam>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'project_id') int projectId,
      String? status,
      @JsonKey(name: 'final_mark') int? finalMark});
}

/// @nodoc
class _$ScaleTeamTeamCopyWithImpl<$Res, $Val extends ScaleTeamTeam>
    implements $ScaleTeamTeamCopyWith<$Res> {
  _$ScaleTeamTeamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScaleTeamTeam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? projectId = null,
    Object? status = freezed,
    Object? finalMark = freezed,
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
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      finalMark: freezed == finalMark
          ? _value.finalMark
          : finalMark // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScaleTeamTeamImplCopyWith<$Res>
    implements $ScaleTeamTeamCopyWith<$Res> {
  factory _$$ScaleTeamTeamImplCopyWith(
          _$ScaleTeamTeamImpl value, $Res Function(_$ScaleTeamTeamImpl) then) =
      __$$ScaleTeamTeamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'project_id') int projectId,
      String? status,
      @JsonKey(name: 'final_mark') int? finalMark});
}

/// @nodoc
class __$$ScaleTeamTeamImplCopyWithImpl<$Res>
    extends _$ScaleTeamTeamCopyWithImpl<$Res, _$ScaleTeamTeamImpl>
    implements _$$ScaleTeamTeamImplCopyWith<$Res> {
  __$$ScaleTeamTeamImplCopyWithImpl(
      _$ScaleTeamTeamImpl _value, $Res Function(_$ScaleTeamTeamImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScaleTeamTeam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? projectId = null,
    Object? status = freezed,
    Object? finalMark = freezed,
  }) {
    return _then(_$ScaleTeamTeamImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      finalMark: freezed == finalMark
          ? _value.finalMark
          : finalMark // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScaleTeamTeamImpl implements _ScaleTeamTeam {
  const _$ScaleTeamTeamImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'project_id') required this.projectId,
      this.status,
      @JsonKey(name: 'final_mark') this.finalMark});

  factory _$ScaleTeamTeamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScaleTeamTeamImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'project_id')
  final int projectId;
  @override
  final String? status;
  @override
  @JsonKey(name: 'final_mark')
  final int? finalMark;

  @override
  String toString() {
    return 'ScaleTeamTeam(id: $id, name: $name, projectId: $projectId, status: $status, finalMark: $finalMark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScaleTeamTeamImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.finalMark, finalMark) ||
                other.finalMark == finalMark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, projectId, status, finalMark);

  /// Create a copy of ScaleTeamTeam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScaleTeamTeamImplCopyWith<_$ScaleTeamTeamImpl> get copyWith =>
      __$$ScaleTeamTeamImplCopyWithImpl<_$ScaleTeamTeamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScaleTeamTeamImplToJson(
      this,
    );
  }
}

abstract class _ScaleTeamTeam implements ScaleTeamTeam {
  const factory _ScaleTeamTeam(
      {required final int id,
      required final String name,
      @JsonKey(name: 'project_id') required final int projectId,
      final String? status,
      @JsonKey(name: 'final_mark') final int? finalMark}) = _$ScaleTeamTeamImpl;

  factory _ScaleTeamTeam.fromJson(Map<String, dynamic> json) =
      _$ScaleTeamTeamImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'project_id')
  int get projectId;
  @override
  String? get status;
  @override
  @JsonKey(name: 'final_mark')
  int? get finalMark;

  /// Create a copy of ScaleTeamTeam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScaleTeamTeamImplCopyWith<_$ScaleTeamTeamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
