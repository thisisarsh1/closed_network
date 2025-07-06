import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Settings',
          style: GoogleFonts.sora(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [

          _buildSectionTitle('Account'),
          _buildTile(
            icon: Icons.person,
            title: 'Edit Profile',
            onTap: () {
              // Navigate to Edit Profile
            },
          ),
          _buildTile(
            icon: Icons.lock,
            title: 'Privacy',
            onTap: () {
              // Navigate to Privacy Settings
            },
          ),

          const SizedBox(height: 24),
          _buildSectionTitle('Preferences'),
          SwitchListTile(
            title: Text('Notifications',
                style: GoogleFonts.sora(color: Colors.white)),
            value: true,
            onChanged: (val) {
              // Handle notification toggle
            },
            activeColor: Colors.tealAccent,
            secondary: const Icon(Icons.notifications, color: Colors.white),
          ),

          const SizedBox(height: 24),
          _buildSectionTitle('Support'),
          _buildTile(
            icon: Icons.info_outline,
            title: 'About',
            onTap: () {
              // Show about dialog
            },
          ),
          _buildTile(
            icon: Icons.logout,
            title: 'Log Out',
            onTap: () {
              // Handle log out
            },
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    Color color = Colors.white,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: GoogleFonts.sora(color: color)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: GoogleFonts.sora(
          color: Colors.grey[400],
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
