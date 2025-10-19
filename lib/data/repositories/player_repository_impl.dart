import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../domain/repositories/player_repository.dart';
import '../models/player_stat_dto.dart';
import '../models/nba_player_dto.dart';
import '../network/api_client.dart';
import '../local/app_database.dart';

/// Implementation of PlayerRepository
/// Uses local database cache with API fallback
@Injectable(as: PlayerRepository)
class PlayerRepositoryImpl implements PlayerRepository {
  final ApiClient _apiClient;
  final AppDatabase _database;
  final Logger _logger;

  PlayerRepositoryImpl(this._apiClient, this._database, this._logger);

  @override
  Future<List<PlayerStatDto>> getAllPlayerStats() async {
    try {
      _logger.d('Fetching all player stats from API and caching locally');
      final stats = await _apiClient.getAllPlayerStats();
      _logger.i('Fetched ${stats.length} player stats from API');

      // Cache in local database
      await _database.insertPlayerStats(stats);
      _logger.d('Cached ${stats.length} player stats in local database');

      return stats;
    } catch (e, stackTrace) {
      _logger.e('Error fetching player stats from API', error: e, stackTrace: stackTrace);

      // Try to get from local cache
      try {
        _logger.d('Attempting to get player stats from local cache');
        final cachedStats = await _database.getAllPlayerStats();
        if (cachedStats.isNotEmpty) {
          _logger.i('Retrieved ${cachedStats.length} player stats from cache');
          return cachedStats.map(_convertToDto).toList();
        }
      } catch (cacheError) {
        _logger.e('Error fetching from cache', error: cacheError);
      }

      rethrow;
    }
  }

  @override
  Future<List<PlayerStatDto>> getPlayerStatsByName(String playerName) async {
    try {
      // First try local cache for faster response
      _logger.d('Searching local cache for player: $playerName');
      final cachedStats = await _database.searchPlayerStats(playerName);
      if (cachedStats.isNotEmpty) {
        _logger.i('Found ${cachedStats.length} stats in cache for: $playerName');
        return cachedStats.map(_convertToDto).toList();
      }

      // If not in cache, fetch from API
      _logger.d('Player not in cache, fetching from API: $playerName');
      final stats = await _apiClient.getPlayerStatsByName(playerName);
      _logger.i('Fetched ${stats.length} stats from API for: $playerName');
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
      // First try local cache
      _logger.d('Searching local cache for team: $teamName');
      final cachedStats = await _database.getPlayerStatsByTeam(teamName);
      if (cachedStats.isNotEmpty) {
        _logger.i('Found ${cachedStats.length} stats in cache for team: $teamName');
        return cachedStats.map(_convertToDto).toList();
      }

      // If not in cache, fetch from API
      _logger.d('Team not in cache, fetching from API: $teamName');
      final stats = await _apiClient.getPlayerStatsByTeam(teamName);
      _logger.i('Fetched ${stats.length} stats from API for team: $teamName');
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
      // Search local cache first for better performance
      _logger.d('Searching players in local cache: $playerName');
      final cachedStats = await _database.searchPlayerStats(playerName);

      if (cachedStats.isNotEmpty) {
        _logger.i('Found ${cachedStats.length} players in cache matching: $playerName');
        // Convert player stats to player DTO
        return cachedStats.map((stat) => NbaPlayerDto(
          id: stat.id,
          personId: stat.id, // Use same ID for personId as we don't have separate personId in local DB
          firstName: stat.fullName.split(' ').first,
          lastName: stat.fullName.split(' ').skip(1).join(' '),
          fullName: stat.fullName,
          teamAbbreviation: stat.team,
          position: stat.position,
        )).toList();
      }

      // Fallback to API search if not in cache
      _logger.d('Players not in cache, searching API: $playerName');
      final players = await _apiClient.searchPlayers(playerName);
      _logger.i('Found ${players.length} players from API matching: $playerName');
      return players;
    } catch (e, stackTrace) {
      _logger.e('Error searching for players: $playerName',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Convert Drift PlayerStat to PlayerStatDto
  PlayerStatDto _convertToDto(PlayerStat stat) {
    return PlayerStatDto(
      id: stat.id,
      fullName: stat.fullName,
      team: stat.team,
      position: stat.position,
      gamePlayed: stat.gamePlayed,
      pointsPerGame: stat.pointsPerGame,
      reboundsPerGame: stat.reboundsPerGame,
      assistsPerGame: stat.assistsPerGame,
      stealsPerGame: stat.stealsPerGame,
      twoPointsPerGame: stat.twoPointsPerGame,
      threePointsPerGame: stat.threePointsPerGame,
    );
  }
}
