/// Application-wide constants
/// Based on TotalNBA Android app and backend API
class AppConstants {
  // Prevent instantiation
  AppConstants._();

  // ===== App Info =====
  static const String appName = 'TotalNBA';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  // ===== API Endpoints =====
  // Predictions
  static const String allPredictionsEndpoint = '/api/prediction/all-prediction/';
  static const String predictionsByWeekEndpoint = '/api/prediction/week/'; // + {week}
  static const String predictionsByDayEndpoint = '/api/prediction/day/'; // + {day}

  // Results & Overalls
  static const String allOverallsEndpoint = '/api/api/results/all-overalls/';
  static const String overallsByTeamsEndpoint = '/api/overalls'; // ?homeName={}&awayName={}
  static const String homeResultsByTeamEndpoint = '/api/results/homeTeam'; // ?homeTeam={}
  static const String awayResultsByTeamEndpoint = '/api/results/awayTeam'; // ?awayTeam={}
  static const String allResultsByTeamEndpoint = '/api/results/all-results-by-team'; // ?teamName={}

  // Player Statistics
  static const String allPlayerStatsEndpoint = '/api/v2/player-stat/all-player-stat/';
  static const String playerStatsByNameEndpoint = '/api/v2/player-stat/name/'; // ?name={}
  static const String playerStatsByTeamEndpoint = '/api/v2/player-stat/team/'; // ?team={}
  static const String aggregatedPlayerStatsEndpoint = '/api/v2/player-stat/aggregatedByPlayerName/'; // ?player={}
  static const String allAggregatedStatsEndpoint = '/api/v2/player-stat/all-aggregated-stats/';

  // Player Search
  static const String searchPlayersEndpoint = '/api/v2/nba-players/search'; // ?name={}

  // Adjustments
  static const String adjustmentsByTeamEndpoint = '/api/adjustments'; // ?teamName={}
  static const String allAdjustmentsEndpoint = '/api/adjustments/all';

  // ===== Database =====
  static const String databaseName = 'totalnba.db';
  static const int databaseVersion = 1;

  // ===== Pagination =====
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // ===== Cache Duration =====
  static const Duration cacheDuration = Duration(minutes: 30);
  static const Duration shortCacheDuration = Duration(minutes: 5);
  static const Duration longCacheDuration = Duration(hours: 24);

  // ===== Timeouts (matching Android app) =====
  static const Duration connectTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);
  static const Duration sendTimeout = Duration(seconds: 60);

  // ===== Network =====
  static const int maxRetryAttempts = 3;
  static const Duration retryDelay = Duration(seconds: 2);

  // ===== Storage Keys =====
  static const String tokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';
  static const String notificationsEnabledKey = 'notifications_enabled';

  // ===== Validation =====
  static const int minSearchLength = 2;
  static const int maxSearchLength = 50;

  // ===== UI =====
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double cardElevation = 2.0;

  // ===== Animation Durations =====
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration normalAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  // ===== Date Formats =====
  static const String dateFormat = 'yyyy-MM-dd';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm';
  static const String displayDateFormat = 'MMM dd, yyyy';
  static const String displayDateTimeFormat = 'MMM dd, yyyy HH:mm';

  // ===== Error Messages =====
  static const String networkError = 'Network error. Please check your connection.';
  static const String serverError = 'Server error. Please try again later.';
  static const String unknownError = 'An unknown error occurred.';
  static const String noDataError = 'No data available.';
  static const String timeoutError = 'Request timed out. Please try again.';

  // ===== NBA Specific =====
  static const int nbaTeamsCount = 30;
  static const int playersPerTeam = 15;
  static const int gamesPerSeason = 82;
}
