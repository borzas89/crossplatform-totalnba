/// Utility class for calculating win probabilities using LOG5 formula
/// Based on Android implementation from DetailBottomSheetViewModel
class WinProbabilityCalculator {
  WinProbabilityCalculator._();

  /// Calculate win probability using LOG5 formula
  /// Formula: (h - h*a) / (h + a - 2*h*a)
  /// where h = home team percentage, a = away team percentage
  ///
  /// Values are clamped between 0.01 and 0.99 to prevent extreme probabilities
  static double log5(double homeValue, double awayValue) {
    final h = homeValue.clamp(0.01, 0.99);
    final a = awayValue.clamp(0.01, 0.99);
    return (h - h * a) / (h + a - 2 * h * a);
  }

  /// Calculate weighted win probability for home team
  ///
  /// Uses a weighted average of three factors:
  /// - 60% weight on season win percentages (home vs away)
  /// - 20% weight on overall win percentages
  /// - 20% weight on last 10 game streak
  ///
  /// Parameters:
  /// - [homeWinPct]: Home team's home win percentage (0.0-1.0)
  /// - [awayWinPct]: Away team's away win percentage (0.0-1.0)
  /// - [homeTotalPct]: Home team's overall win percentage (0.0-1.0)
  /// - [awayTotalPct]: Away team's overall win percentage (0.0-1.0)
  /// - [homeLastTen]: Home team's last 10 games percentage (0.0-1.0)
  /// - [awayLastTen]: Away team's last 10 games percentage (0.0-1.0)
  ///
  /// Returns: Win probability as a percentage (0-100)
  static double calculateHomeWinProbability({
    required double homeWinPct,
    required double awayWinPct,
    required double homeTotalPct,
    required double awayTotalPct,
    required double homeLastTen,
    required double awayLastTen,
  }) {
    return (0.6 * log5(homeWinPct, awayWinPct) +
            0.2 * log5(homeTotalPct, awayTotalPct) +
            0.2 * log5(homeLastTen, awayLastTen)) *
        100;
  }

  /// Calculate weighted win probability for away team
  ///
  /// Simply returns 100 minus the home team probability
  static double calculateAwayWinProbability({
    required double homeWinPct,
    required double awayWinPct,
    required double homeTotalPct,
    required double awayTotalPct,
    required double homeLastTen,
    required double awayLastTen,
  }) {
    return 100 -
        calculateHomeWinProbability(
          homeWinPct: homeWinPct,
          awayWinPct: awayWinPct,
          homeTotalPct: homeTotalPct,
          awayTotalPct: awayTotalPct,
          homeLastTen: homeLastTen,
          awayLastTen: awayLastTen,
        );
  }
}
