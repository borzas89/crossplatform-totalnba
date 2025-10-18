# crossplatform-totalnba

TotalNBA - NBA Predictions & Statistics (Cross-Platform)

## 🏀 About

Cross-platform mobile app for NBA game predictions and player statistics. Built with Flutter for iOS and Android from a single codebase.

## 🚀 Features

- NBA Game Predictions
- Player Search & Statistics
- Team Standings
- Match Results History
- Push Notifications
- Offline Support

## 🛠️ Tech Stack

- **Framework**: Flutter
- **State Management**: Riverpod
- **Navigation**: go_router
- **Networking**: Dio + Retrofit
- **Local Database**: Drift (SQLite)
- **Dependency Injection**: get_it + injectable
- **Backend**: Spring Boot (totalnba)
- **Firebase**: Analytics, Crashlytics, Messaging

## 📦 Project Structure

```
lib/
├── core/           # Core utilities, theme, constants
├── data/           # Data layer (models, repositories, data sources)
├── domain/         # Business logic (entities, use cases)
└── presentation/   # UI layer (screens, widgets, providers)
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.35.6+)
- Android Studio / VS Code
- Xcode (for iOS development)
- Spring Boot backend running (totalnba)

### Installation

```bash
# Install dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

### Backend Configuration

Update the API URL in `lib/core/constants/app_constants.dart`:

```dart
static const String baseUrl = 'http://YOUR_BACKEND_URL:8080';
```

## 📱 Running

```bash
# Android
flutter run

# iOS
flutter run -d ios

# Specific device
flutter devices
flutter run -d <device_id>
```

## 🧪 Testing

```bash
# Unit tests
flutter test

# Integration tests
flutter test integration_test/
```

## 📖 Documentation

See `/Users/borzazsolt/Documents/GitHub/totalStatsAgents/` for:
- Complete migration plan
- Architecture documentation
- Agent usage guides

## 🤖 Development with AI Agents

Use Claude Code agents for development:

```
/flutter-migration-agent - Migration guidance
/feature-builder - Build new features
```

## 📄 License

Private project for TotalNBA

---

**Migrated from**: TotalNba-Android (Kotlin + Jetpack Compose)
**Created**: 2025-10-18
