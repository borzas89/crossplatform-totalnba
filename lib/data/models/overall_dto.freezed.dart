// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overall_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OverallDto _$OverallDtoFromJson(Map<String, dynamic> json) {
  return _OverallDto.fromJson(json);
}

/// @nodoc
mixin _$OverallDto {
  String get teamName => throw _privateConstructorUsedError;
  double get overall => throw _privateConstructorUsedError;
  double get awayOverall => throw _privateConstructorUsedError;
  double get homeOverall => throw _privateConstructorUsedError;
  double get teamAvg => throw _privateConstructorUsedError;
  double get teamHomeAvg => throw _privateConstructorUsedError;
  double get teamAwayAvg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OverallDtoCopyWith<OverallDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverallDtoCopyWith<$Res> {
  factory $OverallDtoCopyWith(
          OverallDto value, $Res Function(OverallDto) then) =
      _$OverallDtoCopyWithImpl<$Res, OverallDto>;
  @useResult
  $Res call(
      {String teamName,
      double overall,
      double awayOverall,
      double homeOverall,
      double teamAvg,
      double teamHomeAvg,
      double teamAwayAvg});
}

/// @nodoc
class _$OverallDtoCopyWithImpl<$Res, $Val extends OverallDto>
    implements $OverallDtoCopyWith<$Res> {
  _$OverallDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamName = null,
    Object? overall = null,
    Object? awayOverall = null,
    Object? homeOverall = null,
    Object? teamAvg = null,
    Object? teamHomeAvg = null,
    Object? teamAwayAvg = null,
  }) {
    return _then(_value.copyWith(
      teamName: null == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      overall: null == overall
          ? _value.overall
          : overall // ignore: cast_nullable_to_non_nullable
              as double,
      awayOverall: null == awayOverall
          ? _value.awayOverall
          : awayOverall // ignore: cast_nullable_to_non_nullable
              as double,
      homeOverall: null == homeOverall
          ? _value.homeOverall
          : homeOverall // ignore: cast_nullable_to_non_nullable
              as double,
      teamAvg: null == teamAvg
          ? _value.teamAvg
          : teamAvg // ignore: cast_nullable_to_non_nullable
              as double,
      teamHomeAvg: null == teamHomeAvg
          ? _value.teamHomeAvg
          : teamHomeAvg // ignore: cast_nullable_to_non_nullable
              as double,
      teamAwayAvg: null == teamAwayAvg
          ? _value.teamAwayAvg
          : teamAwayAvg // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OverallDtoImplCopyWith<$Res>
    implements $OverallDtoCopyWith<$Res> {
  factory _$$OverallDtoImplCopyWith(
          _$OverallDtoImpl value, $Res Function(_$OverallDtoImpl) then) =
      __$$OverallDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String teamName,
      double overall,
      double awayOverall,
      double homeOverall,
      double teamAvg,
      double teamHomeAvg,
      double teamAwayAvg});
}

/// @nodoc
class __$$OverallDtoImplCopyWithImpl<$Res>
    extends _$OverallDtoCopyWithImpl<$Res, _$OverallDtoImpl>
    implements _$$OverallDtoImplCopyWith<$Res> {
  __$$OverallDtoImplCopyWithImpl(
      _$OverallDtoImpl _value, $Res Function(_$OverallDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamName = null,
    Object? overall = null,
    Object? awayOverall = null,
    Object? homeOverall = null,
    Object? teamAvg = null,
    Object? teamHomeAvg = null,
    Object? teamAwayAvg = null,
  }) {
    return _then(_$OverallDtoImpl(
      teamName: null == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      overall: null == overall
          ? _value.overall
          : overall // ignore: cast_nullable_to_non_nullable
              as double,
      awayOverall: null == awayOverall
          ? _value.awayOverall
          : awayOverall // ignore: cast_nullable_to_non_nullable
              as double,
      homeOverall: null == homeOverall
          ? _value.homeOverall
          : homeOverall // ignore: cast_nullable_to_non_nullable
              as double,
      teamAvg: null == teamAvg
          ? _value.teamAvg
          : teamAvg // ignore: cast_nullable_to_non_nullable
              as double,
      teamHomeAvg: null == teamHomeAvg
          ? _value.teamHomeAvg
          : teamHomeAvg // ignore: cast_nullable_to_non_nullable
              as double,
      teamAwayAvg: null == teamAwayAvg
          ? _value.teamAwayAvg
          : teamAwayAvg // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OverallDtoImpl implements _OverallDto {
  const _$OverallDtoImpl(
      {required this.teamName,
      required this.overall,
      required this.awayOverall,
      required this.homeOverall,
      required this.teamAvg,
      required this.teamHomeAvg,
      required this.teamAwayAvg});

  factory _$OverallDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OverallDtoImplFromJson(json);

  @override
  final String teamName;
  @override
  final double overall;
  @override
  final double awayOverall;
  @override
  final double homeOverall;
  @override
  final double teamAvg;
  @override
  final double teamHomeAvg;
  @override
  final double teamAwayAvg;

  @override
  String toString() {
    return 'OverallDto(teamName: $teamName, overall: $overall, awayOverall: $awayOverall, homeOverall: $homeOverall, teamAvg: $teamAvg, teamHomeAvg: $teamHomeAvg, teamAwayAvg: $teamAwayAvg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OverallDtoImpl &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            (identical(other.overall, overall) || other.overall == overall) &&
            (identical(other.awayOverall, awayOverall) ||
                other.awayOverall == awayOverall) &&
            (identical(other.homeOverall, homeOverall) ||
                other.homeOverall == homeOverall) &&
            (identical(other.teamAvg, teamAvg) || other.teamAvg == teamAvg) &&
            (identical(other.teamHomeAvg, teamHomeAvg) ||
                other.teamHomeAvg == teamHomeAvg) &&
            (identical(other.teamAwayAvg, teamAwayAvg) ||
                other.teamAwayAvg == teamAwayAvg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, teamName, overall, awayOverall,
      homeOverall, teamAvg, teamHomeAvg, teamAwayAvg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OverallDtoImplCopyWith<_$OverallDtoImpl> get copyWith =>
      __$$OverallDtoImplCopyWithImpl<_$OverallDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OverallDtoImplToJson(
      this,
    );
  }
}

abstract class _OverallDto implements OverallDto {
  const factory _OverallDto(
      {required final String teamName,
      required final double overall,
      required final double awayOverall,
      required final double homeOverall,
      required final double teamAvg,
      required final double teamHomeAvg,
      required final double teamAwayAvg}) = _$OverallDtoImpl;

  factory _OverallDto.fromJson(Map<String, dynamic> json) =
      _$OverallDtoImpl.fromJson;

  @override
  String get teamName;
  @override
  double get overall;
  @override
  double get awayOverall;
  @override
  double get homeOverall;
  @override
  double get teamAvg;
  @override
  double get teamHomeAvg;
  @override
  double get teamAwayAvg;
  @override
  @JsonKey(ignore: true)
  _$$OverallDtoImplCopyWith<_$OverallDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
