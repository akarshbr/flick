import 'package:flick/controller/password_visibility_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    bool visibility = true;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(preferredSize: Size.fromHeight(100), child: LoginSignupAppBar()),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bgImage/bladerunner1.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginSignupTextField(hintText: 'Name', controller: nameController),
            LoginSignupTextField(hintText: 'username', controller: usernameController),
            LoginSignupTextField(hintText: 'email', controller: emailController),
            Consumer<PasswordVisibilityProvider>(builder: (context, visibilityProvider1, _) {
              return TextFormField(
                obscureText: visibilityProvider1.visibility,
                controller: passwordController,
                cursorColor: Colors.white,
                style: const TextStyle(color: inputTextColor),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: fillClr.withOpacity(.3),
                    hintText: "password",
                    hintStyle: const TextStyle(color: hintTextClr),
                    focusedBorder:
                    const UnderlineInputBorder(borderSide: BorderSide(color: fillClr)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          visibilityProvider1.iconPressed();
                        },
                        icon: visibilityProvider1.visibility
                            ? Icon(
                          Icons.visibility,
                          color: checkboxIconColor,
                        )
                            : Icon(
                          Icons.visibility_off,
                          color: checkboxIconColor,
                        ))),
              );
            }),
            Consumer<PasswordVisibilityProvider>(builder: (context, visibilityProvider2, _) {
              return TextFormField(
                obscureText: visibilityProvider2.visibility2,
                controller: confirmPasswordController,
                cursorColor: Colors.white,
                style: const TextStyle(color: inputTextColor),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: fillClr.withOpacity(.3),
                    hintText: "confirm password",
                    hintStyle: const TextStyle(color: hintTextClr),
                    focusedBorder:
                        const UnderlineInputBorder(borderSide: BorderSide(color: fillClr)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          visibilityProvider2.iconPressed2();
                        },
                        icon: visibilityProvider2.visibility2
                            ? Icon(
                                Icons.visibility,
                                color: checkboxIconColor,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: checkboxIconColor,
                              ))),
              );
            }),
            const CheckBoxText(
                text:
                    '''Iam 16 years old and I accept the Privacy policy and \nTerms Of Condition'''),
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
