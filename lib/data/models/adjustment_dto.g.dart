// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjustment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdjustmentDtoImpl _$$AdjustmentDtoImplFromJson(Map<String, dynamic> json) =>
    _$AdjustmentDtoImpl(
      id: (json['id'] as num).toInt(),
      team: json['team'] as String,
      teamAbbreviation: json['team_abbreviation'] as String?,
      pointsPerGame: (json['points_per_game'] as num).toDouble(),
      allowedPointsPerGame: (json['allowed_points_per_game'] as num).toDouble(),
      wins: (json['wins'] as num).toInt(),
      losses: (json['losses'] as num).toInt(),
      awayWinPct: (json['away_win_pct'] as num).toDouble(),
      homeWinPct: (json['home_win_pct'] as num).toDouble(),
      lastTenStreak: (json['last_5_strk'] as num).toDouble(),
      totalPct: (json['total_pct'] as num).toDouble(),
      awayOffEff: (json['away_off_eff'] as num?)?.toDouble(),
      homeOffEff: (json['home_off_eff'] as num?)?.toDouble(),
      awayDefEff: (json['away_def_eff'] as num?)?.toDouble(),
      homeDefEff: (json['home_def_eff'] as num?)?.toDouble(),
      awayTempo: (json['away_tempo'] as num?)?.toDouble(),
      homeTempo: (json['home_tempo'] as num?)?.toDouble(),
      awayEd: (json['away_ed'] as num?)?.toDouble(),
      homeEd: (json['home_ed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AdjustmentDtoImplToJson(_$AdjustmentDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'team': instance.team,
      'team_abbreviation': instance.teamAbbreviation,
      'points_per_game': instance.pointsPerGame,
      'allowed_points_per_game': instance.allowedPointsPerGame,
      'wins': instance.wins,
      'losses': instance.losses,
      'away_win_pct': instance.awayWinPct,
      'home_win_pct': instance.homeWinPct,
      'last_5_strk': instance.lastTenStreak,
      'total_pct': instance.totalPct,
      'away_off_eff': instance.awayOffEff,
      'home_off_eff': instance.homeOffEff,
      'away_def_eff': instance.awayDefEff,
      'home_def_eff': instance.homeDefEff,
      'away_tempo': instance.awayTempo,
      'home_tempo': instance.homeTempo,
      'away_ed': instance.awayEd,
      'home_ed': instance.homeEd,
    };
