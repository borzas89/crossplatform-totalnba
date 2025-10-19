import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/prediction_provider.dart';
import '../../../data/models/predicted_match_dto.dart';

enum PredictionFilter { all, today, upcoming, past }

/// Predictions screen - Shows list of NBA match predictions
class PredictionsScreen extends ConsumerStatefulWidget {
  const PredictionsScreen({super.key});

  @override
  ConsumerState<PredictionsScreen> createState() => _PredictionsScreenState();
}

class _PredictionsScreenState extends ConsumerState<PredictionsScreen> {
  PredictionFilter _currentFilter = PredictionFilter.all;

  @override
  Widget build(BuildContext context) {
    final predictionsAsync = ref.watch(allPredictionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('NBA Predictions'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterOptions(context),
            tooltip: 'Filter',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(allPredictionsProvider);
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter chips
          if (_currentFilter != PredictionFilter.all)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Row(
                children: [
                  Chip(
                    avatar: Icon(
                      _getFilterIcon(_currentFilter),
                      size: 18,
                    ),
                    label: Text(_getFilterLabel(_currentFilter)),
                    onDeleted: () {
                      setState(() {
                        _currentFilter = PredictionFilter.all;
                      });
                    },
                  ),
                ],
              ),
            ),

          // Predictions list
          Expanded(
            child: predictionsAsync.when(
              data: (predictions) {
                final filteredPredictions = _applyFilter(predictions);
                if (filteredPredictions.isEmpty) {
                  return _buildEmptyState(context);
                }
                return _buildPredictionsList(filteredPredictions);
              },
              loading: () => _buildLoadingState(),
              error: (error, stack) => _buildErrorState(context, error, ref),
            ),
          ),
        ],
      ),
    );
  }

  List<PredictedMatchDto> _applyFilter(List<PredictedMatchDto> predictions) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    switch (_currentFilter) {
      case PredictionFilter.all:
        return predictions;
      case PredictionFilter.today:
        return predictions.where((p) {
          if (p.matchDate == null) return false;
          final matchDay = DateTime(
            p.matchDate!.year,
            p.matchDate!.month,
            p.matchDate!.day,
          );
          return matchDay.isAtSameMomentAs(today);
        }).toList();
      case PredictionFilter.upcoming:
        return predictions
            .where((p) => p.matchDate != null && p.matchDate!.isAfter(now))
            .toList();
      case PredictionFilter.past:
        return predictions
            .where((p) => p.matchDate != null && p.matchDate!.isBefore(now))
            .toList();
    }
  }

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Filter Predictions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            _FilterOption(
              icon: Icons.all_inclusive,
              title: 'All Matches',
              isSelected: _currentFilter == PredictionFilter.all,
              onTap: () {
                setState(() => _currentFilter = PredictionFilter.all);
                Navigator.pop(context);
              },
            ),
            _FilterOption(
              icon: Icons.today,
              title: 'Today\'s Matches',
              isSelected: _currentFilter == PredictionFilter.today,
              onTap: () {
                setState(() => _currentFilter = PredictionFilter.today);
                Navigator.pop(context);
              },
            ),
            _FilterOption(
              icon: Icons.schedule,
              title: 'Upcoming Matches',
              isSelected: _currentFilter == PredictionFilter.upcoming,
              onTap: () {
                setState(() => _currentFilter = PredictionFilter.upcoming);
                Navigator.pop(context);
              },
            ),
            _FilterOption(
              icon: Icons.history,
              title: 'Past Matches',
              isSelected: _currentFilter == PredictionFilter.past,
              onTap: () {
                setState(() => _currentFilter = PredictionFilter.past);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  IconData _getFilterIcon(PredictionFilter filter) {
    switch (filter) {
      case PredictionFilter.all:
        return Icons.all_inclusive;
      case PredictionFilter.today:
        return Icons.today;
      case PredictionFilter.upcoming:
        return Icons.schedule;
      case PredictionFilter.past:
        return Icons.history;
    }
  }

  String _getFilterLabel(PredictionFilter filter) {
    switch (filter) {
      case PredictionFilter.all:
        return 'All Matches';
      case PredictionFilter.today:
        return 'Today';
      case PredictionFilter.upcoming:
        return 'Upcoming';
      case PredictionFilter.past:
        return 'Past';
    }
  }

  Widget _buildPredictionsList(List<PredictedMatchDto> predictions) {
    return RefreshIndicator(
      onRefresh: () async {
        // Will be handled by Riverpod
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: predictions.length,
        itemBuilder: (context, index) {
          final prediction = predictions[index];
          return _PredictionCard(prediction: prediction);
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading predictions...'),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sports_basketball_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No predictions available',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Check back later for NBA match predictions',
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
              'Error loading predictions',
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

class _PredictionCard extends StatelessWidget {
  final PredictedMatchDto prediction;

  const _PredictionCard({required this.prediction});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormat = DateFormat('MMM dd, yyyy • HH:mm');

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          context.push('/match-details/${prediction.commonMatchId}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date and week
            if (prediction.matchDate != null)
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    dateFormat.format(prediction.matchDate!),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  if (prediction.weekName != null) ...[
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(prediction.weekName!),
                      labelStyle: const TextStyle(fontSize: 11),
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ],
                ],
              ),
            const SizedBox(height: 12),

            // Teams
            Row(
              children: [
                Expanded(
                  child: _TeamDisplay(
                    teamName: prediction.awayTeamName ?? 'TBD',
                    teamAlias: prediction.awayTeamAlias,
                    score: prediction.predictedAwayScore,
                    onTap: prediction.awayTeamName != null
                        ? () {
                            final teamName = Uri.encodeComponent(prediction.awayTeamName!);
                            final alias = prediction.awayTeamAlias != null
                                ? Uri.encodeComponent(prediction.awayTeamAlias!)
                                : '';
                            context.push('/results?team=$teamName&alias=$alias');
                          }
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '@',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: _TeamDisplay(
                    teamName: prediction.homeTeamName ?? 'TBD',
                    teamAlias: prediction.homeTeamAlias,
                    score: prediction.predictedHomeScore,
                    onTap: prediction.homeTeamName != null
                        ? () {
                            final teamName = Uri.encodeComponent(prediction.homeTeamName!);
                            final alias = prediction.homeTeamAlias != null
                                ? Uri.encodeComponent(prediction.homeTeamAlias!)
                                : '';
                            context.push('/results?team=$teamName&alias=$alias');
                          }
                        : null,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 8),

            // Prediction details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (prediction.spread != null)
                  _StatChip(
                    label: 'Spread',
                    value: prediction.spread! > 0
                        ? '+${prediction.spread!.toStringAsFixed(1)}'
                        : prediction.spread!.toStringAsFixed(1),
                  ),
                if (prediction.predictedTotal != null)
                  _StatChip(
                    label: 'Total',
                    value: prediction.predictedTotal!.toStringAsFixed(1),
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

class _TeamDisplay extends StatelessWidget {
  final String teamName;
  final String? teamAlias;
  final double? score;
  final VoidCallback? onTap;

  const _TeamDisplay({
    required this.teamName,
    this.teamAlias,
    this.score,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final child = Column(
      children: [
        if (teamAlias != null)
          Text(
            teamAlias!,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        const SizedBox(height: 4),
        Text(
          teamName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        if (score != null) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              score!.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 16,
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
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      );
    }

    return child;
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _FilterOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterOption({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : null,
        ),
      ),
      trailing: isSelected
          ? Icon(
              Icons.check,
              color: Theme.of(context).colorScheme.primary,
            )
          : null,
      onTap: onTap,
    );
  }
}
