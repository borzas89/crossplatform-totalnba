// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nba_player_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NbaPlayerDtoImpl _$$NbaPlayerDtoImplFromJson(Map<String, dynamic> json) =>
    _$NbaPlayerDtoImpl(
      id: (json['id'] as num).toInt(),
      personId: (json['personId'] as num).toInt(),
      fullName: json['fullName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      teamAbbreviation: json['teamAbbreviation'] as String?,
      position: json['position'] as String?,
      rosterStatus: (json['rosterStatus'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$NbaPlayerDtoImplToJson(_$NbaPlayerDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'personId': instance.personId,
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'teamAbbreviation': instance.teamAbbreviation,
      'position': instance.position,
      'rosterStatus': instance.rosterStatus,
    };
