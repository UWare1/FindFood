import 'package:audioplayers/audioplayers.dart';
import 'package:findfood/misc/colors.dart';
import 'package:findfood/pages/navpages/favourite_page.dart';
import 'package:findfood/pages/navpages/spinner_page.dart';
import 'package:findfood/pages/navpages/home_page.dart';
import 'package:findfood/pages/navpages/profile_page.dart';
import 'package:findfood/pages/navpages/collection_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [
    HomePage(),
    FavouritePage(),
    SpinnerPage(),
    CollectionPage(),
    ProfilePage()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    AudioPlayer().play(AssetSource('audio/click_tone.mp3'));
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              label: "Home", tooltip: "Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: "Favourite",
              tooltip: "Favourite",
              icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(
              label: "Spinner",
              tooltip: "Spinner",
              icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(
              label: "Collection",
              tooltip: "Collection",
              icon: Icon(Icons.collections_bookmark_rounded)),
          BottomNavigationBarItem(
              label: "Profile", tooltip: "Profile", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
