import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:healthcare/controller/auth_controller.dart';
import 'package:healthcare/controller/doctors_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/nav_bar_item.dart';
import 'package:healthcare/view/screens/appointment/appointment_screen.dart';
import 'package:healthcare/view/screens/home/home_screen.dart';
import 'package:healthcare/view/screens/inbox/inbox_screen.dart';
import 'package:healthcare/view/screens/profile/profile_screen.dart';
import 'package:healthcare/view/screens/search/search_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _selectedIndex = 0;
  final authController = Get.put(AuthController());
  final doctorsController = Get.put(DoctorsController());
  static final List<Widget> _screens = [
    HomeScreen(),
    InboxScreen(),
    const SearchScreen(),
    const AppointmentScreen(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    authController.tookenExpired();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: _screens[_selectedIndex],
        floatingActionButton: InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                color: primaryColor,
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Padding(
                padding: EdgeInsets.all(24.0),
                child: Icon(
                  CupertinoIcons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          height: 60,
          color: Colors.white,
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavBarItem(
                  color: _selectedIndex == 0 ? primaryColor : Colors.black,
                  onTap: _onItemTapped,
                  icon: CupertinoIcons.home,
                  index: 0,
                ),
                buildNavBarItem(
                  color: _selectedIndex == 1 ? primaryColor : Colors.black,
                  onTap: _onItemTapped,
                  icon: CupertinoIcons.conversation_bubble,
                  index: 1,
                ),
                const SizedBox(
                  width: 20,
                ),
                buildNavBarItem(
                  color: _selectedIndex == 3 ? primaryColor : Colors.black,
                  onTap: _onItemTapped,
                  icon: CupertinoIcons.calendar_today,
                  index: 3,
                ),
                buildNavBarItem(
                  color: _selectedIndex == 4 ? primaryColor : Colors.black,
                  onTap: _onItemTapped,
                  icon: CupertinoIcons.profile_circled,
                  index: 4,
                ),
              ],
            ),
          ),
        ));
  }
}
