import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../config/env_config.dart';
import '../constants/app_constants.dart';

/// Network module for dependency injection
/// Provides HTTP client and related services
@module
abstract class NetworkModule {
  /// Provides configured Dio instance
  @lazySingleton
  Dio provideDio(Logger logger) {
    final dio = Dio(
      BaseOptions(
        baseUrl: EnvConfig.current.apiBaseUrl,
        connectTimeout: AppConstants.connectTimeout,
        receiveTimeout: AppConstants.receiveTimeout,
        sendTimeout: AppConstants.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add logging interceptor in development/staging
    if (EnvConfig.current.enableLogging) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          error: true,
          logPrint: (obj) => logger.d(obj),
        ),
      );
    }

    // Add retry interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          // Retry logic for network errors
          if (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.receiveTimeout ||
              error.type == DioExceptionType.sendTimeout) {
            final requestOptions = error.requestOptions;
            final retryCount = requestOptions.extra['retry_count'] ?? 0;

            if (retryCount < AppConstants.maxRetryAttempts) {
              logger.w(
                'Retrying request (${retryCount + 1}/${AppConstants.maxRetryAttempts}): ${requestOptions.path}',
              );

              // Wait before retrying
              await Future.delayed(AppConstants.retryDelay);

              // Update retry count
              requestOptions.extra['retry_count'] = retryCount + 1;

              // Retry the request
              try {
                final response = await dio.fetch(requestOptions);
                handler.resolve(response);
                return;
              } catch (e) {
                // If retry fails, continue with error
              }
            }
          }

          handler.next(error);
        },
      ),
    );

    return dio;
  }

  /// Provides Logger instance
  @lazySingleton
  Logger provideLogger() {
    return Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      level: EnvConfig.current.enableLogging ? Level.debug : Level.error,
    );
  }
}
