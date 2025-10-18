// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predicted_match_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictedMatchDtoImpl _$$PredictedMatchDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictedMatchDtoImpl(
      commonMatchId: json['commonMatchId'] as String,
      homeTeamName: json['homeTeamName'] as String?,
      awayTeamName: json['awayTeamName'] as String?,
      homeTeamAlias: json['homeTeamAlias'] as String?,
      awayTeamAlias: json['awayTeamAlias'] as String?,
      predictedScore: (json['predictedScore'] as num?)?.toDouble(),
      predictedHomeScore: (json['predictedHomeScore'] as num?)?.toDouble(),
      predictedAwayScore: (json['predictedAwayScore'] as num?)?.toDouble(),
      predictedTotal: (json['predictedTotal'] as num?)?.toDouble(),
      spread: (json['spread'] as num?)?.toDouble(),
      weekName: json['weekName'] as String?,
      weekNumber: (json['weekNumber'] as num?)?.toInt(),
      matchDate: _dateTimeFromJson((json['matchDate'] as num?)?.toInt()),
    );

Map<String, dynamic> _$$PredictedMatchDtoImplToJson(
        _$PredictedMatchDtoImpl instance) =>
    <String, dynamic>{
      'commonMatchId': instance.commonMatchId,
      'homeTeamName': instance.homeTeamName,
      'awayTeamName': instance.awayTeamName,
      'homeTeamAlias': instance.homeTeamAlias,
      'awayTeamAlias': instance.awayTeamAlias,
      'predictedScore': instance.predictedScore,
      'predictedHomeScore': instance.predictedHomeScore,
      'predictedAwayScore': instance.predictedAwayScore,
      'predictedTotal': instance.predictedTotal,
      'spread': instance.spread,
      'weekName': instance.weekName,
      'weekNumber': instance.weekNumber,
      'matchDate': _dateTimeToJson(instance.matchDate),
    };
