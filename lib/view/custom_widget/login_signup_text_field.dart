import 'package:flick/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginSignupTextField extends StatelessWidget {
  const LoginSignupTextField({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      style: const TextStyle(color: inputTextColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillClr.withOpacity(.3),
        hintText: hintText,
        hintStyle: const TextStyle(color: hintTextClr),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: fillClr))
      ),
    );
  }
}
