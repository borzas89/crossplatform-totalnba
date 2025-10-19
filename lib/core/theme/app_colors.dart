import 'package:flutter/material.dart';

/// App color palette matching the Android TotalNBA app design
/// Colors extracted from Android res/values/colors.xml
class AppColors {
  AppColors._();

  // ============================================================================
  // Primary Brand Colors
  // ============================================================================

  /// Main brand color - used in app bar, primary buttons, highlights
  static const Color primaryBlue = Color(0xFF4A5FBA);

  /// Darker variant of primary blue
  static const Color primaryBlueDark = Color(0xFF3A4F9A);

  /// Lighter variant of primary blue
  static const Color primaryBlueLight = Color(0xFF5A6FCA);

  // ============================================================================
  // Accent Colors
  // ============================================================================

  /// Orange accent - used for win probability, highlights
  static const Color accentOrange = Color(0xFFFF8C42);

  /// Green accent - success states, winning team indicators
  static const Color accentGreen = Color(0xFF4CAF50);

  /// Red accent - error states, losing team indicators
  static const Color accentRed = Color(0xFFF44336);

  // ============================================================================
  // Light Theme Colors
  // ============================================================================

  /// Light theme main background
  static const Color backgroundLight = Color(0xFFFAFAFA);

  /// Light theme surface (cards, sheets)
  static const Color surfaceLight = Color(0xFFFFFFFF);

  /// Light theme card background
  static const Color cardLight = Color(0xFFFFFFFF);

  /// Light theme primary text
  static const Color textPrimaryLight = Color(0xFF1A1A1A);

  /// Light theme secondary text (subtitles, captions)
  static const Color textSecondaryLight = Color(0xFF666666);

  // ============================================================================
  // Dark Theme Colors
  // ============================================================================

  /// Dark theme main background
  static const Color backgroundDark = Color(0xFF121212);

  /// Dark theme surface (cards, sheets)
  static const Color surfaceDark = Color(0xFF1E1E1E);

  /// Dark theme card background
  static const Color cardDark = Color(0xFF2A2A2A);

  /// Dark theme primary text
  static const Color textPrimaryDark = Color(0xFFFFFFFF);

  /// Dark theme secondary text
  static const Color textSecondaryDark = Color(0xFFB3B3B3);

  // ============================================================================
  // Common Colors
  // ============================================================================

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  /// Divider lines
  static const Color divider = Color(0xFFE0E0E0);

  /// Gray backgrounds
  static const Color grey = Color(0xFFEDEDED);

  // ============================================================================
  // NBA Team Colors (for backgrounds and indicators)
  // ============================================================================

  static const Color teamRed = Color(0xFFE03A3E);
  static const Color teamRedDark = Color(0xFFC8102E);
  static const Color teamRedLight = Color(0xFFCE1141);

  static const Color teamGreen = Color(0xFF007A33);
  static const Color teamGreenDark = Color(0xFF00471B);
  static const Color teamGreenLight = Color(0xFF6ECEB2);

  static const Color teamBlue = Color(0xFF00788C);
  static const Color teamBlueDark = Color(0xFF0E2240);
  static const Color teamBlueLight = Color(0xFF1D428A);
  static const Color teamBlueGrey = Color(0xFF5D76A9);

  static const Color teamOrange = Color(0xFFF58426);
  static const Color teamOrangeDark = Color(0xFFE56020);

  static const Color teamPurple = Color(0xFF552583);
  static const Color teamPurpleLight = Color(0xFF5A2D81);

  static const Color teamWine = Color(0xFF860038);
  static const Color teamWineDark = Color(0xFF98002E);

  static const Color teamBlack = Color(0xFF000000);

  // ============================================================================
  // Shadow Colors
  // ============================================================================

  /// Light shadow for elevated cards
  static Color get shadowLight => black.withOpacity(0.08);

  /// Medium shadow for floating elements
  static Color get shadowMedium => black.withOpacity(0.12);

  /// Dark shadow for modals and sheets
  static Color get shadowDark => black.withOpacity(0.16);

  // ============================================================================
  // Scrim/Overlay Colors
  // ============================================================================

  /// Scrim for modal bottom sheets
  static Color get scrim => black.withOpacity(0.5);

  /// Disabled overlay
  static Color get disabled => grey.withOpacity(0.5);
}
