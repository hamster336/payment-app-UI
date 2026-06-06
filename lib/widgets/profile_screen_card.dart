import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/global_variables.dart';

Widget profileScreenCard({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return ListTile(
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
  );
}
