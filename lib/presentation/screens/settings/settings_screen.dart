import 'package:flutter/material.dart';

/// Settings screen - App configuration and preferences
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            subtitle: const Text('Manage push notifications'),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // TODO: Implement notification toggle
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            subtitle: const Text('Toggle dark theme'),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                // TODO: Implement theme toggle
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: const Text('English'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Implement language selection
            },
          ),
          const Divider(),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('TotalNBA'),
                    Text('Version 1.0.0'),
                    SizedBox(height: 8),
                    Text(
                      'NBA Predictions & Statistics',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () {
                // TODO: Show about dialog
              },
              child: const Text('Privacy Policy'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                // TODO: Show terms dialog
              },
              child: const Text('Terms of Service'),
            ),
          ),
        ],
      ),
    );
  }
}
