// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerStatDtoImpl _$$PlayerStatDtoImplFromJson(Map<String, dynamic> json) =>
    _$PlayerStatDtoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      fullName: json['full_name'] as String? ?? '',
      team: json['team'] as String? ?? '',
      position: json['position'] as String? ?? '',
      gamePlayed: (json['game_played'] as num?)?.toInt() ?? 0,
      pointsPerGame: (json['points_per_game'] as num?)?.toDouble() ?? 0.0,
      reboundsPerGame: (json['rebounds_per_game'] as num?)?.toDouble() ?? 0.0,
      assistsPerGame: (json['assists_per_game'] as num?)?.toDouble() ?? 0.0,
      stealsPerGame: (json['steals_per_game'] as num?)?.toDouble(),
      picsId: json['pics_id'] as String?,
      twoPointsPerGame: (json['two_points_per_game'] as num?)?.toDouble(),
      threePointsPerGame: (json['three_points_per_game'] as num?)?.toDouble(),
      praPerGame: (json['pra_per_game'] as num?)?.toDouble(),
      pointsAssistsPerGame:
          (json['points_assists_per_game'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PlayerStatDtoImplToJson(_$PlayerStatDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'team': instance.team,
      'position': instance.position,
      'game_played': instance.gamePlayed,
      'points_per_game': instance.pointsPerGame,
      'rebounds_per_game': instance.reboundsPerGame,
      'assists_per_game': instance.assistsPerGame,
      'steals_per_game': instance.stealsPerGame,
      'pics_id': instance.picsId,
      'two_points_per_game': instance.twoPointsPerGame,
      'three_points_per_game': instance.threePointsPerGame,
      'pra_per_game': instance.praPerGame,
      'points_assists_per_game': instance.pointsAssistsPerGame,
    };
