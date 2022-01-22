// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, annotate_overrides, prefer_final_fields, unused_field, prefer_const_constructors_in_immutables

import 'package:easydorm/constants.dart';
import 'package:easydorm/screens/warden_screens/wardensignin_screen.dart';
import 'package:flutter/material.dart';
import 'package:easydorm/screens/login_signup%20files/signin_screen.dart';

import 'admin_screens/adminsignin_screen.dart';
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF0A0E2A)),
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  final List<Widget> _screens = [
    SignInScreen(),
    WardenSignInScreen(),
    AdminSignInScreen()
  ];
  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        scrollDirection: Axis.horizontal,
      ),
      bottomNavigationBar: Container(
        height: 79,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.zero),
          color: Colors.white,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryPurple,
          elevation: 10,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: textTheme.caption,
          unselectedLabelStyle: textTheme.caption,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              title: Text('Student',
                  style: TextStyle(
                      color: _selectedIndex == 0
                          ? Color(0xFF3CF7FB)
                          : Colors.white)),
              icon: Icon(Icons.people,
                  color:
                      _selectedIndex == 0 ? Color(0xFF3CF7FB) : Colors.white),
            ),
            BottomNavigationBarItem(
              title: Text('Warden',
                  style: TextStyle(
                      color: _selectedIndex == 1
                          ? Color(0xFF3CF7FB)
                          : Colors.white)),
              icon: Icon(Icons.people,
                  color:
                      _selectedIndex == 1 ? Color(0xFF3CF7FB) : Colors.white),
            ),
            BottomNavigationBarItem(
              title: Text('Admin',
                  style: TextStyle(
                      color: _selectedIndex == 2
                          ? Color(0xFF3CF7FB)
                          : Colors.white)),
              icon: Icon(Icons.people,
                  color:
                      _selectedIndex == 2 ? Color(0xFF3CF7FB) : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
