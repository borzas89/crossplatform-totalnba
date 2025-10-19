import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/di/injection.dart';
import '../../domain/repositories/result_repository.dart';
import '../../data/models/result_dto.dart';

part 'result_provider.g.dart';

/// Provider for ResultRepository
@riverpod
ResultRepository resultRepository(ResultRepositoryRef ref) {
  return getIt<ResultRepository>();
}

/// Provider for team results
/// Takes a team name parameter and fetches all results for that team
@riverpod
Future<List<ResultDto>> resultsByTeam(
  ResultsByTeamRef ref,
  String teamName,
) async {
  final repository = ref.watch(resultRepositoryProvider);
  return repository.getResultsByTeam(teamName);
}
