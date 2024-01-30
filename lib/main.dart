import 'package:flick/controller/language_provider.dart';
import 'package:flick/view/current_Screen/current_screen.dart';
import 'package:flick/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Splash(),
        theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.black)),
      )));
}
