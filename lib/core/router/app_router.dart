import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/main/main_screen.dart';
import '../../presentation/screens/match_details/match_details_screen.dart';
import '../../presentation/screens/results/results_screen.dart';

/// App route names for type-safe navigation
class AppRoutes {
  static const String splash = '/';
  static const String main = '/main';
  static const String matchDetails = '/match-details/:id';
  static const String results = '/results';
}

/// Global navigation key for programmatic navigation
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

/// GoRouter configuration for the app
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.splash,
  debugLogDiagnostics: true,
  routes: [
    // Splash screen route
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),

    // Main screen with bottom navigation
    GoRoute(
      path: AppRoutes.main,
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),

    // Full-screen routes (outside bottom nav)
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
            onPressed: () => context.go(AppRoutes.main),
            child: const Text('Go to Main'),
          ),
        ],
      ),
    ),
  ),
);
