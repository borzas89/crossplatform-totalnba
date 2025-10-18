import 'package:freezed_annotation/freezed_annotation.dart';

part 'nba_player_dto.freezed.dart';
part 'nba_player_dto.g.dart';

/// Data transfer object for NBA player search results
/// Matches the backend API response structure
@freezed
class NbaPlayerDto with _$NbaPlayerDto {
  const factory NbaPlayerDto({
    required int id,
    required int personId,
    required String fullName,
    required String firstName,
    required String lastName,
    String? teamAbbreviation,
    String? position,
    @Default(0) int rosterStatus,
  }) = _NbaPlayerDto;

  factory NbaPlayerDto.fromJson(Map<String, dynamic> json) =>
      _$NbaPlayerDtoFromJson(json);
}
