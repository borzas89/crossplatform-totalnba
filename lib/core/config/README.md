# Environment Configuration

This directory contains environment-specific configuration for the TotalNBA app.

## Files

- `env_config.dart` - Environment configuration (dev, staging, production)

## Usage

### Getting Current Environment

```dart
import 'package:crossplatform_totalnba/core/config/env_config.dart';

// Get current environment config
final config = EnvConfig.current;
print(config.apiBaseUrl); // https://totalnba-64d9e912c803.herokuapp.com

// Check environment
if (EnvConfig.isDevelopment) {
  print('Running in development mode');
}
```

### Environment-Specific Builds

You can override the environment at build time using `--dart-define`:

```bash
# Development (default)
flutter run

# Staging
flutter run --dart-define=ENV=staging

# Production
flutter run --dart-define=ENV=production
flutter build apk --dart-define=ENV=production
flutter build ios --dart-define=ENV=production
flutter build macos --dart-define=ENV=production
```

## Environments

### Development
- **Base URL**: `http://localhost:8080` (Spring Boot local server)
- **Logging**: Enabled
- **Crash Reporting**: Disabled
- **Timeout**: 30 seconds

### Staging
- **Base URL**: `https://totalnba-64d9e912c803.herokuapp.com`
- **Logging**: Enabled
- **Crash Reporting**: Enabled
- **Timeout**: 60 seconds

### Production
- **Base URL**: `https://totalnba-64d9e912c803.herokuapp.com`
- **Logging**: Disabled
- **Crash Reporting**: Enabled
- **Timeout**: 60 seconds

## API Endpoints

All API endpoints are defined in `lib/core/constants/app_constants.dart`.

Example endpoints:
- Predictions: `/api/prediction/all-prediction/`
- Player Search: `/api/v2/nba-players/search?name={playerName}`
- Player Stats: `/api/v2/player-stat/all-player-stat/`

See `app_constants.dart` for the complete list.

## Adding New Environments

1. Add a new static const in `EnvConfig`:
```dart
static const EnvConfig myNewEnv = EnvConfig(
  environment: 'my-env',
  apiBaseUrl: 'https://my-api.com',
  enableLogging: true,
  enableCrashReporting: false,
  apiTimeout: 30000,
);
```

2. Update the `current` getter to include your environment:
```dart
static EnvConfig get current {
  switch (_currentEnv) {
    case 'my-env':
      return myNewEnv;
    // ... other cases
  }
}
```

3. Build with your environment:
```bash
flutter run --dart-define=ENV=my-env
```
