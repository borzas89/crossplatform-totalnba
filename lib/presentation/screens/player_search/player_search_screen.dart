import 'package:flutter/material.dart';

/// Player search screen - Search and view player statistics
class PlayerSearchScreen extends StatelessWidget {
  const PlayerSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Search'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_search,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Player Search',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Search for NBA players and view their statistics',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 32),
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  '🚧 Coming Soon\n\nThis screen will feature:\n• Player search bar\n• Player statistics\n• Career highlights\n• Recent performance',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
