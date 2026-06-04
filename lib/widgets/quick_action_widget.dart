import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/quick_action.dart';

class QuickActionItem extends StatelessWidget {
  final QuickAction action;
  const QuickActionItem({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: action.color,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(action.emoji, style: TextStyle(fontSize: 24)),
          ),
        ),
        SizedBox(height: 6),
        Text(
          action.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            // fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFF5A6478),
          ),
        ),
      ],
    );
  }
}
