import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/prediction_provider.dart';
import '../../../data/models/predicted_match_dto.dart';

/// Match details screen - Shows detailed information about a specific match
class MatchDetailsScreen extends ConsumerWidget {
  final String matchId;

  const MatchDetailsScreen({
    super.key,
    required this.matchId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final predictionsAsync = ref.watch(allPredictionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: predictionsAsync.when(
        data: (predictions) {
          // Find the match by commonMatchId
          final match = predictions.firstWhere(
            (p) => p.commonMatchId == matchId,
            orElse: () => predictions.isNotEmpty ? predictions.first : throw Exception('No match found'),
          );

          return _buildMatchDetails(context, match);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => _buildErrorState(context, error),
      ),
    );
  }

  Widget _buildMatchDetails(BuildContext context, PredictedMatchDto match) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('EEEE, MMM dd, yyyy • HH:mm');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Match Date/Time
          if (match.matchDate != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: theme.colorScheme.primary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Match Date',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            dateFormat.format(match.matchDate!),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 16),

          // Teams
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Away Team
                  _TeamSection(
                    teamName: match.awayTeamName ?? 'TBD',
                    teamAlias: match.awayTeamAlias,
                    score: match.predictedAwayScore,
                    isHome: false,
                    onTap: match.awayTeamName != null
                        ? () {
                            final teamName = Uri.encodeComponent(match.awayTeamName!);
                            final alias = match.awayTeamAlias != null
                                ? Uri.encodeComponent(match.awayTeamAlias!)
                                : '';
                            context.push('/results?team=$teamName&alias=$alias');
                          }
                        : null,
                  ),

                  const SizedBox(height: 24),

                  // VS Divider
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'VS',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Home Team
                  _TeamSection(
                    teamName: match.homeTeamName ?? 'TBD',
                    teamAlias: match.homeTeamAlias,
                    score: match.predictedHomeScore,
                    isHome: true,
                    onTap: match.homeTeamName != null
                        ? () {
                            final teamName = Uri.encodeComponent(match.homeTeamName!);
                            final alias = match.homeTeamAlias != null
                                ? Uri.encodeComponent(match.homeTeamAlias!)
                                : '';
                            context.push('/results?team=$teamName&alias=$alias');
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Prediction Stats
          Text(
            'Prediction Analysis',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              if (match.spread != null)
                Expanded(
                  child: _StatCard(
                    icon: Icons.timeline,
                    label: 'Point Spread',
                    value: match.spread! > 0
                        ? '+${match.spread!.toStringAsFixed(1)}'
                        : match.spread!.toStringAsFixed(1),
                    subtitle: match.spread! > 0 ? 'Home favored' : 'Away favored',
                  ),
                ),
              const SizedBox(width: 12),
              if (match.predictedTotal != null)
                Expanded(
                  child: _StatCard(
                    icon: Icons.analytics,
                    label: 'Predicted Total',
                    value: match.predictedTotal!.toStringAsFixed(1),
                    subtitle: 'Combined score',
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Match Info
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Match Information',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  _InfoRow(
                    label: 'Match ID',
                    value: match.commonMatchId.substring(0, 8),
                  ),
                  if (match.weekName != null) ...[
                    const Divider(),
                    _InfoRow(
                      label: 'Week',
                      value: match.weekName!,
                    ),
                  ],
                  if (match.weekNumber != null) ...[
                    const Divider(),
                    _InfoRow(
                      label: 'Week Number',
                      value: match.weekNumber!.toString(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading match',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamSection extends StatelessWidget {
  final String teamName;
  final String? teamAlias;
  final double? score;
  final bool isHome;
  final VoidCallback? onTap;

  const _TeamSection({
    required this.teamName,
    this.teamAlias,
    this.score,
    required this.isHome,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final child = Column(
      children: [
        // Team alias/abbreviation
        if (teamAlias != null)
          Text(
            teamAlias!,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(height: 8),

        // Team full name
        Text(
          teamName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),

        if (isHome) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'HOME',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        ],

        // Predicted score
        if (score != null) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              score!.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ],
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: child,
        ),
      );
    }

    return child;
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String subtitle;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
