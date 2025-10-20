// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OverallDtoImpl _$$OverallDtoImplFromJson(Map<String, dynamic> json) =>
    _$OverallDtoImpl(
      teamName: json['teamName'] as String,
      overall: (json['overall'] as num).toDouble(),
      awayOverall: (json['awayOverall'] as num).toDouble(),
      homeOverall: (json['homeOverall'] as num).toDouble(),
      teamAvg: (json['teamAvg'] as num).toDouble(),
      teamHomeAvg: (json['teamHomeAvg'] as num).toDouble(),
      teamAwayAvg: (json['teamAwayAvg'] as num).toDouble(),
    );

Map<String, dynamic> _$$OverallDtoImplToJson(_$OverallDtoImpl instance) =>
    <String, dynamic>{
      'teamName': instance.teamName,
      'overall': instance.overall,
      'awayOverall': instance.awayOverall,
      'homeOverall': instance.homeOverall,
      'teamAvg': instance.teamAvg,
      'teamHomeAvg': instance.teamHomeAvg,
      'teamAwayAvg': instance.teamAwayAvg,
    };
