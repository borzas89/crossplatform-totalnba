import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/result_provider.dart';
import '../../../data/models/result_dto.dart';

/// Results screen - Shows historical match results
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

    // Only fetch results if teamName is provided
    if (teamName == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(displayTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
        ),
        body: _buildEmptyState(context),
      );
    }

    final resultsAsync = ref.watch(resultsByTeamProvider(teamName!));

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
              ref.invalidate(resultsByTeamProvider(teamName!));
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: resultsAsync.when(
        data: (results) {
          if (results.isEmpty) {
            return _buildEmptyState(context);
          }

          return Column(
            children: [
              // Team Header
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
                    _buildTeamStats(results),
                  ],
                ),
              ),

              // Matches List
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(resultsByTeamProvider(teamName!));
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final result = results[index];
                      return _ResultCard(
                        result: result,
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

  Widget _buildTeamStats(List<ResultDto> results) {
    // Calculate wins and losses for the team
    int wins = 0;
    int losses = 0;

    for (final result in results) {
      final isHome = result.homeName == teamName;
      final isAway = result.awayName == teamName;

      if (isHome && result.homeScore != null && result.awayScore != null) {
        if (result.homeScore! > result.awayScore!) {
          wins++;
        } else {
          losses++;
        }
      } else if (isAway && result.homeScore != null && result.awayScore != null) {
        if (result.awayScore! > result.homeScore!) {
          wins++;
        } else {
          losses++;
        }
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatBadge(
          label: 'Total Matches',
          value: results.length.toString(),
          icon: Icons.sports_basketball,
        ),
        _StatBadge(
          label: 'Wins',
          value: wins.toString(),
          icon: Icons.check_circle,
        ),
        _StatBadge(
          label: 'Losses',
          value: losses.toString(),
          icon: Icons.cancel,
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
            'Check back later for match results',
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
                if (teamName != null) {
                  ref.invalidate(resultsByTeamProvider(teamName!));
                }
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
  final ResultDto result;
  final String? highlightTeam;

  const _ResultCard({
    required this.result,
    this.highlightTeam,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMM dd, yyyy • HH:mm');
    final isPastMatch = result.matchTime?.isBefore(DateTime.now()) ?? true;

    // Determine winner
    String? winner;
    if (result.homeScore != null && result.awayScore != null) {
      if (result.homeScore! > result.awayScore!) {
        winner = result.homeName;
      } else if (result.awayScore! > result.homeScore!) {
        winner = result.awayName;
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // Could navigate to match details if available
          // context.push('/match-details/${result.matchId}');
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
                    result.matchTime != null
                        ? dateFormat.format(result.matchTime!)
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
                      isPastMatch ? 'Final' : 'Scheduled',
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
                      teamName: result.awayName ?? 'TBD',
                      score: result.awayScore,
                      isHighlighted: result.awayName == highlightTeam,
                      isWinner: winner == result.awayName,
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
                      teamName: result.homeName ?? 'TBD',
                      score: result.homeScore,
                      isHighlighted: result.homeName == highlightTeam,
                      isWinner: winner == result.homeName,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamSection extends StatelessWidget {
  final String teamName;
  final int? score;
  final bool isHighlighted;
  final bool isWinner;

  const _TeamSection({
    required this.teamName,
    this.score,
    this.isHighlighted = false,
    this.isWinner = false,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isWinner)
                Icon(
                  Icons.emoji_events,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              if (isWinner) const SizedBox(width: 4),
              Flexible(
                child: Text(
                  teamName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isWinner ? FontWeight.bold : FontWeight.normal,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
          if (score != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isWinner
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                score!.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isWinner
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
