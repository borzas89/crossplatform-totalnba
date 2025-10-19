import '../../data/models/result_dto.dart';

/// Repository interface for NBA match results
/// Abstracts data sources (API, cache, database)
abstract class ResultRepository {
  /// Get all results for a specific team
  Future<List<ResultDto>> getResultsByTeam(String teamName);
}
