import 'package:flick/utils/constants.dart';
import 'package:flick/view/custom_widget/login_signup_appbar.dart';
import 'package:flutter/material.dart';
import '../../custom_widget/login_signup_elevated_button.dart';
import '../../custom_widget/login_signup_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailUsernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(preferredSize: Size.fromHeight(100), child: LoginSignupAppBar()),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bgImage/EEAAO.jpeg.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LoginSignupTextField(
                hintText: 'username or email', controller: emailUsernameController),
            LoginSignupTextField(hintText: "password", controller: passwordController),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  LoginSignupElevatedButton(text: "Login"),
                  cWidth,
                  LoginSignupElevatedButton(text: "Signup"),
                ],
              ),
            ),
            cHeight
          ],
        ),
      ),
    );
  }
}
