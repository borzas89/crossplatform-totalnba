import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_stat_dto.freezed.dart';
part 'player_stat_dto.g.dart';

/// Data transfer object for player statistics
/// Matches the backend API response structure
@freezed
class PlayerStatDto with _$PlayerStatDto {
  const factory PlayerStatDto({
    @Default(0) int id,
    @JsonKey(name: 'full_name') @Default('') String fullName,
    @Default('') String team,
    @Default('') String position,
    @JsonKey(name: 'game_played') @Default(0) int gamePlayed,
    @JsonKey(name: 'points_per_game') @Default(0.0) double pointsPerGame,
    @JsonKey(name: 'rebounds_per_game') @Default(0.0) double reboundsPerGame,
    @JsonKey(name: 'assists_per_game') @Default(0.0) double assistsPerGame,
    @JsonKey(name: 'steals_per_game') double? stealsPerGame,
    @JsonKey(name: 'pics_id') String? picsId,
    @JsonKey(name: 'two_points_per_game') double? twoPointsPerGame,
    @JsonKey(name: 'three_points_per_game') double? threePointsPerGame,
    @JsonKey(name: 'pra_per_game') double? praPerGame,
    @JsonKey(name: 'points_assists_per_game') double? pointsAssistsPerGame,
  }) = _PlayerStatDto;

  factory PlayerStatDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatDtoFromJson(json);
}
