// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResultDto _$ResultDtoFromJson(Map<String, dynamic> json) {
  return _ResultDto.fromJson(json);
}

/// @nodoc
mixin _$ResultDto {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_id')
  String get matchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'league_id')
  String? get leagueId => throw _privateConstructorUsedError;
  @JsonKey(name: 'league_name')
  String? get leagueName => throw _privateConstructorUsedError;
  @JsonKey(name: 'quarter_count')
  int get quarterCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_time')
  DateTime? get matchTime => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_name')
  String? get homeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_name')
  String? get awayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_score')
  int? get homeScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_score')
  int? get awayScore => throw _privateConstructorUsedError;
  String? get explain => throw _privateConstructorUsedError;
  bool get neutral => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultDtoCopyWith<ResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDtoCopyWith<$Res> {
  factory $ResultDtoCopyWith(ResultDto value, $Res Function(ResultDto) then) =
      _$ResultDtoCopyWithImpl<$Res, ResultDto>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'match_id') String matchId,
      @JsonKey(name: 'league_id') String? leagueId,
      @JsonKey(name: 'league_name') String? leagueName,
      @JsonKey(name: 'quarter_count') int quarterCount,
      @JsonKey(name: 'match_time') DateTime? matchTime,
      int status,
      @JsonKey(name: 'home_name') String? homeName,
      @JsonKey(name: 'away_name') String? awayName,
      @JsonKey(name: 'home_score') int? homeScore,
      @JsonKey(name: 'away_score') int? awayScore,
      String? explain,
      bool neutral});
}

/// @nodoc
class _$ResultDtoCopyWithImpl<$Res, $Val extends ResultDto>
    implements $ResultDtoCopyWith<$Res> {
  _$ResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? leagueId = freezed,
    Object? leagueName = freezed,
    Object? quarterCount = null,
    Object? matchTime = freezed,
    Object? status = null,
    Object? homeName = freezed,
    Object? awayName = freezed,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? explain = freezed,
    Object? neutral = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      leagueId: freezed == leagueId
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as String?,
      leagueName: freezed == leagueName
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as String?,
      quarterCount: null == quarterCount
          ? _value.quarterCount
          : quarterCount // ignore: cast_nullable_to_non_nullable
              as int,
      matchTime: freezed == matchTime
          ? _value.matchTime
          : matchTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      homeName: freezed == homeName
          ? _value.homeName
          : homeName // ignore: cast_nullable_to_non_nullable
              as String?,
      awayName: freezed == awayName
          ? _value.awayName
          : awayName // ignore: cast_nullable_to_non_nullable
              as String?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      explain: freezed == explain
          ? _value.explain
          : explain // ignore: cast_nullable_to_non_nullable
              as String?,
      neutral: null == neutral
          ? _value.neutral
          : neutral // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultDtoImplCopyWith<$Res>
    implements $ResultDtoCopyWith<$Res> {
  factory _$$ResultDtoImplCopyWith(
          _$ResultDtoImpl value, $Res Function(_$ResultDtoImpl) then) =
      __$$ResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'match_id') String matchId,
      @JsonKey(name: 'league_id') String? leagueId,
      @JsonKey(name: 'league_name') String? leagueName,
      @JsonKey(name: 'quarter_count') int quarterCount,
      @JsonKey(name: 'match_time') DateTime? matchTime,
      int status,
      @JsonKey(name: 'home_name') String? homeName,
      @JsonKey(name: 'away_name') String? awayName,
      @JsonKey(name: 'home_score') int? homeScore,
      @JsonKey(name: 'away_score') int? awayScore,
      String? explain,
      bool neutral});
}

