import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/router/app_router.dart';
import '../../providers/prediction_provider.dart';
import '../../../domain/services/player_sync_service.dart';
import '../../../core/di/injection.dart';

/// Home screen - Main landing page with quick access to features
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _isSyncing = false;

  Future<void> _refreshData() async {
    setState(() => _isSyncing = true);
    try {
      // Refresh predictions
      ref.invalidate(allPredictionsProvider);

      // Sync player stats
      final syncService = getIt<PlayerSyncService>();
      await syncService.syncPlayerStats();
    } finally {
      if (mounted) {
        setState(() => _isSyncing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final predictionsAsync = ref.watch(allPredictionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TotalNBA'),
        elevation: 0,
        actions: [
          if (_isSyncing)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _refreshData,
              tooltip: 'Refresh data',
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
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

                // Live Stats Card
                predictionsAsync.when(
                  data: (predictions) => _buildStatsCard(context, predictions),
                  loading: () => const Card(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  error: (error, _) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Icon(Icons.error_outline, color: Colors.orange, size: 48),
                          const SizedBox(height: 16),
                          Text(
                            'Unable to load predictions',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Pull down to refresh',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
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
      ),
    );
  }

  Widget _buildStatsCard(BuildContext context, List predictions) {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final todayEnd = todayStart.add(const Duration(days: 1));

    // Count today's predictions
    final todaysPredictions = predictions.where((p) {
      final matchDate = p.matchDate;
      if (matchDate == null) return false;
      return matchDate.isAfter(todayStart) && matchDate.isBefore(todayEnd);
    }).toList();

    // Count upcoming predictions (future matches)
    final upcomingPredictions = predictions.where((p) {
      final matchDate = p.matchDate;
      if (matchDate == null) return false;
      return matchDate.isAfter(now);
    }).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.analytics, color: Colors.blue, size: 32),
                const SizedBox(width: 12),
                Text(
                  'Live Stats',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _StatItem(
                    icon: Icons.today,
                    label: 'Today',
                    value: todaysPredictions.length.toString(),
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    icon: Icons.calendar_today,
                    label: 'Upcoming',
                    value: upcomingPredictions.length.toString(),
                    color: Colors.orange,
                  ),
                ),
                Expanded(
                  child: _StatItem(
                    icon: Icons.sports_basketball,
                    label: 'Total',
                    value: predictions.length.toString(),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Last updated: ${DateFormat('MMM dd, HH:mm').format(now)}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
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
