import 'package:arab_tilini_urganaman/home_dart.dart';
import 'package:arab_tilini_urganaman/settings_screen.dart';
import 'package:arab_tilini_urganaman/test_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    HarflarScreen(),
    TestScreen(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 33, 135, 243),
        iconSize: 20,
        unselectedLabelStyle: TextStyle(fontSize: 14.sp),
        selectedLabelStyle: TextStyle(fontSize: 14.sp),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.menu_book,
            ),
            label: "home".tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.playlist_add_check,
            ),
            label: "quiz".tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.settings,
            ),
            label: "setting".tr(),
          ),
        ],
      ),
    );
  }
}
