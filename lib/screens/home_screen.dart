import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment/constants/global_variables.dart';
import 'package:flutter_assignment/data/dummy_data.dart';
import 'package:flutter_assignment/models/quick_action.dart';
import 'package:flutter_assignment/screens/contact_screen.dart';
import 'package:flutter_assignment/screens/user_profile_screen.dart';
import 'package:flutter_assignment/widgets/balance_card.dart';
import 'package:flutter_assignment/widgets/bill_category_grid.dart';
import 'package:flutter_assignment/widgets/home_screen_contact_widget.dart';
import 'package:flutter_assignment/widgets/offer_banner.dart';
import 'package:flutter_assignment/widgets/quick_action_widget.dart';
import 'package:flutter_assignment/widgets/settings_widgets.dart';
import 'package:flutter_assignment/widgets/snack_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollingDown = false;
  double _lastScrollPosition = 0;

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    final current = _scrollController.position.pixels;
    if (current > _lastScrollPosition && !_isScrollingDown) {
      setState(() => _isScrollingDown = true); // hide
    } else if (current < _lastScrollPosition && _isScrollingDown) {
      setState(() => _isScrollingDown = false); // show
    }
    _lastScrollPosition = current;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<QuickAction> actions = [
      QuickAction(emoji: '📱', label: 'Mobile Topup', color: Color(0xFFFFF3E0)),
      QuickAction(emoji: '💸', label: 'Send Money', color: Color(0xFFEDE9FF)),
      QuickAction(emoji: '📥', label: 'Load Money', color: Color(0xFFE0F7EF)),
      QuickAction(
        emoji: '🏦',
        label: 'Bank Transfer',
        color: Color(0xFFFCE4EC),
      ),
    ];

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: GlobalVariables.primaryColor,
                    ),

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
                                        Text(
                                          user,
                                          style: GlobalVariables.largeText,
                                        ),
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

                                    InkWell(
                                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const UserProfileScreen())),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            GlobalVariables.backgroundColor,
                                        child: Text(
                                          HomeScreenContactWidget.getInitials(
                                            user,
                                          ),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          ),
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
                  buildSectionHeader('QUICK ACTIONS', size),
                  Row(
                    crossAxisAlignment: .start,
                    children: actions
                        .map((a) => Expanded(child: QuickActionItem(action: a)))
                        .toList(),
                  ),

                  // send to contacts
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: 7,
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'SEND TO CONTACTS',
                          style: GlobalVariables.infoText,
                        ),

                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ContactScreen(),
                            ),
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
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
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

                  SizedBox(height: size.height * 0.02),

                  // offers banner
                  OfferBannerWidget(),

                  SizedBox(height: size.height * 0.01),

                  // payments and bills
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: 7,
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'RECHARGE & PAY BILLS',
                          style: GlobalVariables.infoText,
                        ),

                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'More',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),

                  BillCategoryGrid(),
                ],
              ),
            ),

            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: AnimatedSlide(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                offset: (_isScrollingDown) ? Offset(0, 2) : Offset.zero,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: GlobalVariables.primaryColor.withValues(
                          alpha: 0.7,
                        ),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () =>
                        showSnackBar(context, 'Opening Camera....'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalVariables.primaryColor,
                      shape: CircleBorder(),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: Icon(Icons.qr_code, color: Colors.white, size: 35),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
