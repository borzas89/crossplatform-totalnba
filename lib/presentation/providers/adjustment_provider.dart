import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/di/injection.dart';
import '../../data/models/adjustment_dto.dart';
import '../../data/network/api_client.dart';

part 'adjustment_provider.g.dart';

/// Provider for fetching adjustments for both teams in a match (by team aliases)
/// Uses the /api/adjustments endpoint with teamName query parameter
/// Makes TWO separate API calls (one for each team) since the endpoint only accepts one team at a time
@riverpod
Future<Map<String, AdjustmentDto>> matchAdjustments(
  Ref ref,
  String homeTeamAlias,
  String awayTeamAlias,
) async {
  final apiClient = getIt<ApiClient>();

  // Fetch both team adjustments using team aliases (e.g., PHI, MIL)
  // Note: Must make 2 separate API calls since /api/adjustments only accepts one teamName
  final homeAdjustment = await apiClient.getAdjustmentByTeam(homeTeamAlias);
  final awayAdjustment = await apiClient.getAdjustmentByTeam(awayTeamAlias);

  return {
    'home': homeAdjustment,
    'away': awayAdjustment,
  };
}
