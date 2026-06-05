import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/global_variables.dart';
import 'package:flutter_assignment/data/dummy_data.dart';
import 'package:flutter_assignment/models/quick_action.dart';
import 'package:flutter_assignment/screens/contact_screen.dart';
import 'package:flutter_assignment/widgets/balance_card.dart';
import 'package:flutter_assignment/widgets/home_screen_contact_widget.dart';
import 'package:flutter_assignment/widgets/quick_action_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String user = 'John Doe';

    final size = MediaQuery.of(context).size;

    final List<QuickAction> actions = [
      QuickAction(emoji: '💸', label: 'Send\nMoney', color: Color(0xFFEDE9FF)),
      QuickAction(
        emoji: '📥',
        label: 'Request\nMoney',
        color: Color(0xFFE0F7EF),
      ),
      QuickAction(emoji: '🤳', label: 'Scan\n& Pay', color: Color(0xFFFFF3E0)),
      QuickAction(emoji: '🕐', label: 'History', color: Color(0xFFFCE4EC)),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              decoration: BoxDecoration(color: GlobalVariables.primaryColor),

              child: Stack(
                children: [
                  Positioned(
                    top: -30,
                    right: -10,
                    child: Container(
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: GlobalVariables.tertiaryColor.withValues(
                          alpha: 0.2,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: -20,
                    left: 30,
                    child: Container(
                      width: size.width * 0.25,
                      height: size.width * 0.25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: GlobalVariables.tertiaryColor.withValues(
                          alpha: 0.1,
                        ),
                      ),
                    ),
                  ),

                  SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                      ),
                      child: Column(
                        mainAxisSize: .min,
                        crossAxisAlignment: .start,
                        children: [
                          // name and profile viewing
                          Row(
                            mainAxisAlignment: .start,
                            children: [
                              Column(
                                crossAxisAlignment: .start,
                                mainAxisSize: .min,
                                children: [
                                  Text(
                                    'GREETINGS',
                                    style: GlobalVariables.smallText,
                                  ),
                                  Text(user, style: GlobalVariables.largeText),
                                ],
                              ),

                              Spacer(),

                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications,
                                  color: Colors.yellow,
                                  size: 35,
                                ),
                              ),

                              CircleAvatar(
                                backgroundColor:
                                    GlobalVariables.backgroundColor,
                                child: Text(
                                  HomeScreenContactWidget.getInitials(user),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: size.height * 0.025),

                          balanceCard(),
                          SizedBox(height: size.height * 0.025),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // quick action widgets
            Row(
              mainAxisAlignment: .start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: 10,
                  ),
                  child: Text(
                    'QUICK ACTIONS',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: .start,
              children: actions
                  .map((a) => Expanded(child: QuickActionItem(action: a)))
                  .toList(),
            ),

            // send to contacts
            SizedBox(height: size.height * 0.0175),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'SEND TO CONTACTS',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ContactScreen()),
                    ),
                    child: const Text(
                      'See all',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: contacts
                    .map(
                      (name) => SizedBox(
                        width: 80,
                        child: Padding(
                          padding: EdgeInsets.only(right: 19),
                          child: HomeScreenContactWidget(name: name),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
