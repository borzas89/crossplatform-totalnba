import 'package:flutter/material.dart';

/// Predictions screen - Shows list of NBA match predictions
class PredictionsScreen extends StatelessWidget {
  const PredictionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predictions'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_basketball,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'NBA Predictions',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'AI-powered predictions for upcoming NBA matches',
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
                  '🚧 Coming Soon\n\nThis screen will display upcoming match predictions with confidence scores.',
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
