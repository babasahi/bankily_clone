import 'package:demo_project/screens/favorites_screen.dart';
import 'package:demo_project/screens/help_screen.dart';
import 'package:demo_project/screens/home_screen.dart';
import 'package:demo_project/screens/notifications_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentScreen = 0;

  List<Widget> screens = [
    HomeScreen(),
    FavoritesScreen(),
    NotificationsScreen(),
    HelpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: screens[currentScreen],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                currentScreen = value;
              });
            },
            currentIndex: currentScreen,
            selectedItemColor: Color.fromRGBO(56, 186, 216, 1),
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            iconSize: 28,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'المنزل',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star_border),
                label: 'المفضلة',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'إشعارات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help_outline_outlined),
                label: 'المساعدة',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
