import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../core/constants/app_constants.dart';
import '../models/predicted_match_dto.dart';
import '../models/player_stat_dto.dart';
import '../models/nba_player_dto.dart';
import '../models/result_dto.dart';

part 'api_client.g.dart';

/// Retrofit API client for TotalNBA backend
/// Provides type-safe access to all API endpoints
@RestApi()
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  // ===== Predictions =====

  /// Get all predicted matches
  @GET(AppConstants.allPredictionsEndpoint)
  Future<List<PredictedMatchDto>> getAllPredictions();

  /// Get predictions by week number
  @GET('${AppConstants.predictionsByWeekEndpoint}{week}')
  Future<List<PredictedMatchDto>> getPredictionsByWeek(
    @Path('week') int week,
  );

  /// Get predictions by day
  @GET('${AppConstants.predictionsByDayEndpoint}{day}')
  Future<List<PredictedMatchDto>> getPredictionsByDay(
    @Path('day') String day,
  );

  // ===== Player Statistics =====

  /// Get all player statistics
  @GET(AppConstants.allPlayerStatsEndpoint)
  Future<List<PlayerStatDto>> getAllPlayerStats();

  /// Get player statistics by name
  @GET(AppConstants.playerStatsByNameEndpoint)
  Future<List<PlayerStatDto>> getPlayerStatsByName(
    @Query('name') String playerName,
  );

  /// Get player statistics by team
  @GET(AppConstants.playerStatsByTeamEndpoint)
  Future<List<PlayerStatDto>> getPlayerStatsByTeam(
    @Query('team') String teamName,
  );

  /// Get aggregated player statistics by player name
  @GET(AppConstants.aggregatedPlayerStatsEndpoint)
  Future<List<PlayerStatDto>> getAggregatedPlayerStats(
    @Query('player') String playerName,
  );

  /// Get all aggregated statistics
  @GET(AppConstants.allAggregatedStatsEndpoint)
  Future<List<PlayerStatDto>> getAllAggregatedStats();

  // ===== Player Search =====

  /// Search for NBA players by name
  @GET(AppConstants.searchPlayersEndpoint)
  Future<List<NbaPlayerDto>> searchPlayers(
    @Query('name') String playerName,
  );

  // ===== Results =====

  /// Get all results for a specific team
  @GET(AppConstants.allResultsByTeamEndpoint)
  Future<List<ResultDto>> getResultsByTeam(
    @Query('teamName') String teamName,
  );
}
