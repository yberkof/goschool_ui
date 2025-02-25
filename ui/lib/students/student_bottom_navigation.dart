import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui/constants.dart';
import 'package:ui/screens/settings_screen.dart';
import 'package:ui/students/student_classes_screen.dart';
import 'package:ui/students/student_home_screen.dart';

class StudentBottomNavigation extends StatefulWidget {
  @override
  _StudentBottomNavigationState createState() => _StudentBottomNavigationState();
}

class _StudentBottomNavigationState extends State<StudentBottomNavigation> {
  int _selectedTab = 0;
  Widget _currentPage;
  List<Widget> _pages;
  StudentHomeScreen _homeScreen;
  StudentClassesScreen _classesScreen;
  SettingsScreen _settingsScreen;

  @override
  void initState() {
    super.initState();
    _homeScreen = StudentHomeScreen();
    _classesScreen = StudentClassesScreen();
    _settingsScreen = SettingsScreen();
    _pages = [_homeScreen, _classesScreen, _homeScreen, _settingsScreen];
    _currentPage = _homeScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
          _currentPage,
          _bottomNavigator(),
        ],
      ),
    );
  }

  _bottomNavigator() {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).backgroundColor,
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
              // if (index == 0 || index == 1 || index == 2)
              _currentPage = _pages[index];
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/house.svg",
                width: 35.0,
                color: _selectedTab == 0
                    ? Theme.of(context).accentColor
                    : kTextColor,
              ),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/read_book.svg",
                width: 35.0,
                color: _selectedTab == 1
                    ? Theme.of(context).accentColor
                    : kTextColor,
              ),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/homework.svg",
                width: 35.0,
                color: _selectedTab == 2
                    ? Theme.of(context).accentColor
                    : kTextColor,
              ),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/settings.svg",

                width: 35.0,
                color: _selectedTab == 3
                    ? Theme.of(context).accentColor
                    : kTextColor,
              ),
              title: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
