import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../custom_widget/checkbox_text_widget.dart';
import '../../custom_widget/login_signup_appbar.dart';
import '../../custom_widget/login_signup_elevated_button.dart';
import '../../custom_widget/login_signup_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(preferredSize: Size.fromHeight(100), child: LoginSignupAppBar()),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bgImage/lalaland.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginSignupTextField(hintText: 'Name', controller: nameController),
            LoginSignupTextField(hintText: 'username', controller: usernameController),
            LoginSignupTextField(hintText: 'email', controller: emailController),
            LoginSignupTextField(hintText: "password", controller: passwordController),
            LoginSignupTextField(
                hintText: 'confirm password', controller: confirmPasswordController),
            const CheckBoxText(
                text: '''Iam 16 years old and I accept the Privacy policy and \nTerms Of Condition'''),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: LoginSignupElevatedButton(text: "Signup"),
            ),
            cHeight
          ],
        ),
      ),
    );
  }
}
