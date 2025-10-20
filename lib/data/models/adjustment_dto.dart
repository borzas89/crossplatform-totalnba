import 'package:freezed_annotation/freezed_annotation.dart';

part 'adjustment_dto.freezed.dart';
part 'adjustment_dto.g.dart';

/// Data transfer object for team adjustment data
/// Contains team statistics used for win probability calculations
@freezed
class AdjustmentDto with _$AdjustmentDto {
  const factory AdjustmentDto({
    required int id,
    required String team,
    @JsonKey(name: 'team_abbreviation') String? teamAbbreviation,
    @JsonKey(name: 'points_per_game') required double pointsPerGame,
    @JsonKey(name: 'allowed_points_per_game') required double allowedPointsPerGame,
    required int wins,
    required int losses,
    @JsonKey(name: 'away_win_pct') required double awayWinPct,
    @JsonKey(name: 'home_win_pct') required double homeWinPct,
    @JsonKey(name: 'last_5_strk') required double lastTenStreak,
    @JsonKey(name: 'total_pct') required double totalPct,
    // Additional efficiency metrics
    @JsonKey(name: 'away_off_eff') double? awayOffEff,
    @JsonKey(name: 'home_off_eff') double? homeOffEff,
    @JsonKey(name: 'away_def_eff') double? awayDefEff,
    @JsonKey(name: 'home_def_eff') double? homeDefEff,
    @JsonKey(name: 'away_tempo') double? awayTempo,
    @JsonKey(name: 'home_tempo') double? homeTempo,
    @JsonKey(name: 'away_ed') double? awayEd,
    @JsonKey(name: 'home_ed') double? homeEd,
  }) = _AdjustmentDto;

  factory AdjustmentDto.fromJson(Map<String, dynamic> json) =>
      _$AdjustmentDtoFromJson(json);
}
