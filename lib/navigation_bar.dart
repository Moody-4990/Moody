import 'package:flutter/material.dart';
import 'package:moody/screens/dashboard_screen.dart';
import 'package:moody/screens/test.dart';

class NavBar extends StatefulWidget {
  

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  List<Widget> _screenOptions = <Widget>[
     test(),
     DashboardScreen(),


  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _screenOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem( icon: Icon(Icons.person),label: "Profile",),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
    
  }
}