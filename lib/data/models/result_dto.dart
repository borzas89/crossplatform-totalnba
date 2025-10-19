import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_dto.freezed.dart';
part 'result_dto.g.dart';

/// DTO for historical match results
@freezed
class ResultDto with _$ResultDto {
  const factory ResultDto({
    required int id,
    @JsonKey(name: 'match_id') required String matchId,
    @JsonKey(name: 'league_id') String? leagueId,
    @JsonKey(name: 'league_name') String? leagueName,
    @JsonKey(name: 'quarter_count') @Default(0) int quarterCount,
    @JsonKey(name: 'match_time') DateTime? matchTime,
    @Default(0) int status,
    @JsonKey(name: 'home_name') String? homeName,
    @JsonKey(name: 'away_name') String? awayName,
    @JsonKey(name: 'home_score') int? homeScore,
    @JsonKey(name: 'away_score') int? awayScore,
    String? explain,
    @Default(false) bool neutral,
  }) = _ResultDto;

  factory ResultDto.fromJson(Map<String, dynamic> json) =>
      _$ResultDtoFromJson(json);
}
