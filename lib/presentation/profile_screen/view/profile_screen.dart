import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';


import '../../../widgets/icon_and_text_button.dart';
import '../../login_signup_screens/login_screen/view/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push((context), MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade100,
                ),
                child: const Text(
                  "Login or Sign Up",
                  style: TextStyle(color: buttonTextColor),
                )),
            cHeight,
            const IconAndTextButton(
                icon: Icon(
                  CupertinoIcons.gear,
                  size: settingsIconSize,
                  color: settingsIconColor,
                ),
                text: "App Settings"),
            const IconAndTextButton(
                icon: Icon(
                  CupertinoIcons.mail,
                  size: settingsIconSize,
                  color: settingsIconColor,
                ),
                text: "Contact"),
            const IconAndTextButton(
                icon: Icon(
                  CupertinoIcons.info,
                  size: settingsIconSize,
                  color: settingsIconColor,
                ),
                text: "About")
          ],
        ),
      ),
    );
  }
}
