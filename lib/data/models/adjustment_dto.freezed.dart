// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adjustment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdjustmentDto _$AdjustmentDtoFromJson(Map<String, dynamic> json) {
  return _AdjustmentDto.fromJson(json);
}

/// @nodoc
mixin _$AdjustmentDto {
  int get id => throw _privateConstructorUsedError;
  String get team => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_abbreviation')
  String? get teamAbbreviation => throw _privateConstructorUsedError;
  @JsonKey(name: 'points_per_game')
  double get pointsPerGame => throw _privateConstructorUsedError;
  @JsonKey(name: 'allowed_points_per_game')
  double get allowedPointsPerGame => throw _privateConstructorUsedError;
  int get wins => throw _privateConstructorUsedError;
  int get losses => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_win_pct')
  double get awayWinPct => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_win_pct')
  double get homeWinPct => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_5_strk')
  double get lastTenStreak => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pct')
  double get totalPct =>
      throw _privateConstructorUsedError; // Additional efficiency metrics
  @JsonKey(name: 'away_off_eff')
  double? get awayOffEff => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_off_eff')
  double? get homeOffEff => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_def_eff')
  double? get awayDefEff => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_def_eff')
  double? get homeDefEff => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_tempo')
  double? get awayTempo => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_tempo')
  double? get homeTempo => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_ed')
  double? get awayEd => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_ed')
  double? get homeEd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdjustmentDtoCopyWith<AdjustmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdjustmentDtoCopyWith<$Res> {
  factory $AdjustmentDtoCopyWith(
          AdjustmentDto value, $Res Function(AdjustmentDto) then) =
      _$AdjustmentDtoCopyWithImpl<$Res, AdjustmentDto>;
  @useResult
  $Res call(
      {int id,
      String team,
      @JsonKey(name: 'team_abbreviation') String? teamAbbreviation,
      @JsonKey(name: 'points_per_game') double pointsPerGame,
      @JsonKey(name: 'allowed_points_per_game') double allowedPointsPerGame,
      int wins,
      int losses,
      @JsonKey(name: 'away_win_pct') double awayWinPct,
      @JsonKey(name: 'home_win_pct') double homeWinPct,
      @JsonKey(name: 'last_5_strk') double lastTenStreak,
      @JsonKey(name: 'total_pct') double totalPct,
      @JsonKey(name: 'away_off_eff') double? awayOffEff,
      @JsonKey(name: 'home_off_eff') double? homeOffEff,
      @JsonKey(name: 'away_def_eff') double? awayDefEff,
      @JsonKey(name: 'home_def_eff') double? homeDefEff,
      @JsonKey(name: 'away_tempo') double? awayTempo,
      @JsonKey(name: 'home_tempo') double? homeTempo,
      @JsonKey(name: 'away_ed') double? awayEd,
      @JsonKey(name: 'home_ed') double? homeEd});
}

/// @nodoc
class _$AdjustmentDtoCopyWithImpl<$Res, $Val extends AdjustmentDto>
    implements $AdjustmentDtoCopyWith<$Res> {
  _$AdjustmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? team = null,
    Object? teamAbbreviation = freezed,
    Object? pointsPerGame = null,
    Object? allowedPointsPerGame = null,
    Object? wins = null,
    Object? losses = null,
    Object? awayWinPct = null,
    Object? homeWinPct = null,
    Object? lastTenStreak = null,
    Object? totalPct = null,
    Object? awayOffEff = freezed,
    Object? homeOffEff = freezed,
    Object? awayDefEff = freezed,
    Object? homeDefEff = freezed,
    Object? awayTempo = freezed,
    Object? homeTempo = freezed,
    Object? awayEd = freezed,
    Object? homeEd = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as String,
      teamAbbreviation: freezed == teamAbbreviation
          ? _value.teamAbbreviation
          : teamAbbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsPerGame: null == pointsPerGame
          ? _value.pointsPerGame
          : pointsPerGame // ignore: cast_nullable_to_non_nullable
              as double,
      allowedPointsPerGame: null == allowedPointsPerGame
          ? _value.allowedPointsPerGame
          : allowedPointsPerGame // ignore: cast_nullable_to_non_nullable
              as double,
      wins: null == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
      losses: null == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int,
      awayWinPct: null == awayWinPct
          ? _value.awayWinPct
          : awayWinPct // ignore: cast_nullable_to_non_nullable
              as double,
      homeWinPct: null == homeWinPct
          ? _value.homeWinPct
          : homeWinPct // ignore: cast_nullable_to_non_nullable
              as double,
      lastTenStreak: null == lastTenStreak
          ? _value.lastTenStreak
          : lastTenStreak // ignore: cast_nullable_to_non_nullable
              as double,
      totalPct: null == totalPct
          ? _value.totalPct
          : totalPct // ignore: cast_nullable_to_non_nullable
              as double,
      awayOffEff: freezed == awayOffEff
          ? _value.awayOffEff
          : awayOffEff // ignore: cast_nullable_to_non_nullable
              as double?,
      homeOffEff: freezed == homeOffEff
          ? _value.homeOffEff
          : homeOffEff // ignore: cast_nullable_to_non_nullable
              as double?,
      awayDefEff: freezed == awayDefEff
          ? _value.awayDefEff
          : awayDefEff // ignore: cast_nullable_to_non_nullable
              as double?,
      homeDefEff: freezed == homeDefEff
          ? _value.homeDefEff
          : homeDefEff // ignore: cast_nullable_to_non_nullable
              as double?,
      awayTempo: freezed == awayTempo
          ? _value.awayTempo
          : awayTempo // ignore: cast_nullable_to_non_nullable
              as double?,
      homeTempo: freezed == homeTempo
          ? _value.homeTempo
          : homeTempo // ignore: cast_nullable_to_non_nullable
              as double?,
      awayEd: freezed == awayEd
          ? _value.awayEd
          : awayEd // ignore: cast_nullable_to_non_nullable
              as double?,
      homeEd: freezed == homeEd
          ? _value.homeEd
          : homeEd // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdjustmentDtoImplCopyWith<$Res>
    implements $AdjustmentDtoCopyWith<$Res> {
  factory _$$AdjustmentDtoImplCopyWith(
          _$AdjustmentDtoImpl value, $Res Function(_$AdjustmentDtoImpl) then) =
      __$$AdjustmentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String team,
      @JsonKey(name: 'team_abbreviation') String? teamAbbreviation,
      @JsonKey(name: 'points_per_game') double pointsPerGame,
      @JsonKey(name: 'allowed_points_per_game') double allowedPointsPerGame,
      int wins,
      int losses,
      @JsonKey(name: 'away_win_pct') double awayWinPct,
      @JsonKey(name: 'home_win_pct') double homeWinPct,
      @JsonKey(name: 'last_5_strk') double lastTenStreak,
      @JsonKey(name: 'total_pct') double totalPct,
      @JsonKey(name: 'away_off_eff') double? awayOffEff,
      @JsonKey(name: 'home_off_eff') double? homeOffEff,
      @JsonKey(name: 'away_def_eff') double? awayDefEff,
      @JsonKey(name: 'home_def_eff') double? homeDefEff,
      @JsonKey(name: 'away_tempo') double? awayTempo,
      @JsonKey(name: 'home_tempo') double? homeTempo,
      @JsonKey(name: 'away_ed') double? awayEd,
      @JsonKey(name: 'home_ed') double? homeEd});
}

