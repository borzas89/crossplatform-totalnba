import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers/prediction_provider.dart';
import '../../../data/models/predicted_match_dto.dart';

/// Predictions screen - Shows list of NBA match predictions
class PredictionsScreen extends ConsumerWidget {
  const PredictionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final predictionsAsync = ref.watch(allPredictionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('NBA Predictions'),
        centerTitle: true,
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
          if (predictions.isEmpty) {
            return _buildEmptyState(context);
          }
          return _buildPredictionsList(predictions);
        },
        loading: () => _buildLoadingState(),
        error: (error, stack) => _buildErrorState(context, error, ref),
      ),
    );
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
    );
  }
}

class _TeamDisplay extends StatelessWidget {
  final String teamName;
  final String? teamAlias;
  final double? score;

  const _TeamDisplay({
    required this.teamName,
    this.teamAlias,
    this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
