import 'package:cloudstok_ticketing/constants/colors.dart';
import 'package:cloudstok_ticketing/modules/screens/pages/account_page.dart';
import 'package:cloudstok_ticketing/modules/screens/pages/homepage.dart';
import 'package:cloudstok_ticketing/modules/screens/pages/profile_page.dart';
import 'package:cloudstok_ticketing/modules/screens/pages/ticket_page.dart';
import 'package:cloudstok_ticketing/modules/screens/pages/users_page.dart';
import 'package:cloudstok_ticketing/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final storage = FlutterSecureStorage();
  @override
  int _currentIndex = 0;
  List _widgetOptions = [
    HomePage(),
    TicketPage(),
    UsersPage(),
    AccountPage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
            label: 'Accounts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        unselectedItemColor: kAccent,
        backgroundColor: Colors.white,
        selectedItemColor: kAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