/// @nodoc
class __$$AdjustmentDtoImplCopyWithImpl<$Res>
    extends _$AdjustmentDtoCopyWithImpl<$Res, _$AdjustmentDtoImpl>
    implements _$$AdjustmentDtoImplCopyWith<$Res> {
  __$$AdjustmentDtoImplCopyWithImpl(
      _$AdjustmentDtoImpl _value, $Res Function(_$AdjustmentDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? team = null,
    Object? teamAbbreviation = freezed,
    Object? pointsPerGame = null,
    Object? allowedPointsPerGame = null,
    Object? wins = null,
    Object? losses = null,
    Object? awayWinPct = null,
    Object? homeWinPct = null,
    Object? lastTenStreak = null,
    Object? totalPct = null,
    Object? awayOffEff = freezed,
    Object? homeOffEff = freezed,
    Object? awayDefEff = freezed,
    Object? homeDefEff = freezed,
    Object? awayTempo = freezed,
    Object? homeTempo = freezed,
    Object? awayEd = freezed,
    Object? homeEd = freezed,
  }) {
    return _then(_$AdjustmentDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as String,
      teamAbbreviation: freezed == teamAbbreviation
          ? _value.teamAbbreviation
          : teamAbbreviation // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsPerGame: null == pointsPerGame
          ? _value.pointsPerGame
          : pointsPerGame // ignore: cast_nullable_to_non_nullable
              as double,
      allowedPointsPerGame: null == allowedPointsPerGame
          ? _value.allowedPointsPerGame
          : allowedPointsPerGame // ignore: cast_nullable_to_non_nullable
              as double,
      wins: null == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
      losses: null == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int,
      awayWinPct: null == awayWinPct
          ? _value.awayWinPct
          : awayWinPct // ignore: cast_nullable_to_non_nullable
              as double,
      homeWinPct: null == homeWinPct
          ? _value.homeWinPct
          : homeWinPct // ignore: cast_nullable_to_non_nullable
              as double,
      lastTenStreak: null == lastTenStreak
          ? _value.lastTenStreak
          : lastTenStreak // ignore: cast_nullable_to_non_nullable
              as double,
      totalPct: null == totalPct
          ? _value.totalPct
          : totalPct // ignore: cast_nullable_to_non_nullable
              as double,
      awayOffEff: freezed == awayOffEff
          ? _value.awayOffEff
          : awayOffEff // ignore: cast_nullable_to_non_nullable
              as double?,
      homeOffEff: freezed == homeOffEff
          ? _value.homeOffEff
          : homeOffEff // ignore: cast_nullable_to_non_nullable
              as double?,
      awayDefEff: freezed == awayDefEff
          ? _value.awayDefEff
          : awayDefEff // ignore: cast_nullable_to_non_nullable
              as double?,
      homeDefEff: freezed == homeDefEff
          ? _value.homeDefEff
          : homeDefEff // ignore: cast_nullable_to_non_nullable
              as double?,
      awayTempo: freezed == awayTempo
          ? _value.awayTempo
          : awayTempo // ignore: cast_nullable_to_non_nullable
              as double?,
      homeTempo: freezed == homeTempo
          ? _value.homeTempo
          : homeTempo // ignore: cast_nullable_to_non_nullable
              as double?,
      awayEd: freezed == awayEd
          ? _value.awayEd
          : awayEd // ignore: cast_nullable_to_non_nullable
              as double?,
      homeEd: freezed == homeEd
          ? _value.homeEd
          : homeEd // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdjustmentDtoImpl implements _AdjustmentDto {
  const _$AdjustmentDtoImpl(
      {required this.id,
      required this.team,
      @JsonKey(name: 'team_abbreviation') this.teamAbbreviation,
      @JsonKey(name: 'points_per_game') required this.pointsPerGame,
      @JsonKey(name: 'allowed_points_per_game')
      required this.allowedPointsPerGame,
      required this.wins,
      required this.losses,
      @JsonKey(name: 'away_win_pct') required this.awayWinPct,
      @JsonKey(name: 'home_win_pct') required this.homeWinPct,
      @JsonKey(name: 'last_5_strk') required this.lastTenStreak,
      @JsonKey(name: 'total_pct') required this.totalPct,
      @JsonKey(name: 'away_off_eff') this.awayOffEff,
      @JsonKey(name: 'home_off_eff') this.homeOffEff,
      @JsonKey(name: 'away_def_eff') this.awayDefEff,
      @JsonKey(name: 'home_def_eff') this.homeDefEff,
      @JsonKey(name: 'away_tempo') this.awayTempo,
      @JsonKey(name: 'home_tempo') this.homeTempo,
      @JsonKey(name: 'away_ed') this.awayEd,
      @JsonKey(name: 'home_ed') this.homeEd});

  factory _$AdjustmentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdjustmentDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String team;
  @override
  @JsonKey(name: 'team_abbreviation')
  final String? teamAbbreviation;
  @override
  @JsonKey(name: 'points_per_game')
  final double pointsPerGame;
  @override
  @JsonKey(name: 'allowed_points_per_game')
  final double allowedPointsPerGame;
  @override
  final int wins;
  @override
  final int losses;
  @override
  @JsonKey(name: 'away_win_pct')
  final double awayWinPct;
  @override
  @JsonKey(name: 'home_win_pct')
  final double homeWinPct;
  @override
  @JsonKey(name: 'last_5_strk')
  final double lastTenStreak;
  @override
  @JsonKey(name: 'total_pct')
  final double totalPct;
// Additional efficiency metrics
  @override
  @JsonKey(name: 'away_off_eff')
  final double? awayOffEff;
  @override
  @JsonKey(name: 'home_off_eff')
  final double? homeOffEff;
  @override
  @JsonKey(name: 'away_def_eff')
  final double? awayDefEff;
  @override
  @JsonKey(name: 'home_def_eff')
  final double? homeDefEff;
  @override
  @JsonKey(name: 'away_tempo')
  final double? awayTempo;
  @override
  @JsonKey(name: 'home_tempo')
  final double? homeTempo;
  @override
  @JsonKey(name: 'away_ed')
  final double? awayEd;
  @override
  @JsonKey(name: 'home_ed')
  final double? homeEd;

  @override
  String toString() {
    return 'AdjustmentDto(id: $id, team: $team, teamAbbreviation: $teamAbbreviation, pointsPerGame: $pointsPerGame, allowedPointsPerGame: $allowedPointsPerGame, wins: $wins, losses: $losses, awayWinPct: $awayWinPct, homeWinPct: $homeWinPct, lastTenStreak: $lastTenStreak, totalPct: $totalPct, awayOffEff: $awayOffEff, homeOffEff: $homeOffEff, awayDefEff: $awayDefEff, homeDefEff: $homeDefEff, awayTempo: $awayTempo, homeTempo: $homeTempo, awayEd: $awayEd, homeEd: $homeEd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdjustmentDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.teamAbbreviation, teamAbbreviation) ||
                other.teamAbbreviation == teamAbbreviation) &&
            (identical(other.pointsPerGame, pointsPerGame) ||
                other.pointsPerGame == pointsPerGame) &&
            (identical(other.allowedPointsPerGame, allowedPointsPerGame) ||
                other.allowedPointsPerGame == allowedPointsPerGame) &&
            (identical(other.wins, wins) || other.wins == wins) &&
            (identical(other.losses, losses) || other.losses == losses) &&
            (identical(other.awayWinPct, awayWinPct) ||
                other.awayWinPct == awayWinPct) &&
            (identical(other.homeWinPct, homeWinPct) ||
                other.homeWinPct == homeWinPct) &&
            (identical(other.lastTenStreak, lastTenStreak) ||
                other.lastTenStreak == lastTenStreak) &&
            (identical(other.totalPct, totalPct) ||
                other.totalPct == totalPct) &&
            (identical(other.awayOffEff, awayOffEff) ||
                other.awayOffEff == awayOffEff) &&
            (identical(other.homeOffEff, homeOffEff) ||
                other.homeOffEff == homeOffEff) &&
            (identical(other.awayDefEff, awayDefEff) ||
                other.awayDefEff == awayDefEff) &&
            (identical(other.homeDefEff, homeDefEff) ||
                other.homeDefEff == homeDefEff) &&
            (identical(other.awayTempo, awayTempo) ||
                other.awayTempo == awayTempo) &&
            (identical(other.homeTempo, homeTempo) ||
                other.homeTempo == homeTempo) &&
            (identical(other.awayEd, awayEd) || other.awayEd == awayEd) &&
            (identical(other.homeEd, homeEd) || other.homeEd == homeEd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        team,
        teamAbbreviation,
        pointsPerGame,
        allowedPointsPerGame,
        wins,
        losses,
        awayWinPct,
        homeWinPct,
        lastTenStreak,
        totalPct,
        awayOffEff,
        homeOffEff,
        awayDefEff,
        homeDefEff,
        awayTempo,
        homeTempo,
        awayEd,
        homeEd
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdjustmentDtoImplCopyWith<_$AdjustmentDtoImpl> get copyWith =>
      __$$AdjustmentDtoImplCopyWithImpl<_$AdjustmentDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdjustmentDtoImplToJson(
      this,
    );
  }
}

abstract class _AdjustmentDto implements AdjustmentDto {
  const factory _AdjustmentDto(
      {required final int id,
      required final String team,
      @JsonKey(name: 'team_abbreviation') final String? teamAbbreviation,
      @JsonKey(name: 'points_per_game') required final double pointsPerGame,
      @JsonKey(name: 'allowed_points_per_game')
      required final double allowedPointsPerGame,
      required final int wins,
      required final int losses,
      @JsonKey(name: 'away_win_pct') required final double awayWinPct,
      @JsonKey(name: 'home_win_pct') required final double homeWinPct,
      @JsonKey(name: 'last_5_strk') required final double lastTenStreak,
      @JsonKey(name: 'total_pct') required final double totalPct,
      @JsonKey(name: 'away_off_eff') final double? awayOffEff,
      @JsonKey(name: 'home_off_eff') final double? homeOffEff,
      @JsonKey(name: 'away_def_eff') final double? awayDefEff,
      @JsonKey(name: 'home_def_eff') final double? homeDefEff,
      @JsonKey(name: 'away_tempo') final double? awayTempo,
      @JsonKey(name: 'home_tempo') final double? homeTempo,
      @JsonKey(name: 'away_ed') final double? awayEd,
      @JsonKey(name: 'home_ed') final double? homeEd}) = _$AdjustmentDtoImpl;

  factory _AdjustmentDto.fromJson(Map<String, dynamic> json) =
      _$AdjustmentDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get team;
  @override
  @JsonKey(name: 'team_abbreviation')
  String? get teamAbbreviation;
  @override
  @JsonKey(name: 'points_per_game')
  double get pointsPerGame;
  @override
  @JsonKey(name: 'allowed_points_per_game')
  double get allowedPointsPerGame;
  @override
  int get wins;
  @override
  int get losses;
  @override
  @JsonKey(name: 'away_win_pct')
  double get awayWinPct;
  @override
  @JsonKey(name: 'home_win_pct')
  double get homeWinPct;
  @override
  @JsonKey(name: 'last_5_strk')
  double get lastTenStreak;
  @override
  @JsonKey(name: 'total_pct')
  double get totalPct;
  @override // Additional efficiency metrics
  @JsonKey(name: 'away_off_eff')
  double? get awayOffEff;
  @override
  @JsonKey(name: 'home_off_eff')
  double? get homeOffEff;
  @override
  @JsonKey(name: 'away_def_eff')
  double? get awayDefEff;
  @override
  @JsonKey(name: 'home_def_eff')
  double? get homeDefEff;
  @override
  @JsonKey(name: 'away_tempo')
  double? get awayTempo;
  @override
  @JsonKey(name: 'home_tempo')
  double? get homeTempo;
  @override
  @JsonKey(name: 'away_ed')
  double? get awayEd;
  @override
  @JsonKey(name: 'home_ed')
  double? get homeEd;
  @override
  @JsonKey(ignore: true)
  _$$AdjustmentDtoImplCopyWith<_$AdjustmentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
