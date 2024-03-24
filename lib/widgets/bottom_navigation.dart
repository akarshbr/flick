import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({super.key, required this.currentIndex});

  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.film), label: "Movies"),
          BottomNavigationBarItem(icon: Icon(Icons.video_camera_front_rounded), label: "Series"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bookmark), label: "WatchList"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.gear), label: "Settings")
        ]);
  }
}
