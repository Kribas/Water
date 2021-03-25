import 'package:drpani/Components/Categories.dart';
import 'package:drpani/Components/ImageCarousel.dart';
import 'package:drpani/Components/drawer.dart';
import 'package:drpani/Pages/Home.dart';
import 'package:drpani/Pages/Notifications.dart';
import 'package:drpani/Pages/Profile.dart';
import 'package:drpani/Pages/Refer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        Home(),
        NotificationsScreen(),
        ProfileScreen(),
        ReferScreen()

      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: true,
          items: [
        BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(FontAwesomeIcons.home)),
        BottomNavigationBarItem(
            title: Text('Notifications'),
            icon: Icon(FontAwesomeIcons.bell)),
        BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(FontAwesomeIcons.user)),
        BottomNavigationBarItem(
            title: Text('Refer'),
            icon: Icon(Icons.send)),

      ],
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
        },
        currentIndex: _selectedIndex,
      )

    );
  }
}