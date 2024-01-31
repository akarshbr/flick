import 'package:flutter/material.dart';

class LoginSignupAppBar extends StatelessWidget {
  const LoginSignupAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      //backgroundColor: Colors.transparent,
      leading: Image(image: AssetImage("assets/logo/flick_white.png")),

    );
  }
}
