import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';

/// Home screen - Main landing page with quick access to features
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TotalNBA'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Welcome Section
              const SizedBox(height: 16),
              const Icon(
                Icons.sports_basketball,
                size: 80,
                color: Colors.orange,
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome to TotalNBA',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'AI-Powered NBA Predictions & Statistics',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Status Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green, size: 48),
                      const SizedBox(height: 16),
                      Text(
                        'Phase 1 in Progress! 🚀',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Navigation system is now active!\nTry the bottom navigation to explore.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Quick Access Section
              Text(
                'Quick Access',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),

              // Feature Cards
              _FeatureCard(
                icon: Icons.sports_basketball,
                title: 'Predictions',
                description: 'View AI-powered match predictions',
                color: Colors.blue,
                onTap: () => context.go(AppRoutes.predictions),
              ),
              const SizedBox(height: 12),
              _FeatureCard(
                icon: Icons.person_search,
                title: 'Player Search',
                description: 'Search for players and view stats',
                color: Colors.orange,
                onTap: () => context.go(AppRoutes.playerSearch),
              ),
              const SizedBox(height: 12),
              _FeatureCard(
                icon: Icons.history,
                title: 'Results History',
                description: 'View past predictions and results',
                color: Colors.green,
                onTap: () => context.go(AppRoutes.results),
              ),
              const SizedBox(height: 12),
              _FeatureCard(
                icon: Icons.settings,
                title: 'Settings',
                description: 'Customize your experience',
                color: Colors.grey,
                onTap: () => context.go(AppRoutes.settings),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
