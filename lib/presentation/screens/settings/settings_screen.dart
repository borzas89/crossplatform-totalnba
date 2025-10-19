import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/settings_provider.dart';

/// Settings screen - App configuration and preferences
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider);
    final notificationsEnabled = ref.watch(notificationsEnabledProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          // Notifications Toggle
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            subtitle: const Text('Manage push notifications'),
            trailing: Switch(
              value: notificationsEnabled,
              onChanged: (value) {
                ref.read(notificationsEnabledProvider.notifier).setNotificationsEnabled(value);
              },
            ),
          ),
          const Divider(),

          // Theme Mode Selector
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Theme'),
            subtitle: Text(_getThemeModeLabel(themeMode)),
            trailing: DropdownButton<ThemeMode>(
              value: themeMode,
              underline: const SizedBox.shrink(),
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  ref.read(appThemeModeProvider.notifier).setThemeMode(value);
                }
              },
            ),
          ),
          const Divider(),

          // Language (TODO for future)
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: const Text('English'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Language selection - Coming soon')),
              );
            },
          ),
          const Divider(),

          const SizedBox(height: 24),

          // About Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('TotalNBA'),
                    const Text('Version 1.0.0'),
                    const SizedBox(height: 8),
                    Text(
                      'AI-Powered NBA Predictions & Statistics',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 12),
                    TextButton.icon(
                      onPressed: () => _showAboutDialog(context),
                      icon: const Icon(Icons.info_outline),
                      label: const Text('More Info'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Legal Links
          Center(
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Privacy Policy - Coming soon')),
                );
              },
              child: const Text('Privacy Policy'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Terms of Service - Coming soon')),
                );
              },
              child: const Text('Terms of Service'),
            ),
          ),
        ],
      ),
    );
  }

  String _getThemeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light theme';
      case ThemeMode.dark:
        return 'Dark theme';
      case ThemeMode.system:
        return 'Follow system setting';
    }
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'TotalNBA',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(
        Icons.sports_basketball,
        size: 48,
        color: Colors.orange,
      ),
      children: [
        const SizedBox(height: 16),
        const Text(
          'TotalNBA is an AI-powered NBA prediction and statistics app that helps you stay up-to-date with the latest match predictions and player stats.',
        ),
        const SizedBox(height: 16),
        const Text(
          'Features:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text('• AI-powered match predictions'),
        const Text('• Real-time player statistics'),
        const Text('• Historical results tracking'),
        const Text('• Offline data caching'),
      ],
    );
  }
}
