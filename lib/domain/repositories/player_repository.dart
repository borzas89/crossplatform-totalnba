import '../../data/models/player_stat_dto.dart';
import '../../data/models/nba_player_dto.dart';

/// Repository interface for NBA players and statistics
/// Abstracts data sources (API, cache, database)
abstract class PlayerRepository {
  /// Get all player statistics
  Future<List<PlayerStatDto>> getAllPlayerStats();

  /// Get statistics for a specific player
  Future<List<PlayerStatDto>> getPlayerStatsByName(String playerName);

  /// Get statistics for players on a specific team
  Future<List<PlayerStatDto>> getPlayerStatsByTeam(String teamName);

  /// Get aggregated statistics for a player
  Future<List<PlayerStatDto>> getAggregatedPlayerStats(String playerName);

  /// Get all aggregated statistics
  Future<List<PlayerStatDto>> getAllAggregatedStats();

  /// Search for NBA players by name
  Future<List<NbaPlayerDto>> searchPlayers(String playerName);
}
