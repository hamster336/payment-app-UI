import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/quick_action.dart';
import 'package:flutter_assignment/widgets/snack_bar.dart';

class QuickActionItem extends StatelessWidget {
  final QuickAction action;
  const QuickActionItem({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => showSnackBar(context, 'Opening ${action.label}....'),
          child: Container(
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
        ),
        SizedBox(height: 6),
        SizedBox(
          width: 70,
          child: Text(
            action.label,
            textAlign: TextAlign.center,
            overflow: .visible,
            maxLines: 2,
            style: TextStyle(
              // fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5A6478),
            ),
          ),
        ),
      ],
    );
  }
}
