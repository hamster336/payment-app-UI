import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/global_variables.dart';
import 'package:flutter_assignment/screens/home_screen.dart';
import 'package:flutter_assignment/screens/payment_history_screen.dart';
import 'package:flutter_assignment/screens/settings.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(builder: (_) => HomeScreen());
            },
          ),
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (_) => const PaymentHistoryScreen(),
              );
            },
          ),
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(builder: (_) => const SettingsScreen());
            },
          ),
        ],
      ),

      // bottom navigation Bar
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          if (currentPageIndex != value) {
            setState(() => currentPageIndex = value);
          }
        },
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home_rounded,

              color: GlobalVariables.backgroundColor,
            ),
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.timer),
            selectedIcon: Icon(
              Icons.timer,

              color: GlobalVariables.backgroundColor,
            ),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            selectedIcon: Icon(
              Icons.settings,

              color: GlobalVariables.backgroundColor,
            ),
            label: 'Settings',
          ),
        ],
        // labelTextStyle: WidgetStateProperty.all(TextStyle(fontSize: 16)),
      ),
    );
  }
}
