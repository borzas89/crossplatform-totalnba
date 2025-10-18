/// Environment configuration for the app
/// Supports multiple environments: development, staging, production
class EnvConfig {
  final String environment;
  final String apiBaseUrl;
  final bool enableLogging;
  final bool enableCrashReporting;
  final int apiTimeout;

  const EnvConfig({
    required this.environment,
    required this.apiBaseUrl,
    required this.enableLogging,
    required this.enableCrashReporting,
    this.apiTimeout = 30000, // 30 seconds default
  });

  /// Development environment configuration
  static const EnvConfig development = EnvConfig(
    environment: 'development',
    apiBaseUrl: 'http://localhost:8080', // Spring Boot local server
    enableLogging: true,
    enableCrashReporting: false,
    apiTimeout: 30000,
  );

  /// Staging environment configuration
  static const EnvConfig staging = EnvConfig(
    environment: 'staging',
    apiBaseUrl: 'https://totalnba-64d9e912c803.herokuapp.com', // Using production URL for now
    enableLogging: true,
    enableCrashReporting: true,
    apiTimeout: 60000,
  );

  /// Production environment configuration
  static const EnvConfig production = EnvConfig(
    environment: 'production',
    apiBaseUrl: 'https://totalnba-64d9e912c803.herokuapp.com',
    enableLogging: false,
    enableCrashReporting: true,
    apiTimeout: 60000, // 60 seconds to match Android app
  );

  /// Current environment (default to development)
  /// Can be overridden via --dart-define in build commands
  static const String _currentEnv = String.fromEnvironment(
    'ENV',
    defaultValue: 'development',
  );

  /// Get the current environment configuration
  static EnvConfig get current {
    switch (_currentEnv) {
      case 'staging':
        return staging;
      case 'production':
        return production;
      case 'development':
      default:
        return development;
    }
  }

  /// Check if running in development mode
  static bool get isDevelopment => current.environment == 'development';

  /// Check if running in staging mode
  static bool get isStaging => current.environment == 'staging';

  /// Check if running in production mode
  static bool get isProduction => current.environment == 'production';

  @override
  String toString() {
    return 'EnvConfig(environment: $environment, apiBaseUrl: $apiBaseUrl, '
        'enableLogging: $enableLogging, enableCrashReporting: $enableCrashReporting, '
        'apiTimeout: $apiTimeout)';
  }
}
