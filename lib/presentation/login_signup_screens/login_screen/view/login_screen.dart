import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../widgets/login_signup_appbar.dart';
import '../../../../widgets/login_signup_elevated_button.dart';
import '../../../../widgets/login_signup_text_field.dart';
import '../../controller/password_visibility_controller.dart';

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
            image: DecorationImage(image: AssetImage("assets/bgImage/EEAAO.jpeg.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LoginSignupTextField(hintText: 'username or email', controller: emailUsernameController),
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
                    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: fillClr)),
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
            const Padding(
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
