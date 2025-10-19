// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultDtoImpl _$$ResultDtoImplFromJson(Map<String, dynamic> json) =>
    _$ResultDtoImpl(
      id: (json['id'] as num).toInt(),
      matchId: json['match_id'] as String,
      leagueId: json['league_id'] as String?,
      leagueName: json['league_name'] as String?,
      quarterCount: (json['quarter_count'] as num?)?.toInt() ?? 0,
      matchTime: json['match_time'] == null
          ? null
          : DateTime.parse(json['match_time'] as String),
      status: (json['status'] as num?)?.toInt() ?? 0,
      homeName: json['home_name'] as String?,
      awayName: json['away_name'] as String?,
      homeScore: (json['home_score'] as num?)?.toInt(),
      awayScore: (json['away_score'] as num?)?.toInt(),
      explain: json['explain'] as String?,
      neutral: json['neutral'] as bool? ?? false,
    );

Map<String, dynamic> _$$ResultDtoImplToJson(_$ResultDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'match_id': instance.matchId,
      'league_id': instance.leagueId,
      'league_name': instance.leagueName,
      'quarter_count': instance.quarterCount,
      'match_time': instance.matchTime?.toIso8601String(),
      'status': instance.status,
      'home_name': instance.homeName,
      'away_name': instance.awayName,
      'home_score': instance.homeScore,
      'away_score': instance.awayScore,
      'explain': instance.explain,
      'neutral': instance.neutral,
    };
