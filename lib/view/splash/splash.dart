import 'dart:async';
import 'dart:math';
import 'package:flick/view/select_language/select_your_language.dart';
import 'package:flutter/material.dart';

import '../../dummy_data/backgroundImage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SelectLanguage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomImageIndex = random.nextInt(bgImage.length);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage[randomImageIndex]), fit: BoxFit.cover)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Image(image: AssetImage("assets/logo/flick_white.png"), height: 40),
        ),
      ),
    );
  }
}
