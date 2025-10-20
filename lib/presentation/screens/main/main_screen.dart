import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../predictions/predictions_screen.dart';
import '../player_search/player_search_screen.dart';
import '../standings/standings_screen.dart';
import '../settings/settings_screen.dart';

/// Main screen with bottom navigation bar
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    PredictionsScreen(),
    PlayerSearchScreen(),
    StandingsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // Allow content to extend behind the bottom navigation
      extendBody: true,
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.3)
                    : Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  navigationBarTheme: NavigationBarThemeData(
                    iconTheme: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return const IconThemeData(color: Colors.white);
                      }
                      return IconThemeData(color: Colors.grey[600]);
                    }),
                  ),
                ),
                child: NavigationBar(
                  selectedIndex: _currentIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  backgroundColor: Colors.transparent,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  elevation: 0,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.sports_basketball_outlined),
                      selectedIcon: Icon(Icons.sports_basketball),
                      label: 'Predictions',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.person_search_outlined),
                      selectedIcon: Icon(Icons.person_search),
                      label: 'Players',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.emoji_events_outlined),
                      selectedIcon: Icon(Icons.emoji_events),
                      label: 'Standings',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.settings_outlined),
                      selectedIcon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
