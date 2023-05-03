import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_streaming_and_tournament/screens/profile.dart';
import 'package:game_streaming_and_tournament/screens/social.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        child: selectedIndex == 4
            ? Profile()
            : selectedIndex == 1
                ? Social()
                : Container(
                    child: Center(
                      child: Text(selectedIndex == 0
                          ? 'Home'
                          : selectedIndex == 2
                              ? 'Search'
                              : selectedIndex == 3
                                  ? 'Camera'
                                  : ''),
                    ),
                  ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
          child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              currentIndex: selectedIndex,
              backgroundColor: Colors.black54.withOpacity(0.6),
              showUnselectedLabels: false,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/home.png'),
                  activeIcon: Image.asset('assets/icons/home_active.png'),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/account.png',
                    height: 24,
                    width: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/icons/account_active.png',
                    height: 24,
                    width: 24,
                  ),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/search.png',
                    height: 24,
                    width: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/icons/search_active.png',
                    height: 24,
                    width: 24,
                  ),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/video.png',
                    height: 24,
                    width: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/icons/video_active.png',
                    height: 24,
                    width: 24,
                  ),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/pic1.jpeg',
                      height: 28,
                      width: 28,
                    ),
                  ),
                  label: 'home',
                ),
              ]),
        ),
      ),
    );
  }
}
