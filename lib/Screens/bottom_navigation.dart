import 'package:covidcare/Screens/Hospitals.dart';
import 'package:covidcare/Screens/chat_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Info.dart';
import 'home_screen.dart';
import 'stats_screen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int pageIndex = 0;

// creating all pages
  final home = new HomeScreen();
  final chat = new Chat();
  final stat = new StatsScreen();
  final info = new Info();
  final map = new PlacesPage();

  Widget showPage = new HomeScreen();

  Widget pageChooser(int page) {
    switch (page) {
      case 0:
        return stat;
        break;
      case 1:
        return map;
        break;
      case 2:
        return home;
        break;
      case 3:
        return chat;
        break;
      case 4:
        return info;
      default:
        return home;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        //initialIndex : pageIndex,
        color: Color(0XFF8d12fe),
        backgroundColor: Colors.white70,
        buttonBackgroundColor: Color(0XFF8d12fe),
        height: 60,
        items: [
          Icon(Icons.dashboard, size: 30),
          Icon(Icons.map, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.chat, size: 30),
          Icon(Icons.info, size: 30),
        ],
        animationDuration: Duration(
          milliseconds: 200,
        ),
        index: 2,
        onTap: (index) {
          setState(() {
            showPage = pageChooser(index);
          });
        },
        animationCurve: Curves.bounceInOut,
      ),
      body: Container(
        child: Center(
          child: showPage,
        ),
      ),
    );
  }
}
