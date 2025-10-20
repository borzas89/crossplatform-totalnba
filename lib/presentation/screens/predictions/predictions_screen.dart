import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/prediction_provider.dart';
import '../../../data/models/predicted_match_dto.dart';
import '../../widgets/match_analysis_bottom_sheet.dart';
import '../../widgets/date_selector.dart';

enum PredictionFilter { all, today, upcoming, past, byDate }

/// Predictions screen - Shows list of NBA match predictions
class PredictionsScreen extends ConsumerStatefulWidget {
  const PredictionsScreen({super.key});

  @override
  ConsumerState<PredictionsScreen> createState() => _PredictionsScreenState();
}

class _PredictionsScreenState extends ConsumerState<PredictionsScreen> {
  PredictionFilter _currentFilter = PredictionFilter.all;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final predictionsAsync = ref.watch(allPredictionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('NBA Predictions'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              setState(() {
                _selectedDate = DateTime.now();
                _currentFilter = PredictionFilter.byDate;
              });
              ref.invalidate(allPredictionsProvider);
            },
            tooltip: 'Today',
          ),
        ],
      ),
      body: Column(
        children: [
          // Date Selector
          DateSelector(
            selectedDate: _selectedDate,
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date;
                _currentFilter = PredictionFilter.byDate;
              });
            },
          ),

          // Filter chips
          if (_currentFilter != PredictionFilter.all && _currentFilter != PredictionFilter.byDate)
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
      case PredictionFilter.byDate:
        final selectedDay = DateTime(
          _selectedDate.year,
          _selectedDate.month,
          _selectedDate.day,
        );
        return predictions.where((p) {
          if (p.matchDate == null) return false;
          final matchDay = DateTime(
            p.matchDate!.year,
            p.matchDate!.month,
            p.matchDate!.day,
          );
          return matchDay.isAtSameMomentAs(selectedDay);
        }).toList();
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
      case PredictionFilter.byDate:
        return Icons.calendar_today;
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
      case PredictionFilter.byDate:
        return DateFormat('MMM dd').format(_selectedDate);
    }
  }

  Widget _buildPredictionsList(List<PredictedMatchDto> predictions) {
    return RefreshIndicator(
      onRefresh: () async {
        // Will be handled by Riverpod
      },
      child: ListView.builder(
        // Add bottom padding for floating navigation bar (height + margin)
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
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
    final timeFormat = DateFormat('HH:mm');

    // Determine which team is predicted to win
    final homeWinning = (prediction.predictedHomeScore ?? 0) > (prediction.predictedAwayScore ?? 0);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          MatchAnalysisBottomSheet.show(context, prediction);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time and Game Center label
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Time
                if (prediction.matchDate != null)
                  Text(
                    timeFormat.format(prediction.matchDate!),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                // Game Center label
                Text(
                  'Game Center',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Teams
            Row(
              children: [
                Expanded(
                  child: _TeamDisplay(
                    teamName: prediction.awayTeamName ?? 'TBD',
                    teamAlias: prediction.awayTeamAlias,
                    score: prediction.predictedAwayScore,
                    isWinning: !homeWinning && prediction.predictedAwayScore != null,
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
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Text(
                        'VS',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Total score
                      if (prediction.predictedTotal != null)
                        Column(
                          children: [
                            Text(
                              prediction.predictedTotal!.toStringAsFixed(0),
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'TOTAL',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: _TeamDisplay(
                    teamName: prediction.homeTeamName ?? 'TBD',
                    teamAlias: prediction.homeTeamAlias,
                    score: prediction.predictedHomeScore,
                    isWinning: homeWinning && prediction.predictedHomeScore != null,
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

            // Spread
            if (prediction.spread != null) ...[
              const SizedBox(height: 16),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Spread: ${prediction.spread! > 0 ? '+' : ''}${prediction.spread!.toStringAsFixed(1)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ],
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
  final bool isWinning;
  final VoidCallback? onTap;

  const _TeamDisplay({
    required this.teamName,
    this.teamAlias,
    this.score,
    this.isWinning = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final child = Column(
      children: [
        // Team Logo
        if (teamAlias != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/teams/${teamAlias!.toLowerCase()}.png',
              width: 48,
              height: 48,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to basketball icon if team logo not found
                // Debug: Print the path that failed
                print('Failed to load team icon: assets/images/teams/${teamAlias!.toLowerCase()}.png');
                print('Error: $error');
                return Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.sports_basketball,
                    size: 32,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                );
              },
            ),
          ),
        const SizedBox(height: 8),

        // Team Alias
        if (teamAlias != null)
          Text(
            teamAlias!,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        const SizedBox(height: 4),

        // Team Name (smaller, below alias)
        Text(
          teamName,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[600],
          ),
        ),

        // Predicted Score
        if (score != null) ...[
          const SizedBox(height: 8),
          Text(
            score!.toStringAsFixed(0),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isWinning
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[700],
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
