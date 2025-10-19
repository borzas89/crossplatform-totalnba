import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/prediction_provider.dart';
import '../../../data/models/predicted_match_dto.dart';

/// Results screen - Shows historical match results and prediction accuracy
class ResultsScreen extends ConsumerWidget {
  final String? teamName;
  final String? teamAlias;

  const ResultsScreen({
    super.key,
    this.teamName,
    this.teamAlias,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayTitle = teamName != null ? '$teamName Results' : 'Results';
    final predictionsAsync = ref.watch(allPredictionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(displayTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(allPredictionsProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: predictionsAsync.when(
        data: (predictions) {
          // Filter predictions by team if teamName is provided
          final filteredPredictions = teamName != null
              ? predictions.where((p) =>
                  p.homeTeamName == teamName || p.awayTeamName == teamName).toList()
              : predictions;

          if (filteredPredictions.isEmpty) {
            return _buildEmptyState(context);
          }

          return Column(
            children: [
              // Team Header (if team-specific view)
              if (teamName != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primaryContainer,
                        Theme.of(context).colorScheme.surface,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      if (teamAlias != null) ...[
                        Text(
                          teamAlias!,
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                        ),
                        const SizedBox(height: 8),
                      ],
                      Text(
                        teamName!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      _buildTeamStats(filteredPredictions),
                    ],
                  ),
                ),
              ],

              // Matches List
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(allPredictionsProvider);
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredPredictions.length,
                    itemBuilder: (context, index) {
                      final match = filteredPredictions[index];
                      return _ResultCard(
                        match: match,
                        highlightTeam: teamName,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading results...'),
            ],
          ),
        ),
        error: (error, stack) => _buildErrorState(context, error, ref),
      ),
    );
  }

  Widget _buildTeamStats(List<PredictedMatchDto> matches) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatBadge(
          label: 'Total Matches',
          value: matches.length.toString(),
          icon: Icons.sports_basketball,
        ),
        _StatBadge(
          label: 'Upcoming',
          value: matches.where((m) => m.matchDate?.isAfter(DateTime.now()) ?? false).length.toString(),
          icon: Icons.schedule,
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            teamName != null ? 'No matches found for $teamName' : 'No results available',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Check back later for match predictions',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error, WidgetRef ref) {
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
              'Error loading results',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                ref.invalidate(allPredictionsProvider);
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatBadge({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final PredictedMatchDto match;
  final String? highlightTeam;

  const _ResultCard({
    required this.match,
    this.highlightTeam,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMM dd, yyyy • HH:mm');
    final isPastMatch = match.matchDate?.isBefore(DateTime.now()) ?? false;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          context.push('/match-details/${match.commonMatchId}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date and status
              Row(
                children: [
                  Icon(
                    isPastMatch ? Icons.history : Icons.schedule,
                    size: 14,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    match.matchDate != null
                        ? dateFormat.format(match.matchDate!)
                        : 'Date TBD',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isPastMatch
                          ? Colors.grey.withValues(alpha: 0.2)
                          : theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isPastMatch ? 'Past' : 'Upcoming',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: isPastMatch
                            ? Colors.grey[700]
                            : theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Teams
              Row(
                children: [
                  Expanded(
                    child: _TeamSection(
                      teamName: match.awayTeamName ?? 'TBD',
                      teamAlias: match.awayTeamAlias,
                      score: match.predictedAwayScore,
                      isHighlighted: match.awayTeamName == highlightTeam,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '@',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  Expanded(
                    child: _TeamSection(
                      teamName: match.homeTeamName ?? 'TBD',
                      teamAlias: match.homeTeamAlias,
                      score: match.predictedHomeScore,
                      isHighlighted: match.homeTeamName == highlightTeam,
                    ),
                  ),
                ],
              ),

              if (match.spread != null || match.predictedTotal != null) ...[
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (match.spread != null)
                      _StatChip(
                        label: 'Spread',
                        value: match.spread! > 0
                            ? '+${match.spread!.toStringAsFixed(1)}'
                            : match.spread!.toStringAsFixed(1),
                      ),
                    if (match.predictedTotal != null)
                      _StatChip(
                        label: 'Total',
                        value: match.predictedTotal!.toStringAsFixed(1),
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamSection extends StatelessWidget {
  final String teamName;
  final String? teamAlias;
  final double? score;
  final bool isHighlighted;

  const _TeamSection({
    required this.teamName,
    this.teamAlias,
    this.score,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isHighlighted
            ? Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3)
            : null,
        borderRadius: BorderRadius.circular(8),
        border: isHighlighted
            ? Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              )
            : null,
      ),
      child: Column(
        children: [
          if (teamAlias != null)
            Text(
              teamAlias!,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          const SizedBox(height: 4),
          Text(
            teamName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),
          if (score != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                score!.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;

  const _StatChip({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
