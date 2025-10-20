import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/predicted_match_dto.dart';
import '../../data/models/adjustment_dto.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/win_probability_calculator.dart';
import '../providers/adjustment_provider.dart';
import '../providers/overall_provider.dart';
import '../../data/models/overall_dto.dart';

/// Match Analysis Bottom Sheet - Shows detailed prediction analysis
/// Based on design from prediction_sheet.jpg and prediction_sheet_full.jpg
class MatchAnalysisBottomSheet extends ConsumerWidget {
  final PredictedMatchDto prediction;

  const MatchAnalysisBottomSheet({
    super.key,
    required this.prediction,
  });

  /// Show the match analysis bottom sheet
  static void show(BuildContext context, PredictedMatchDto prediction) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => MatchAnalysisBottomSheet(prediction: prediction),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // Fetch adjustment data for both teams using team aliases (e.g., PHI, MIL)
    final adjustmentsAsync = ref.watch(
      matchAdjustmentsProvider(
        prediction.homeTeamAlias ?? '',
        prediction.awayTeamAlias ?? '',
      ),
    );

    // Fetch overall data for both teams using FULL team names
    final overallsAsync = ref.watch(
      matchOverallsProvider(
        prediction.homeTeamName ?? '',
        prediction.awayTeamName ?? '',
      ),
    );

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Drag handle
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header with close button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Match Analysis',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                      tooltip: 'Close',
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Scrollable content
              Expanded(
                child: adjustmentsAsync.when(
                  data: (adjustments) {
                    // Now check if overalls data is also loaded
                    return overallsAsync.when(
                      data: (overalls) {
                        final homeAdjustment = adjustments['home']!;
                        final awayAdjustment = adjustments['away']!;
                        final homeOverall = overalls['home']!;
                        final awayOverall = overalls['away']!;

                        // Calculate win probabilities using LOG5 formula
                        final homeWinProb = WinProbabilityCalculator.calculateHomeWinProbability(
                          homeWinPct: homeAdjustment.homeWinPct,
                          awayWinPct: awayAdjustment.awayWinPct,
                          homeTotalPct: homeAdjustment.totalPct,
                          awayTotalPct: awayAdjustment.totalPct,
                          homeLastTen: homeAdjustment.lastTenStreak,
                          awayLastTen: awayAdjustment.lastTenStreak,
                        );
                        final awayWinProb = 100.0 - homeWinProb;

                        return _buildContent(
                          scrollController,
                          theme,
                          homeAdjustment,
                          awayAdjustment,
                          homeOverall,
                          awayOverall,
                          homeWinProb,
                          awayWinProb,
                        );
                      },
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (error, stack) => _buildError(error),
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => _buildError(error),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent(
    ScrollController scrollController,
    ThemeData theme,
    AdjustmentDto homeAdjustment,
    AdjustmentDto awayAdjustment,
    OverallDto homeOverall,
    OverallDto awayOverall,
    double homeWinProb,
    double awayWinProb,
  ) {
    return SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Match title
                          Center(
                            child: Text(
                              '${prediction.awayTeamName ?? 'TBD'} @ ${prediction.homeTeamName ?? 'TBD'}',
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Win Probability Section
                          _WinProbabilitySection(
                            awayTeamName: prediction.awayTeamName ?? 'Away',
                            homeTeamName: prediction.homeTeamName ?? 'Home',
                            awayWinProb: awayWinProb,
                            homeWinProb: homeWinProb,
                          ),
                          const SizedBox(height: 32),

                          // Team Statistics Section
                          _TeamStatisticsSection(
                            awayTeamName: prediction.awayTeamName ?? 'Away',
                            homeTeamName: prediction.homeTeamName ?? 'Home',
                            homeAdjustment: homeAdjustment,
                            awayAdjustment: awayAdjustment,
                            homeOverall: homeOverall,
                            awayOverall: awayOverall,
                          ),
                        ],
                      ),
                    );
  }

  Widget _buildError(Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              'Unable to load team statistics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Win Probability visualization with bar chart
class _WinProbabilitySection extends StatelessWidget {
  final String awayTeamName;
  final String homeTeamName;
  final double awayWinProb;
  final double homeWinProb;

  const _WinProbabilitySection({
    required this.awayTeamName,
    required this.homeTeamName,
    required this.awayWinProb,
    required this.homeWinProb,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Text(
          'Win Probability',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // Percentages row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Away team percentage
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  awayTeamName,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  '${awayWinProb.toStringAsFixed(0)}%',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: AppColors.accentOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Home team percentage
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  homeTeamName,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  '${homeWinProb.toStringAsFixed(0)}%',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: AppColors.accentGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Horizontal bar chart
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 12,
            child: Row(
              children: [
                // Away team bar (orange)
                Expanded(
                  flex: awayWinProb.toInt(),
                  child: Container(
                    color: AppColors.accentOrange,
                  ),
                ),
                // Home team bar (green)
                Expanded(
                  flex: homeWinProb.toInt(),
                  child: Container(
                    color: AppColors.accentGreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Team Statistics comparison table
class _TeamStatisticsSection extends StatelessWidget {
  final String awayTeamName;
  final String homeTeamName;
  final AdjustmentDto homeAdjustment;
  final AdjustmentDto awayAdjustment;
  final OverallDto homeOverall;
  final OverallDto awayOverall;

  const _TeamStatisticsSection({
    required this.awayTeamName,
    required this.homeTeamName,
    required this.homeAdjustment,
    required this.awayAdjustment,
    required this.homeOverall,
    required this.awayOverall,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Text(
          'Team Statistics',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // Statistics table
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _StatRow(
                label: 'Points Per Game',
                awayValue: awayAdjustment.pointsPerGame.toStringAsFixed(1),
                homeValue: homeAdjustment.pointsPerGame.toStringAsFixed(1),
                highlightAway: awayAdjustment.pointsPerGame > homeAdjustment.pointsPerGame,
              ),
              const Divider(height: 1),
              _StatRow(
                label: 'Points Allowed',
                awayValue: awayAdjustment.allowedPointsPerGame.toStringAsFixed(1),
                homeValue: homeAdjustment.allowedPointsPerGame.toStringAsFixed(1),
                highlightAway: awayAdjustment.allowedPointsPerGame < homeAdjustment.allowedPointsPerGame,
              ),
              const Divider(height: 1),
              _StatRow(
                label: 'Overall Rating',
                awayValue: awayOverall.overall.toStringAsFixed(1),
                homeValue: homeOverall.overall.toStringAsFixed(1),
                highlightAway: awayOverall.overall > homeOverall.overall,
              ),
              const Divider(height: 1),
              _StatRow(
                label: 'Home/Away Rating',
                awayValue: awayOverall.awayOverall.toStringAsFixed(1),
                homeValue: homeOverall.homeOverall.toStringAsFixed(1),
                highlightAway: awayOverall.awayOverall > homeOverall.homeOverall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Individual stat row in the comparison table
class _StatRow extends StatelessWidget {
  final String label;
  final String awayValue;
  final String homeValue;
  final bool highlightAway;

  const _StatRow({
    required this.label,
    required this.awayValue,
    required this.homeValue,
    this.highlightAway = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Away team value
          Expanded(
            child: Text(
              awayValue,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: highlightAway ? FontWeight.bold : FontWeight.normal,
                color: highlightAway
                    ? theme.colorScheme.primary
                    : theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),

          // Label (centered)
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Home team value
          Expanded(
            child: Text(
              homeValue,
              textAlign: TextAlign.end,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: !highlightAway ? FontWeight.bold : FontWeight.normal,
                color: !highlightAway
                    ? theme.colorScheme.primary
                    : theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
