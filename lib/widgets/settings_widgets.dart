import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/global_variables.dart';

// section headers
Widget buildSectionHeader(String title, Size size) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 7),
    child: Row(children: [Text(title, style: GlobalVariables.infoText)]),
  );
}

// setting tiles
Widget buildSettingsTile({
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
  required Size size,
}) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
      leading: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: GlobalVariables.backgroundColor.withValues(alpha: 0.15),
        ),
        child: Icon(icon, color: GlobalVariables.backgroundColor, size: 22),
      ),

      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF2C3E50),
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),

      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),

      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.grey.shade400,
        size: 16,
      ),
    ),
  );
}

// setting tiles with toggles
Widget buildToggleTile({
  required IconData icon,
  required String title,
  required String subtitle,
  required bool value,
  required ValueChanged<bool> onChanged,
  required Size size,
}) {
  return InkWell(
    onTap: () => onChanged(!value),
    child: ListTile(
      leading: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: GlobalVariables.backgroundColor.withValues(alpha: 0.15),
        ),
        child: Icon(icon, color: GlobalVariables.backgroundColor, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF2C3E50),
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),

      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),

      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: GlobalVariables.backgroundColor,
      ),
    ),
  );
}

// custom divider
Widget buildDivider(Size size) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * 0.04,
      vertical: size.height * 0.01,
    ),
    child: Divider(color: Colors.grey.withValues(alpha: 0.15), height: 1),
  );
}
