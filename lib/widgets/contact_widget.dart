import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/global_variables.dart';

class ContactView extends StatelessWidget {
  final String name;
  const ContactView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 27,
          backgroundColor: getAvatarColor(name),
          child: Text(
            getInitials(name),
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF5A6478),
          ),
        ),
      ],
    );
  }

  static String getInitials(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return '';

    final parts = trimmed.split(' ');
    if (parts.length == 1) {
      return parts[0].substring(0, 1).toUpperCase();
    }

    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  static Color getAvatarColor(String name) {
    final index = name.codeUnits.first % GlobalVariables.avatarColors.length;
    return GlobalVariables.avatarColors[index];
  }
}
