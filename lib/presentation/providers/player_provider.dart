import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/di/injection.dart';
import '../../domain/repositories/player_repository.dart';
import '../../data/models/player_stat_dto.dart';
import '../../data/models/nba_player_dto.dart';

part 'player_provider.g.dart';

/// Provider for PlayerRepository
@riverpod
PlayerRepository playerRepository(PlayerRepositoryRef ref) {
  return getIt<PlayerRepository>();
}

/// Provider for all player statistics
@riverpod
Future<List<PlayerStatDto>> allPlayerStats(AllPlayerStatsRef ref) async {
  final repository = ref.watch(playerRepositoryProvider);
  return repository.getAllPlayerStats();
}

/// Provider for player search results
@riverpod
Future<List<NbaPlayerDto>> searchPlayers(
  SearchPlayersRef ref,
  String playerName,
) async {
  final repository = ref.watch(playerRepositoryProvider);
  return repository.searchPlayers(playerName);
}

/// Provider for player stats by name
@riverpod
Future<List<PlayerStatDto>> playerStatsByName(
  PlayerStatsByNameRef ref,
  String playerName,
) async {
  final repository = ref.watch(playerRepositoryProvider);
  return repository.getPlayerStatsByName(playerName);
}

/// Provider for player stats by team
@riverpod
Future<List<PlayerStatDto>> playerStatsByTeam(
  PlayerStatsByTeamRef ref,
  String teamName,
) async {
  final repository = ref.watch(playerRepositoryProvider);
  return repository.getPlayerStatsByTeam(teamName);
}
