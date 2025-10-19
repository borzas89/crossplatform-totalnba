import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/di/injection.dart';
import 'core/config/env_config.dart';
import 'domain/services/player_sync_service.dart';
import 'presentation/providers/settings_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Log environment configuration
  debugPrint('=================================');
  debugPrint('Environment: ${EnvConfig.current.environment}');
  debugPrint('API Base URL: ${EnvConfig.current.apiBaseUrl}');
  debugPrint('=================================');

  // Initialize dependency injection
  await configureDependencies();

  // Sync player stats in background (don't block app startup)
  final syncService = getIt<PlayerSyncService>();
  syncService.syncPlayerStats().then((_) {
    debugPrint('Player stats sync completed');
  }).catchError((error) {
    debugPrint('Player stats sync failed: $error');
  });

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

class TotalNBAApp extends ConsumerWidget {
  const TotalNBAApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch theme mode from settings
    final themeMode = ref.watch(appThemeModeProvider);

    return MaterialApp.router(
      title: 'TotalNBA',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
