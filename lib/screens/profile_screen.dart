import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_notifier.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationEnabled = true;
  bool isSocialEnabled = true;

  @override
  Widget build(BuildContext context) {
    // Access the ThemeNotifier from Provider.
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture + Name
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/placeholder.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'TheAlphamerc',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Loyal Reader',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Column(
                  children: [
                    Text('826', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Followers'),
                  ],
                ),
                Column(
                  children: [
                    Text('251', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Following'),
                  ],
                ),
                Column(
                  children: [
                    Text('81K', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('News Read'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Night Mode Toggle
            SwitchListTile(
              title: const Text('Night'),
              value: themeNotifier.isDarkMode,
              onChanged: (value) {
                themeNotifier.toggleTheme(value);
              },
            ),
            // Notifications
            SwitchListTile(
              title: const Text('Notification'),
              value: isNotificationEnabled,
              onChanged: (value) {
                setState(() => isNotificationEnabled = value);
              },
            ),
            // Social Media
            SwitchListTile(
              title: const Text('Social Media'),
              value: isSocialEnabled,
              onChanged: (value) {
                setState(() => isSocialEnabled = value);
              },
            ),
            const SizedBox(height: 20),
            // Logout Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle logout logic
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

