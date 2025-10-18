import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../domain/repositories/player_repository.dart';
import '../models/player_stat_dto.dart';
import '../models/nba_player_dto.dart';
import '../network/api_client.dart';

/// Implementation of PlayerRepository
/// Fetches data from the API
@Injectable(as: PlayerRepository)
class PlayerRepositoryImpl implements PlayerRepository {
  final ApiClient _apiClient;
  final Logger _logger;

  PlayerRepositoryImpl(this._apiClient, this._logger);

  @override
  Future<List<PlayerStatDto>> getAllPlayerStats() async {
    try {
      _logger.d('Fetching all player stats');
      final stats = await _apiClient.getAllPlayerStats();
      _logger.i('Fetched ${stats.length} player stats');
      return stats;
    } catch (e, stackTrace) {
      _logger.e('Error fetching player stats', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<PlayerStatDto>> getPlayerStatsByName(String playerName) async {
    try {
      _logger.d('Fetching stats for player: $playerName');
      final stats = await _apiClient.getPlayerStatsByName(playerName);
      _logger.i('Fetched ${stats.length} stats for player: $playerName');
      return stats;
    } catch (e, stackTrace) {
      _logger.e('Error fetching stats for player: $playerName',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<PlayerStatDto>> getPlayerStatsByTeam(String teamName) async {
    try {
      _logger.d('Fetching stats for team: $teamName');
      final stats = await _apiClient.getPlayerStatsByTeam(teamName);
      _logger.i('Fetched ${stats.length} stats for team: $teamName');
      return stats;
    } catch (e, stackTrace) {
      _logger.e('Error fetching stats for team: $teamName',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<PlayerStatDto>> getAggregatedPlayerStats(String playerName) async {
    try {
      _logger.d('Fetching aggregated stats for: $playerName');
      final stats = await _apiClient.getAggregatedPlayerStats(playerName);
      _logger.i('Fetched aggregated stats for: $playerName');
      return stats;
    } catch (e, stackTrace) {
      _logger.e('Error fetching aggregated stats for: $playerName',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<PlayerStatDto>> getAllAggregatedStats() async {
    try {
      _logger.d('Fetching all aggregated stats');
      final stats = await _apiClient.getAllAggregatedStats();
      _logger.i('Fetched ${stats.length} aggregated stats');
      return stats;
    } catch (e, stackTrace) {
      _logger.e('Error fetching aggregated stats', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<NbaPlayerDto>> searchPlayers(String playerName) async {
    try {
      _logger.d('Searching for players: $playerName');
      final players = await _apiClient.searchPlayers(playerName);
      _logger.i('Found ${players.length} players matching: $playerName');
      return players;
    } catch (e, stackTrace) {
      _logger.e('Error searching for players: $playerName',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
