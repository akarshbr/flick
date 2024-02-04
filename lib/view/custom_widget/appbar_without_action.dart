import 'package:flick/utils/constants.dart';
import 'package:flutter/material.dart';

class AppBarWOActionWidget extends StatelessWidget {
  const AppBarWOActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Image(height: appBarHeight, image: AssetImage("assets/logo/flick_white.png")),
    );
  }
}
