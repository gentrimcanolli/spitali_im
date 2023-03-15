import 'package:flutter/material.dart';
import 'package:spitali_im/ui/appointments/appointment.dart';
import 'package:spitali_im/ui/doctors/doctors.dart';
import 'package:spitali_im/ui/home/home.dart';
import '../../constants/colors.dart';
import '../profile/profile.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    DoctorsScreen(),
    const AppointmentScreen(),
    const Profile(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
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
        items: const [
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
