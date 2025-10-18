import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../domain/repositories/prediction_repository.dart';
import '../models/predicted_match_dto.dart';
import '../network/api_client.dart';

/// Implementation of PredictionRepository
/// Fetches data from the API
@Injectable(as: PredictionRepository)
class PredictionRepositoryImpl implements PredictionRepository {
  final ApiClient _apiClient;
  final Logger _logger;

  PredictionRepositoryImpl(this._apiClient, this._logger);

  @override
  Future<List<PredictedMatchDto>> getAllPredictions() async {
    try {
      _logger.d('Fetching all predictions');
      final predictions = await _apiClient.getAllPredictions();
      _logger.i('Fetched ${predictions.length} predictions');
      return predictions;
    } catch (e, stackTrace) {
      _logger.e('Error fetching predictions', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<PredictedMatchDto>> getPredictionsByWeek(int week) async {
    try {
      _logger.d('Fetching predictions for week $week');
      final predictions = await _apiClient.getPredictionsByWeek(week);
      _logger.i('Fetched ${predictions.length} predictions for week $week');
      return predictions;
    } catch (e, stackTrace) {
      _logger.e('Error fetching predictions for week $week',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<PredictedMatchDto>> getPredictionsByDay(String day) async {
    try {
      _logger.d('Fetching predictions for day $day');
      final predictions = await _apiClient.getPredictionsByDay(day);
      _logger.i('Fetched ${predictions.length} predictions for day $day');
      return predictions;
    } catch (e, stackTrace) {
      _logger.e('Error fetching predictions for day $day',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
