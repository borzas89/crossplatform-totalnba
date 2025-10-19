import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/di/injection.dart';
import '../../domain/services/settings_service.dart';

part 'settings_provider.g.dart';

/// Provider for SettingsService
@riverpod
SettingsService settingsService(SettingsServiceRef ref) {
  return getIt<SettingsService>();
}

/// Provider for theme mode
@riverpod
class AppThemeMode extends _$AppThemeMode {
  late final SettingsService _settingsService;

  @override
  ThemeMode build() {
    _settingsService = ref.watch(settingsServiceProvider);
    final mode = _settingsService.getThemeMode();
    return _parseThemeMode(mode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _settingsService.setThemeMode(_stringFromThemeMode(mode));
    state = mode;
  }

  ThemeMode _parseThemeMode(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _stringFromThemeMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
}

/// Provider for notifications enabled state
@riverpod
class NotificationsEnabled extends _$NotificationsEnabled {
  late final SettingsService _settingsService;

  @override
  bool build() {
    _settingsService = ref.watch(settingsServiceProvider);
    return _settingsService.getNotificationsEnabled();
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    await _settingsService.setNotificationsEnabled(enabled);
    state = enabled;
  }
}
