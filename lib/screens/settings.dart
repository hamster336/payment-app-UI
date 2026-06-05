import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/global_variables.dart';
import 'package:flutter_assignment/widgets/snack_bar.dart';
import 'package:flutter_assignment/widgets/settings_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool biometricEnabled = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.primaryColor,
        title: Text('Settings', style: GlobalVariables.largeText),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            buildSectionHeader('ACCOUNT', size),
            buildSettingsTile(
              icon: Icons.person_rounded,
              title: 'Profile Settings',
              subtitle: 'Manage your personal information',
              onTap: () => showSnackBar(context, 'Opening Profile Settings'),
              size: size,
            ),
            buildSettingsTile(
              icon: Icons.lock_rounded,
              title: 'Security & Privacy',
              subtitle: 'Password, 2FA, privacy controls',
              onTap: () => showSnackBar(context, 'Opening Security Settings'),
              size: size,
            ),
            buildDivider(size),

            // Preferences Section
            buildSectionHeader('PREFERENCES', size),
            buildToggleTile(
              icon: Icons.notifications_rounded,
              title: 'Notifications',
              subtitle: 'Get alerts for transactions',
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() => notificationsEnabled = value);
              },
              size: size,
            ),

            buildDivider(size),

            // Security Section
            buildSectionHeader('SECURITY', size),
            buildToggleTile(
              icon: Icons.fingerprint_rounded,
              title: 'Biometric Authentication',
              subtitle: 'Fingerprint or Face ID',
              value: biometricEnabled,
              onChanged: (value) {
                setState(() => biometricEnabled = value);
              },
              size: size,
            ),
            buildSettingsTile(
              icon: Icons.devices_rounded,
              title: 'Active Sessions',
              subtitle: 'Manage logged in devices',
              onTap: () => showSnackBar(context, 'Opening Active Sessions'),
              size: size,
            ),
            buildDivider(size),

            // Support Section
            buildSectionHeader('SUPPORT', size),
            buildSettingsTile(
              icon: Icons.help_rounded,
              title: 'Help & Support',
              subtitle: 'FAQs and contact support',
              onTap: () => showSnackBar(context, 'Opening Help & Support'),
              size: size,
            ),
            buildSettingsTile(
              icon: Icons.description_rounded,
              title: 'Terms & Conditions',
              subtitle: 'Read our policies',
              onTap: () => showSnackBar(context, 'Opening Terms & Conditions'),
              size: size,
            ),
            buildSettingsTile(
              icon: Icons.info_rounded,
              title: 'About App',
              subtitle: 'Version 1.0.0',
              onTap: () => showSnackBar(context, 'App Version 1.0.0'),
              size: size,
            ),
            buildDivider(size),

            // Logout Button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.025,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _showLogoutDialog(context),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFFF6B6B).withValues(alpha: 0.15),
                        border: Border.all(
                          color: Color(0xFFFF6B6B),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Color(0xFFFF6B6B),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout', style: TextStyle(fontWeight: FontWeight.w700)),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              showSnackBar(context, 'Logged out successfully');
            },
            child: Text('Logout', style: TextStyle(color: Color(0xFFFF6B6B))),
          ),
        ],
      ),
    );
  }
}
