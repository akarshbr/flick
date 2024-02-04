import 'package:flick/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginSignupTextField extends StatelessWidget {
  LoginSignupTextField({super.key, required this.hintText, required this.controller});

  final String hintText;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: inputTextColor),
      decoration: InputDecoration(
          filled: true,
          fillColor: fillClr.withOpacity(.3),
          hintText: hintText,
          hintStyle: const TextStyle(color: hintTextClr),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: fillClr))),
    );
  }
}
