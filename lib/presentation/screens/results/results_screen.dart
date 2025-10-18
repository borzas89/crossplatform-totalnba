import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Results screen - Shows historical match results and prediction accuracy
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
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
              Icons.history,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Results History',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Past match results and prediction accuracy tracking',
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
                  '🚧 Coming Soon\n\nThis screen will display:\n• Historical results\n• Prediction accuracy\n• Win/loss statistics\n• Filter by date/team',
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
