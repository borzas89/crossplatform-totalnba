// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsServiceHash() => r'81dbfc5f73ab551d3e574d18fd52c93fadfd120d';

/// Provider for SettingsService
///
/// Copied from [settingsService].
@ProviderFor(settingsService)
final settingsServiceProvider = AutoDisposeProvider<SettingsService>.internal(
  settingsService,
  name: r'settingsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SettingsServiceRef = AutoDisposeProviderRef<SettingsService>;
String _$appThemeModeHash() => r'53b65cf571b3ecd33f303879d15f152086c35d13';

/// Provider for theme mode
///
/// Copied from [AppThemeMode].
@ProviderFor(AppThemeMode)
final appThemeModeProvider =
    AutoDisposeNotifierProvider<AppThemeMode, ThemeMode>.internal(
  AppThemeMode.new,
  name: r'appThemeModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appThemeModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppThemeMode = AutoDisposeNotifier<ThemeMode>;
String _$notificationsEnabledHash() =>
    r'55f31b2a47d397f9260355d8d029c34e8bc9c15d';

/// Provider for notifications enabled state
///
/// Copied from [NotificationsEnabled].
@ProviderFor(NotificationsEnabled)
final notificationsEnabledProvider =
    AutoDisposeNotifierProvider<NotificationsEnabled, bool>.internal(
  NotificationsEnabled.new,
  name: r'notificationsEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationsEnabled = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
