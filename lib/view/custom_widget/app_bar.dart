import 'package:flick/view/custom_widget/bottom_navigaton.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Image(height: 40, image: AssetImage("assets/logo/flick_white.png")),
      actions: [
        ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, currentIndex, _) {
              return Visibility(
                  visible: currentIndex == 3 ? false : true,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.white, size: 40)));
            })
      ],
    );
  }
}
