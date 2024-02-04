import 'package:flick/utils/constants.dart';
import 'package:flick/view/login_signup/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginSignupElevatedButton extends StatelessWidget {
  const LoginSignupElevatedButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (text == "Signup") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: buttonBColor1.withOpacity(.5)),
      child: Text(text, style: const TextStyle(color: buttonTextColor1, fontWeight: FontWeight.bold)),
    );
  }
}
