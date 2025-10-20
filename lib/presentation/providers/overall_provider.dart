import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/di/injection.dart';
import '../../data/models/overall_dto.dart';
import '../../data/network/api_client.dart';

part 'overall_provider.g.dart';

/// Provider for fetching overall statistics for both teams in a match
/// Uses the /api/overalls endpoint with FULL team names
/// Example: homeName="Philadelphia 76ers", awayName="New York Knicks"
@riverpod
Future<Map<String, OverallDto>> matchOveralls(
  Ref ref,
  String homeTeamName,
  String awayTeamName,
) async {
  final apiClient = getIt<ApiClient>();

  // Fetch overalls for both teams using FULL team names
  final results = await apiClient.getOverallsByTeams(
    homeTeamName,
    awayTeamName,
  );

  // The API returns a list with [0] = home team, [1] = away team
  if (results.length < 2) {
    throw Exception('Expected 2 overall records, got ${results.length}');
  }

  return {
    'home': results[0],
    'away': results[1],
  };
}
