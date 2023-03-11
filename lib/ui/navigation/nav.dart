import 'package:flutter/material.dart';
import 'package:spitali_im/ui/home/home.dart';
import 'package:spitali_im/ui/home/home2.dart';

import '../../constants/colors.dart';
import '../home/home3.dart';
import '../profile/profile.dart';
import '../reusable_widgets/reusable_widgets.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  PageController _pageController = PageController();

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Home(),
    const Home1(),
    const Home2(),
    const Profile(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    // _pageController.jumpToPage(i);
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: mainBlueColor(),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.window,
              size: 30.0,
            ),
            label: "Ballina",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.masks_outlined,
              size: 30.0,
            ),
            label: "Doktorët",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_invitation_outlined,
              size: 30.0,
            ),
            label: "Terminet",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30.0,
            ),
            label: "Profili",
          ),
        ],
      ),
    );
  }
}
