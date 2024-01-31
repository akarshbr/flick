import 'package:flutter/material.dart';

class LoginSignupElevatedButton extends StatelessWidget {
  const LoginSignupElevatedButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text(text));
  }
}
