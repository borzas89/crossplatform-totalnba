import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/di/injection.dart';
import '../../domain/repositories/prediction_repository.dart';
import '../../data/models/predicted_match_dto.dart';

part 'prediction_provider.g.dart';

/// Provider for PredictionRepository
@riverpod
PredictionRepository predictionRepository(PredictionRepositoryRef ref) {
  return getIt<PredictionRepository>();
}

/// Provider for all predictions
/// Auto-caches the result and only refetches when invalidated
@riverpod
Future<List<PredictedMatchDto>> allPredictions(AllPredictionsRef ref) async {
  final repository = ref.watch(predictionRepositoryProvider);
  return repository.getAllPredictions();
}

/// Provider for predictions by week
@riverpod
Future<List<PredictedMatchDto>> predictionsByWeek(
  PredictionsByWeekRef ref,
  int week,
) async {
  final repository = ref.watch(predictionRepositoryProvider);
  return repository.getPredictionsByWeek(week);
}

/// Provider for predictions by day
@riverpod
Future<List<PredictedMatchDto>> predictionsByDay(
  PredictionsByDayRef ref,
  String day,
) async {
  final repository = ref.watch(predictionRepositoryProvider);
  return repository.getPredictionsByDay(day);
}