/// @nodoc
class __$$ResultDtoImplCopyWithImpl<$Res>
    extends _$ResultDtoCopyWithImpl<$Res, _$ResultDtoImpl>
    implements _$$ResultDtoImplCopyWith<$Res> {
  __$$ResultDtoImplCopyWithImpl(
      _$ResultDtoImpl _value, $Res Function(_$ResultDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? leagueId = freezed,
    Object? leagueName = freezed,
    Object? quarterCount = null,
    Object? matchTime = freezed,
    Object? status = null,
    Object? homeName = freezed,
    Object? awayName = freezed,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? explain = freezed,
    Object? neutral = null,
  }) {
    return _then(_$ResultDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      leagueId: freezed == leagueId
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as String?,
      leagueName: freezed == leagueName
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as String?,
      quarterCount: null == quarterCount
          ? _value.quarterCount
          : quarterCount // ignore: cast_nullable_to_non_nullable
              as int,
      matchTime: freezed == matchTime
          ? _value.matchTime
          : matchTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      homeName: freezed == homeName
          ? _value.homeName
          : homeName // ignore: cast_nullable_to_non_nullable
              as String?,
      awayName: freezed == awayName
          ? _value.awayName
          : awayName // ignore: cast_nullable_to_non_nullable
              as String?,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      explain: freezed == explain
          ? _value.explain
          : explain // ignore: cast_nullable_to_non_nullable
              as String?,
      neutral: null == neutral
          ? _value.neutral
          : neutral // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDtoImpl implements _ResultDto {
  const _$ResultDtoImpl(
      {required this.id,
      @JsonKey(name: 'match_id') required this.matchId,
      @JsonKey(name: 'league_id') this.leagueId,
      @JsonKey(name: 'league_name') this.leagueName,
      @JsonKey(name: 'quarter_count') this.quarterCount = 0,
      @JsonKey(name: 'match_time') this.matchTime,
      this.status = 0,
      @JsonKey(name: 'home_name') this.homeName,
      @JsonKey(name: 'away_name') this.awayName,
      @JsonKey(name: 'home_score') this.homeScore,
      @JsonKey(name: 'away_score') this.awayScore,
      this.explain,
      this.neutral = false});

  factory _$ResultDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDtoImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'match_id')
  final String matchId;
  @override
  @JsonKey(name: 'league_id')
  final String? leagueId;
  @override
  @JsonKey(name: 'league_name')
  final String? leagueName;
  @override
  @JsonKey(name: 'quarter_count')
  final int quarterCount;
  @override
  @JsonKey(name: 'match_time')
  final DateTime? matchTime;
  @override
  @JsonKey()
  final int status;
  @override
  @JsonKey(name: 'home_name')
  final String? homeName;
  @override
  @JsonKey(name: 'away_name')
  final String? awayName;
  @override
  @JsonKey(name: 'home_score')
  final int? homeScore;
  @override
  @JsonKey(name: 'away_score')
  final int? awayScore;
  @override
  final String? explain;
  @override
  @JsonKey()
  final bool neutral;

  @override
  String toString() {
    return 'ResultDto(id: $id, matchId: $matchId, leagueId: $leagueId, leagueName: $leagueName, quarterCount: $quarterCount, matchTime: $matchTime, status: $status, homeName: $homeName, awayName: $awayName, homeScore: $homeScore, awayScore: $awayScore, explain: $explain, neutral: $neutral)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.leagueId, leagueId) ||
                other.leagueId == leagueId) &&
            (identical(other.leagueName, leagueName) ||
                other.leagueName == leagueName) &&
            (identical(other.quarterCount, quarterCount) ||
                other.quarterCount == quarterCount) &&
            (identical(other.matchTime, matchTime) ||
                other.matchTime == matchTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.homeName, homeName) ||
                other.homeName == homeName) &&
            (identical(other.awayName, awayName) ||
                other.awayName == awayName) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.explain, explain) || other.explain == explain) &&
            (identical(other.neutral, neutral) || other.neutral == neutral));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      matchId,
      leagueId,
      leagueName,
      quarterCount,
      matchTime,
      status,
      homeName,
      awayName,
      homeScore,
      awayScore,
      explain,
      neutral);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDtoImplCopyWith<_$ResultDtoImpl> get copyWith =>
      __$$ResultDtoImplCopyWithImpl<_$ResultDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDtoImplToJson(
      this,
    );
  }
}

abstract class _ResultDto implements ResultDto {
  const factory _ResultDto(
      {required final int id,
      @JsonKey(name: 'match_id') required final String matchId,
      @JsonKey(name: 'league_id') final String? leagueId,
      @JsonKey(name: 'league_name') final String? leagueName,
      @JsonKey(name: 'quarter_count') final int quarterCount,
      @JsonKey(name: 'match_time') final DateTime? matchTime,
      final int status,
      @JsonKey(name: 'home_name') final String? homeName,
      @JsonKey(name: 'away_name') final String? awayName,
      @JsonKey(name: 'home_score') final int? homeScore,
      @JsonKey(name: 'away_score') final int? awayScore,
      final String? explain,
      final bool neutral}) = _$ResultDtoImpl;

  factory _ResultDto.fromJson(Map<String, dynamic> json) =
      _$ResultDtoImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'match_id')
  String get matchId;
  @override
  @JsonKey(name: 'league_id')
  String? get leagueId;
  @override
  @JsonKey(name: 'league_name')
  String? get leagueName;
  @override
  @JsonKey(name: 'quarter_count')
  int get quarterCount;
  @override
  @JsonKey(name: 'match_time')
  DateTime? get matchTime;
  @override
  int get status;
  @override
  @JsonKey(name: 'home_name')
  String? get homeName;
  @override
  @JsonKey(name: 'away_name')
  String? get awayName;
  @override
  @JsonKey(name: 'home_score')
  int? get homeScore;
  @override
  @JsonKey(name: 'away_score')
  int? get awayScore;
  @override
  String? get explain;
  @override
  bool get neutral;
  @override
  @JsonKey(ignore: true)
  _$$ResultDtoImplCopyWith<_$ResultDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
