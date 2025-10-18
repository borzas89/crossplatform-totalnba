import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Match details screen - Shows detailed information about a specific match
class MatchDetailsScreen extends StatelessWidget {
  final String matchId;

  const MatchDetailsScreen({
    super.key,
    required this.matchId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_score,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Match #$matchId',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Detailed match information, team stats, and prediction analysis',
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
                  '🚧 Coming Soon\n\nThis screen will show:\n• Team lineups\n• Head-to-head stats\n• Prediction confidence\n• Historical data',
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
