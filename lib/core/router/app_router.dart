import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/predictions/predictions_screen.dart';
import '../../presentation/screens/match_details/match_details_screen.dart';
import '../../presentation/screens/player_search/player_search_screen.dart';
import '../../presentation/screens/results/results_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/widgets/main_scaffold.dart';

/// App route names for type-safe navigation
class AppRoutes {
  static const String home = '/';
  static const String predictions = '/predictions';
  static const String matchDetails = '/match/:id';
  static const String playerSearch = '/players';
  static const String results = '/results';
  static const String settings = '/settings';
}

/// Global navigation key for programmatic navigation
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

/// GoRouter configuration for the app
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.home,
  debugLogDiagnostics: true,
  routes: [
    // Main shell route with bottom navigation
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: 'home',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.predictions,
          name: 'predictions',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const PredictionsScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.playerSearch,
          name: 'playerSearch',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const PlayerSearchScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.settings,
          name: 'settings',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const SettingsScreen(),
          ),
        ),
      ],
    ),

    // Full-screen routes (outside bottom nav shell)
    GoRoute(
      path: AppRoutes.matchDetails,
      name: 'matchDetails',
      builder: (context, state) {
        final matchId = state.pathParameters['id']!;
        return MatchDetailsScreen(matchId: matchId);
      },
    ),
    GoRoute(
      path: AppRoutes.results,
      name: 'results',
      builder: (context, state) {
        final teamName = state.uri.queryParameters['team'];
        final teamAlias = state.uri.queryParameters['alias'];
        return ResultsScreen(
          teamName: teamName,
          teamAlias: teamAlias,
        );
      },
    ),
  ],

  // Error handling
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('Page not found: ${state.uri}'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go(AppRoutes.home),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  ),
);
