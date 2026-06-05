import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/global_variables.dart';
import 'package:flutter_assignment/widgets/snack_bar.dart';
import 'package:flutter_assignment/widgets/home_screen_contact_widget.dart';

// contact card
Widget buildContactCard(BuildContext context, String contact, Size size) {
  return Card(
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.01,
      ),
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: HomeScreenContactWidget.getAvatarColor(
                contact,
              ).withValues(alpha: 0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 28,
          backgroundColor: HomeScreenContactWidget.getAvatarColor(contact),
          child: Text(
            HomeScreenContactWidget.getInitials(contact),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
      title: Text(
        contact,
        style: TextStyle(
          color: Color(0xFF2C3E50),
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        '+977 984- ${((contact.hashCode % 9000000) + 1000000).toString()}',
        style: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // call contact button
          buildActionButton(
            icon: Icons.call_rounded,
            color: Color(0xFF00B894),
            onTap: () {
              showSnackBar(context, 'Calling $contact...');
            },
          ),
          SizedBox(width: 8),

          // send money button
          buildActionButton(
            icon: Icons.send_rounded,
            color: GlobalVariables.backgroundColor,
            onTap: () {
              showSnackBar(context, 'Sending money to $contact...');
            },
          ),
        ],
      ),
    ),
  );
}

// action button
Widget buildActionButton({
  required IconData icon,
  required Color color,
  required VoidCallback onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color.withValues(alpha: 0.15),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    ),
  );
}
