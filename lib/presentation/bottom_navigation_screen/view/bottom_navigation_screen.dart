import 'package:flick/presentation/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../../../widgets/app_bar.dart';
import '../../movie_screen/view/movie_screen.dart';
import '../../profile_screen/view/profile_screen.dart';
import '../../series_screen/view/series_screen.dart';
import '../../watchlist_screen/view/watchlist_screen.dart';

class CurrentScreen extends StatelessWidget {
  CurrentScreen({super.key});

  final _screens = [
    const MovieScreen(),
    const SeriesScreen(),
    const WatchListScreen(),
    const ProfileScreen(),
    //const DiscussionScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentScreenBGColor,
      appBar: const PreferredSize(preferredSize: appBarPreferredSize, child: AppBarWidget()),
      body: Consumer<BottomNavigationController>(builder: (context, bController, _) {
        return IndexedStack(
          index: bController.currentIndex,
          children: const [MovieScreen(), SeriesScreen(), WatchListScreen(), ProfileScreen()],
        );
      }),
      bottomNavigationBar: Consumer<BottomNavigationController>(builder: (context, bController, _) {
        return BottomNavigationBar(
            currentIndex: bController.currentIndex,
            onTap: (index) {
              bController.currentIndex = index;
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
      }),
    );
  }
}
