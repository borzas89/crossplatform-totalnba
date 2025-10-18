# Network Layer

This directory contains the API client and network-related code.

## Files

- `api_client.dart` - Retrofit API interface
- `api_client.g.dart` - Auto-generated Retrofit implementation

## Data Models

Located in `lib/data/models/`:

- `predicted_match_dto.dart` - Predicted NBA matches
- `player_stat_dto.dart` - Player statistics
- `nba_player_dto.dart` - NBA player search results

## Usage

### Getting the API Client

```dart
import 'package:crossplatform_totalnba/core/di/injection.dart';
import 'package:crossplatform_totalnba/data/network/api_client.dart';

final apiClient = getIt<ApiClient>();
```

### Example: Fetch Predictions

```dart
// Get all predictions
final predictions = await apiClient.getAllPredictions();

// Get predictions by week
final weekPredictions = await apiClient.getPredictionsByWeek(15);

// Get predictions by day
final dayPredictions = await apiClient.getPredictionsByDay('2025-10-25');
```

### Example: Search Players

```dart
// Search for a player
final players = await apiClient.searchPlayers('LeBron');

for (final player in players) {
  print('${player.fullName} - ${player.teamAbbreviation}');
}
```

### Example: Get Player Stats

```dart
// Get all player stats
final allStats = await apiClient.getAllPlayerStats();

// Get stats for specific player
final playerStats = await apiClient.getPlayerStatsByName('Stephen Curry');

// Get stats for a team
final teamStats = await apiClient.getPlayerStatsByTeam('Lakers');
```

## Available Endpoints

### Predictions
- `getAllPredictions()` - Get all predicted matches
- `getPredictionsByWeek(week)` - Get predictions for a specific week
- `getPredictionsByDay(day)` - Get predictions for a specific day

### Player Statistics
- `getAllPlayerStats()` - Get all player statistics
- `getPlayerStatsByName(name)` - Get stats for a specific player
- `getPlayerStatsByTeam(team)` - Get stats for players on a team
- `getAggregatedPlayerStats(player)` - Get aggregated stats for a player
- `getAllAggregatedStats()` - Get all aggregated statistics

### Player Search
- `searchPlayers(name)` - Search for NBA players by name

## Error Handling

The API client uses Dio, which throws `DioException` on errors:

```dart
try {
  final predictions = await apiClient.getAllPredictions();
  // Process predictions
} on DioException catch (e) {
  if (e.type == DioExceptionType.connectionTimeout) {
    print('Connection timeout');
  } else if (e.type == DioExceptionType.receiveTimeout) {
    print('Receive timeout');
  } else if (e.response?.statusCode == 404) {
    print('Not found');
  } else {
    print('Error: ${e.message}');
  }
}
```

## Data Models

### PredictedMatchDto

```dart
{
  "commonMatchId": "401234567",
  "homeTeamName": "Los Angeles Lakers",
  "awayTeamName": "Golden State Warriors",
  "homeTeamAlias": "LAL",
  "awayTeamAlias": "GSW",
  "predictedHomeScore": 112.5,
  "predictedAwayScore": 108.3,
  "predictedTotal": 220.8,
  "spread": -4.2,
  "weekName": "Week 15",
  "weekNumber": 15,
  "matchDate": 1729872000000  // Unix timestamp in milliseconds
}
```

### PlayerStatDto

```dart
{
  "id": 1,
  "full_name": "LeBron James",
  "team": "Los Angeles Lakers",
  "position": "F",
  "game_played": 72,
  "points_per_game": 27.5,
  "rebounds_per_game": 7.8,
  "assists_per_game": 8.3,
  "steals_per_game": 1.2,
  "pics_id": "lebron_james",
  "two_points_per_game": 8.5,
  "three_points_per_game": 2.1,
  "pra_per_game": 43.6,
  "points_assists_per_game": 35.8
}
```

### NbaPlayerDto

```dart
{
  "id": 1,
  "personId": 2544,
  "fullName": "LeBron James",
  "firstName": "LeBron",
  "lastName": "James",
  "teamAbbreviation": "LAL",
  "position": "F",
  "rosterStatus": 1
}
```

## Date Handling

Dates from the API come as Unix timestamps in milliseconds. The DTOs automatically convert them:

```dart
final prediction = await apiClient.getPredictionsByDay('2025-10-25');
final matchDate = prediction.first.matchDate; // DateTime object
print(matchDate.toIso8601String()); // "2025-10-25T..."
```

## Code Generation

After modifying DTOs or the API client, regenerate code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This generates:
- `.freezed.dart` files (immutable models)
- `.g.dart` files (JSON serialization)
- `api_client.g.dart` (Retrofit implementation)

## Testing

Mock the API client in tests:

```dart
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
  });

  test('fetch predictions', () async {
    when(mockApiClient.getAllPredictions())
        .thenAnswer((_) async => [
          PredictedMatchDto(commonMatchId: '1', /* ... */),
        ]);

    final result = await mockApiClient.getAllPredictions();
    expect(result, hasLength(1));
  });
}
```

## Best Practices

1. **Use in repositories** - Don't call API client directly from UI
2. **Handle errors** - Always wrap API calls in try-catch
3. **Use DTOs** - Keep API models separate from domain models
4. **Cache responses** - Implement caching in the repository layer
5. **Test with mocks** - Mock the API client for unit tests
