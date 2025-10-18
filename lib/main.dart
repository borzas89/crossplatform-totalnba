import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/di/injection.dart';
import 'core/config/env_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Log environment configuration
  debugPrint('=================================');
  debugPrint('Environment: ${EnvConfig.current.environment}');
  debugPrint('API Base URL: ${EnvConfig.current.apiBaseUrl}');
  debugPrint('=================================');

  // Initialize dependency injection
  configureDependencies();

  // TODO: Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    const ProviderScope(
      child: TotalNBAApp(),
    ),
  );
}

class TotalNBAApp extends StatelessWidget {
  const TotalNBAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TotalNBA',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
