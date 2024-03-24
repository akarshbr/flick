import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/bottom_navigation.dart';
import '../../movie_screen/view/movie_screen.dart';
import '../../profile_screen/view/profile_screen.dart';
import '../../series_screen/view/series_screen.dart';
import '../../watchlist_screen/view/watchlist_screen.dart';
//import 'package:flick/view/bottom_navigation_screens/discussion/discussion_screen.dart';

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
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, index, _) {
            if (index == 1) {}
            return _screens[index];
          }),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
