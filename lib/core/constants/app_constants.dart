class AppConstants {
  // API - Update this with your Spring Boot backend URL
  static const String baseUrl = 'http://localhost:8080'; // TODO: Update with your totalnba backend URL

  // For Android Emulator, use: http://10.0.2.2:8080
  // For iOS Simulator, use: http://localhost:8080
  // For Real Device, use: http://YOUR_COMPUTER_IP:8080

  // App Info
  static const String appName = 'TotalNBA';
  static const String appVersion = '1.0.0';

  // Database
  static const String databaseName = 'totalnba.db';
  static const int databaseVersion = 1;

  // Pagination
  static const int defaultPageSize = 20;

  // Cache Duration
  static const Duration cacheDuration = Duration(minutes: 30);
}
