// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'predicted_match_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PredictedMatchDto _$PredictedMatchDtoFromJson(Map<String, dynamic> json) {
  return _PredictedMatchDto.fromJson(json);
}

/// @nodoc
mixin _$PredictedMatchDto {
  String get commonMatchId => throw _privateConstructorUsedError;
  String? get homeTeamName => throw _privateConstructorUsedError;
  String? get awayTeamName => throw _privateConstructorUsedError;
  String? get homeTeamAlias => throw _privateConstructorUsedError;
  String? get awayTeamAlias => throw _privateConstructorUsedError;
  double? get predictedScore => throw _privateConstructorUsedError;
  double? get predictedHomeScore => throw _privateConstructorUsedError;
  double? get predictedAwayScore => throw _privateConstructorUsedError;
  double? get predictedTotal => throw _privateConstructorUsedError;
  double? get spread => throw _privateConstructorUsedError;
  String? get weekName => throw _privateConstructorUsedError;
  int? get weekNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime? get matchDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictedMatchDtoCopyWith<PredictedMatchDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictedMatchDtoCopyWith<$Res> {
  factory $PredictedMatchDtoCopyWith(
          PredictedMatchDto value, $Res Function(PredictedMatchDto) then) =
      _$PredictedMatchDtoCopyWithImpl<$Res, PredictedMatchDto>;
  @useResult
  $Res call(
      {String commonMatchId,
      String? homeTeamName,
      String? awayTeamName,
      String? homeTeamAlias,
      String? awayTeamAlias,
      double? predictedScore,
      double? predictedHomeScore,
      double? predictedAwayScore,
      double? predictedTotal,
      double? spread,
      String? weekName,
      int? weekNumber,
      @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
      DateTime? matchDate});
}

/// @nodoc
class _$PredictedMatchDtoCopyWithImpl<$Res, $Val extends PredictedMatchDto>
    implements $PredictedMatchDtoCopyWith<$Res> {
  _$PredictedMatchDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commonMatchId = null,
    Object? homeTeamName = freezed,
    Object? awayTeamName = freezed,
    Object? homeTeamAlias = freezed,
    Object? awayTeamAlias = freezed,
    Object? predictedScore = freezed,
    Object? predictedHomeScore = freezed,
    Object? predictedAwayScore = freezed,
    Object? predictedTotal = freezed,
    Object? spread = freezed,
    Object? weekName = freezed,
    Object? weekNumber = freezed,
    Object? matchDate = freezed,
  }) {
    return _then(_value.copyWith(
      commonMatchId: null == commonMatchId
          ? _value.commonMatchId
          : commonMatchId // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeamName: freezed == homeTeamName
          ? _value.homeTeamName
          : homeTeamName // ignore: cast_nullable_to_non_nullable
              as String?,
      awayTeamName: freezed == awayTeamName
          ? _value.awayTeamName
          : awayTeamName // ignore: cast_nullable_to_non_nullable
              as String?,
      homeTeamAlias: freezed == homeTeamAlias
          ? _value.homeTeamAlias
          : homeTeamAlias // ignore: cast_nullable_to_non_nullable
              as String?,
      awayTeamAlias: freezed == awayTeamAlias
          ? _value.awayTeamAlias
          : awayTeamAlias // ignore: cast_nullable_to_non_nullable
              as String?,
      predictedScore: freezed == predictedScore
          ? _value.predictedScore
          : predictedScore // ignore: cast_nullable_to_non_nullable
              as double?,
      predictedHomeScore: freezed == predictedHomeScore
          ? _value.predictedHomeScore
          : predictedHomeScore // ignore: cast_nullable_to_non_nullable
              as double?,
      predictedAwayScore: freezed == predictedAwayScore
          ? _value.predictedAwayScore
          : predictedAwayScore // ignore: cast_nullable_to_non_nullable
              as double?,
      predictedTotal: freezed == predictedTotal
          ? _value.predictedTotal
          : predictedTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      spread: freezed == spread
          ? _value.spread
          : spread // ignore: cast_nullable_to_non_nullable
              as double?,
      weekName: freezed == weekName
          ? _value.weekName
          : weekName // ignore: cast_nullable_to_non_nullable
              as String?,
      weekNumber: freezed == weekNumber
          ? _value.weekNumber
          : weekNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      matchDate: freezed == matchDate
          ? _value.matchDate
          : matchDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictedMatchDtoImplCopyWith<$Res>
    implements $PredictedMatchDtoCopyWith<$Res> {
  factory _$$PredictedMatchDtoImplCopyWith(_$PredictedMatchDtoImpl value,
          $Res Function(_$PredictedMatchDtoImpl) then) =
      __$$PredictedMatchDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String commonMatchId,
      String? homeTeamName,
      String? awayTeamName,
      String? homeTeamAlias,
      String? awayTeamAlias,
      double? predictedScore,
      double? predictedHomeScore,
      double? predictedAwayScore,
      double? predictedTotal,
      double? spread,
      String? weekName,
      int? weekNumber,
      @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
      DateTime? matchDate});
}

/// @nodoc
class __$$PredictedMatchDtoImplCopyWithImpl<$Res>
    extends _$PredictedMatchDtoCopyWithImpl<$Res, _$PredictedMatchDtoImpl>
    implements _$$PredictedMatchDtoImplCopyWith<$Res> {
  __$$PredictedMatchDtoImplCopyWithImpl(_$PredictedMatchDtoImpl _value,
      $Res Function(_$PredictedMatchDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commonMatchId = null,
    Object? homeTeamName = freezed,
    Object? awayTeamName = freezed,
    Object? homeTeamAlias = freezed,
    Object? awayTeamAlias = freezed,
    Object? predictedScore = freezed,
    Object? predictedHomeScore = freezed,
    Object? predictedAwayScore = freezed,
    Object? predictedTotal = freezed,
    Object? spread = freezed,
    Object? weekName = freezed,
    Object? weekNumber = freezed,
    Object? matchDate = freezed,
  }) {
    return _then(_$PredictedMatchDtoImpl(
      commonMatchId: null == commonMatchId
          ? _value.commonMatchId
          : commonMatchId // ignore: cast_nullable_to_non_nullable
              as String,
      homeTeamName: freezed == homeTeamName
          ? _value.homeTeamName
          : homeTeamName // ignore: cast_nullable_to_non_nullable
              as String?,
      awayTeamName: freezed == awayTeamName
          ? _value.awayTeamName
          : awayTeamName // ignore: cast_nullable_to_non_nullable
              as String?,
      homeTeamAlias: freezed == homeTeamAlias
          ? _value.homeTeamAlias
          : homeTeamAlias // ignore: cast_nullable_to_non_nullable
              as String?,
      awayTeamAlias: freezed == awayTeamAlias
          ? _value.awayTeamAlias
          : awayTeamAlias // ignore: cast_nullable_to_non_nullable
              as String?,
      predictedScore: freezed == predictedScore
          ? _value.predictedScore
          : predictedScore // ignore: cast_nullable_to_non_nullable
              as double?,
      predictedHomeScore: freezed == predictedHomeScore
          ? _value.predictedHomeScore
          : predictedHomeScore // ignore: cast_nullable_to_non_nullable
              as double?,
      predictedAwayScore: freezed == predictedAwayScore
          ? _value.predictedAwayScore
          : predictedAwayScore // ignore: cast_nullable_to_non_nullable
              as double?,
      predictedTotal: freezed == predictedTotal
          ? _value.predictedTotal
          : predictedTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      spread: freezed == spread
          ? _value.spread
          : spread // ignore: cast_nullable_to_non_nullable
              as double?,
      weekName: freezed == weekName
          ? _value.weekName
          : weekName // ignore: cast_nullable_to_non_nullable
              as String?,
      weekNumber: freezed == weekNumber
          ? _value.weekNumber
          : weekNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      matchDate: freezed == matchDate
          ? _value.matchDate
          : matchDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictedMatchDtoImpl implements _PredictedMatchDto {
  const _$PredictedMatchDtoImpl(
      {required this.commonMatchId,
      this.homeTeamName,
      this.awayTeamName,
      this.homeTeamAlias,
      this.awayTeamAlias,
      this.predictedScore,
      this.predictedHomeScore,
      this.predictedAwayScore,
      this.predictedTotal,
      this.spread,
      this.weekName,
      this.weekNumber,
      @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
      this.matchDate});

  factory _$PredictedMatchDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictedMatchDtoImplFromJson(json);

  @override
  final String commonMatchId;
  @override
  final String? homeTeamName;
  @override
  final String? awayTeamName;
  @override
  final String? homeTeamAlias;
  @override
  final String? awayTeamAlias;
  @override
  final double? predictedScore;
  @override
  final double? predictedHomeScore;
  @override
  final double? predictedAwayScore;
  @override
  final double? predictedTotal;
  @override
  final double? spread;
  @override
  final String? weekName;
  @override
  final int? weekNumber;
  @override
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime? matchDate;

  @override
  String toString() {
    return 'PredictedMatchDto(commonMatchId: $commonMatchId, homeTeamName: $homeTeamName, awayTeamName: $awayTeamName, homeTeamAlias: $homeTeamAlias, awayTeamAlias: $awayTeamAlias, predictedScore: $predictedScore, predictedHomeScore: $predictedHomeScore, predictedAwayScore: $predictedAwayScore, predictedTotal: $predictedTotal, spread: $spread, weekName: $weekName, weekNumber: $weekNumber, matchDate: $matchDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictedMatchDtoImpl &&
            (identical(other.commonMatchId, commonMatchId) ||
                other.commonMatchId == commonMatchId) &&
            (identical(other.homeTeamName, homeTeamName) ||
                other.homeTeamName == homeTeamName) &&
            (identical(other.awayTeamName, awayTeamName) ||
                other.awayTeamName == awayTeamName) &&
            (identical(other.homeTeamAlias, homeTeamAlias) ||
                other.homeTeamAlias == homeTeamAlias) &&
            (identical(other.awayTeamAlias, awayTeamAlias) ||
                other.awayTeamAlias == awayTeamAlias) &&
            (identical(other.predictedScore, predictedScore) ||
                other.predictedScore == predictedScore) &&
            (identical(other.predictedHomeScore, predictedHomeScore) ||
                other.predictedHomeScore == predictedHomeScore) &&
            (identical(other.predictedAwayScore, predictedAwayScore) ||
                other.predictedAwayScore == predictedAwayScore) &&
            (identical(other.predictedTotal, predictedTotal) ||
                other.predictedTotal == predictedTotal) &&
            (identical(other.spread, spread) || other.spread == spread) &&
            (identical(other.weekName, weekName) ||
                other.weekName == weekName) &&
            (identical(other.weekNumber, weekNumber) ||
                other.weekNumber == weekNumber) &&
            (identical(other.matchDate, matchDate) ||
                other.matchDate == matchDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      commonMatchId,
      homeTeamName,
      awayTeamName,
      homeTeamAlias,
      awayTeamAlias,
      predictedScore,
      predictedHomeScore,
      predictedAwayScore,
      predictedTotal,
      spread,
      weekName,
      weekNumber,
      matchDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictedMatchDtoImplCopyWith<_$PredictedMatchDtoImpl> get copyWith =>
      __$$PredictedMatchDtoImplCopyWithImpl<_$PredictedMatchDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictedMatchDtoImplToJson(
      this,
    );
  }
}

abstract class _PredictedMatchDto implements PredictedMatchDto {
  const factory _PredictedMatchDto(
      {required final String commonMatchId,
      final String? homeTeamName,
      final String? awayTeamName,
      final String? homeTeamAlias,
      final String? awayTeamAlias,
      final double? predictedScore,
      final double? predictedHomeScore,
      final double? predictedAwayScore,
      final double? predictedTotal,
      final double? spread,
      final String? weekName,
      final int? weekNumber,
      @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
      final DateTime? matchDate}) = _$PredictedMatchDtoImpl;

  factory _PredictedMatchDto.fromJson(Map<String, dynamic> json) =
      _$PredictedMatchDtoImpl.fromJson;

  @override
  String get commonMatchId;
  @override
  String? get homeTeamName;
  @override
  String? get awayTeamName;
  @override
  String? get homeTeamAlias;
  @override
  String? get awayTeamAlias;
  @override
  double? get predictedScore;
  @override
  double? get predictedHomeScore;
  @override
  double? get predictedAwayScore;
  @override
  double? get predictedTotal;
  @override
  double? get spread;
  @override
  String? get weekName;
  @override
  int? get weekNumber;
  @override
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime? get matchDate;
  @override
  @JsonKey(ignore: true)
  _$$PredictedMatchDtoImplCopyWith<_$PredictedMatchDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
