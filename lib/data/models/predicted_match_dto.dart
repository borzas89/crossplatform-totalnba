import 'package:freezed_annotation/freezed_annotation.dart';

part 'predicted_match_dto.freezed.dart';
part 'predicted_match_dto.g.dart';

/// Data transfer object for predicted NBA matches
/// Matches the backend API response structure
@freezed
class PredictedMatchDto with _$PredictedMatchDto {
  const factory PredictedMatchDto({
    required String commonMatchId,
    String? homeTeamName,
    String? awayTeamName,
    String? homeTeamAlias,
    String? awayTeamAlias,
    double? predictedScore,
    double? predictedHomeScore,
    double? predictedAwayScore,
    double? predictedTotal,
    double? spread,
    String? weekName,
    int? weekNumber,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    DateTime? matchDate,
  }) = _PredictedMatchDto;

  factory PredictedMatchDto.fromJson(Map<String, dynamic> json) =>
      _$PredictedMatchDtoFromJson(json);
}

/// Convert Unix timestamp (milliseconds) to DateTime
DateTime? _dateTimeFromJson(int? timestamp) {
  if (timestamp == null) return null;
  return DateTime.fromMillisecondsSinceEpoch(timestamp);
}

/// Convert DateTime to Unix timestamp (milliseconds)
int? _dateTimeToJson(DateTime? dateTime) {
  return dateTime?.millisecondsSinceEpoch;
}
