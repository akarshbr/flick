import 'package:flick/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginSignupElevatedButton extends StatelessWidget {
  const LoginSignupElevatedButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text,style: TextStyle(color: buttonTextColor1,fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(backgroundColor: buttonBColor1.withOpacity(.5)),
    );
  }
}
