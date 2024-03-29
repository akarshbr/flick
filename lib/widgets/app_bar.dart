import 'package:flutter/material.dart';

import '../core/constants/constants.dart';
import 'bottom_navigation.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Image(height: appBarHeight, image: AssetImage("assets/logo/flick_white.png")),
      actions: [
        ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, currentIndex, _) {
              return Visibility(
                  visible: currentIndex == 3 ? false : true,
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.white, size: 40)));
            })
      ],
    );
  }
}
