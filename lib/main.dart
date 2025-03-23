import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_tilini_urganaman/home_dart.dart';
import 'package:arab_tilini_urganaman/home_page.dart';
import 'package:arab_tilini_urganaman/settings_screen.dart';
import 'package:arab_tilini_urganaman/test_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Figma yoki dizayn o'lchami
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: kWhite,
              appBarTheme: const AppBarTheme(
                  backgroundColor: kWhite,
                  centerTitle: true,
                  surfaceTintColor: kWhite)),
          debugShowCheckedModeBanner: false,
          home: const HarflarScreen(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomePage(),
    TestScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 33, 135, 243),
        iconSize: 25,
        unselectedLabelStyle: const TextStyle(fontSize: 20),
        selectedLabelStyle: const TextStyle(fontSize: 20),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_book,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.playlist_add_check,
            ),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

const Color kWhite = Colors.white;
