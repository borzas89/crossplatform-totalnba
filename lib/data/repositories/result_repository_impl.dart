import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../domain/repositories/result_repository.dart';
import '../models/result_dto.dart';
import '../network/api_client.dart';

/// Implementation of ResultRepository
/// Fetches data from the API
@Injectable(as: ResultRepository)
class ResultRepositoryImpl implements ResultRepository {
  final ApiClient _apiClient;
  final Logger _logger;

  ResultRepositoryImpl(this._apiClient, this._logger);

  @override
  Future<List<ResultDto>> getResultsByTeam(String teamName) async {
    try {
      _logger.d('Fetching results for team: $teamName');
      final results = await _apiClient.getResultsByTeam(teamName);
      _logger.i('Fetched ${results.length} results for team: $teamName');
      return results;
    } catch (e, stackTrace) {
      _logger.e('Error fetching results for team: $teamName',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
