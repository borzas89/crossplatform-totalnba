import '../../data/models/predicted_match_dto.dart';

/// Repository interface for NBA predictions
/// Abstracts data sources (API, cache, database)
abstract class PredictionRepository {
  /// Get all predicted matches
  Future<List<PredictedMatchDto>> getAllPredictions();

  /// Get predictions for a specific week
  Future<List<PredictedMatchDto>> getPredictionsByWeek(int week);

  /// Get predictions for a specific day
  Future<List<PredictedMatchDto>> getPredictionsByDay(String day);
}
