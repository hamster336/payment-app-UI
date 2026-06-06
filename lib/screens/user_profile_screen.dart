import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/global_variables.dart';
import 'package:flutter_assignment/data/dummy_data.dart';
import 'package:flutter_assignment/widgets/home_screen_contact_widget.dart';
import 'package:flutter_assignment/widgets/profile_screen_card.dart';
import 'package:flutter_assignment/widgets/settings_widgets.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool showBalance = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: GlobalVariables.largeText),
        backgroundColor: GlobalVariables.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: GlobalVariables.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: .start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: GlobalVariables.backgroundColor,
                          child: Text(
                            HomeScreenContactWidget.getInitials(user),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              user,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '+977 980-0000000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: const Color.fromARGB(255, 7, 249, 43),
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Active',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      9,
                                      238,
                                      85,
                                    ),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: const Color.fromARGB(255, 47, 120, 51),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: const Color.fromARGB(255, 7, 249, 43),
                                size: 18,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Verified',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 9, 238, 85),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    buildDivider(size),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showBalance = !showBalance;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          // wallet balance
                          Text(
                            (showBalance) ? balance : '₹ XXXX.XX',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),

                          // reward points
                          Text(
                            (showBalance) ? reward : 'XXX.XX',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Balance',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Text(
                          'Reward Points',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            buildSectionHeader('MY ACCOUNT', size),

            profileScreenCard(
              icon: Icons.business_center,
              title: 'Business Accounts',
              subtitle: 'View your associated businnes accounts',
            ),
            profileScreenCard(
              icon: Icons.calendar_month,
              title: 'My Calender',
              subtitle: 'View all your events from one place',
            ),
            profileScreenCard(
              icon: Icons.speed,
              title: 'Transaction Limits',
              subtitle: 'View your transaction limits',
            ),
            profileScreenCard(
              icon: Icons.devices,
              title: 'Devices & Credentials',
              subtitle: 'Manage your devices and credentials',
            ),

            buildDivider(size),
            buildSectionHeader('Others', size),

            buildSettingsTile(
              icon: Icons.email,
              title: 'Change email',
              subtitle: 'Set up your email address',
              onTap: () {},
              size: size,
            ),

            buildSettingsTile(
              icon: Icons.question_mark_rounded,
              title: 'Recovery questions',
              subtitle: 'Set up recovery questions',
              onTap: () {},
              size: size,
            ),

            buildSettingsTile(
              icon: Icons.person_add_alt_1_rounded,
              title: 'Invite a friend',
              subtitle: 'Invite people to get rewards',
              onTap: () {},
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
