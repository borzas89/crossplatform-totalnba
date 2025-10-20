import 'package:freezed_annotation/freezed_annotation.dart';

part 'overall_dto.freezed.dart';
part 'overall_dto.g.dart';

/// Data transfer object for team overall statistics
/// Contains aggregated team performance metrics
/// Used by the /api/overalls endpoint
@freezed
class OverallDto with _$OverallDto {
  const factory OverallDto({
    required String teamName,
    required double overall,
    required double awayOverall,
    required double homeOverall,
    required double teamAvg,
    required double teamHomeAvg,
    required double teamAwayAvg,
  }) = _OverallDto;

  factory OverallDto.fromJson(Map<String, dynamic> json) =>
      _$OverallDtoFromJson(json);
}
