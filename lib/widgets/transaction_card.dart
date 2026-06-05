import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/snack_bar.dart';

Widget buildTransactionCard(
  BuildContext context,
  Map<String, dynamic> transaction,
  Size size,
) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ],
      border: Border.all(color: Colors.grey.withValues(alpha: 0.08), width: 1),
    ),
    child: ListTile(
      onTap: () {
        showSnackBar(context, 'Transaction details for ${transaction['name']}');
      },

      // Transaction icon
      leading: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: transaction['color'].withValues(alpha: 0.15),
        ),
        child: Icon(transaction['icon'], color: transaction['color'], size: 20),
      ),
      // SizedBox(width: size.width * 0.03),
      // Transaction details
      title: Text(
        transaction['name'],
        style: TextStyle(
          color: Color(0xFF2C3E50),
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
      // SizedBox(height: 4),
      subtitle: Text(
        transaction['date'],
        style: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),

      trailing: Text(
        transaction['amount'],
        style: TextStyle(
          color: transaction['type'] == 'sent'
              ? Color(0xFFFF6B6B)
              : Color(0xFF00B894),
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    ),
  );
}
