import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/global_variables.dart';

Widget balanceCard() {
  bool showBalance = true;

  return StatefulBuilder(
    builder: (context, setState) => Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: .start,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text('WALLET BALANCE', style: GlobalVariables.smallText),
              Text(
                (!showBalance) ? '₹ XXXX.XX' : '₹ 13,640.13',
                style: GlobalVariables.largeText,
              ),
              Text(
                '+ ₹ ${(!showBalance) ? 'XXXX.XX' : '3,400'} addded this month',
                style: TextStyle(
                  color: Colors.greenAccent.shade400,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          Spacer(),

          IconButton(
            onPressed: () {
              setState(() => showBalance = !showBalance);
            },
            icon: Icon(
              (!showBalance) ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    ),
  );
}
