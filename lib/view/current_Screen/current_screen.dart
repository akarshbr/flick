import 'package:flick/controller/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:flick/view/custom_widget/app_bar.dart';
import 'package:flick/view/custom_widget/bottom_navigaton.dart';
import 'package:provider/provider.dart';
import '../../utils/constants.dart';
import '../bottom_navigation_screens/movie/movie_screen.dart';
import '../bottom_navigation_screens/series/series_screen.dart';
import '../bottom_navigation_screens/settings/settings_screen.dart';
import '../bottom_navigation_screens/watchlist/watchlist_screen.dart';
//import 'package:flick/view/bottom_navigation_screens/discussion/discussion_screen.dart';

class CurrentScreen extends StatelessWidget {
  CurrentScreen({super.key});

  final _screens = [
    const MovieScreen(),
    const SeriesScreen(),
    const WatchListScreen(),
    const SettingsScreen(),
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
            if(index==0){
              Provider.of<MovieController>(context,listen: false).fetchData();
            }
            return _screens[index];
          }),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
