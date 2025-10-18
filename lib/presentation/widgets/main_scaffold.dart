import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/app_router.dart';

/// Main scaffold with bottom navigation bar
/// Wraps all main app screens (home, predictions, players, settings)
class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_basketball),
            label: 'Predictions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'Players',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  /// Calculate which bottom nav item should be selected based on current route
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    if (location.startsWith(AppRoutes.predictions)) {
      return 1;
    }
    if (location.startsWith(AppRoutes.playerSearch)) {
      return 2;
    }
    if (location.startsWith(AppRoutes.settings)) {
      return 3;
    }
    return 0; // Home
  }

  /// Handle bottom nav item tap
  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(AppRoutes.home);
        break;
      case 1:
        context.go(AppRoutes.predictions);
        break;
      case 2:
        context.go(AppRoutes.playerSearch);
        break;
      case 3:
        context.go(AppRoutes.settings);
        break;
    }
  }
}
