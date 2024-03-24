import 'package:flick/controller/cast_crew_controller.dart';
import 'package:flick/controller/language_provider.dart';
import 'package:flick/controller/movie_controller.dart';
import 'package:flick/controller/movie_details_controller.dart';
import 'package:flick/controller/password_visibility_controller.dart';
import 'package:flick/controller/series_controller.dart';
import 'package:flick/controller/terms_and_condition_provider.dart';
import 'package:flick/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LanguageProvider()),
    ChangeNotifierProvider(create: (context) => TermsAndConditionProvider()),
    ChangeNotifierProvider(create: (context) => PasswordVisibilityProvider()),
    ChangeNotifierProvider(create: (context) => MovieController()),
    ChangeNotifierProvider(create: (context) => MovieDetailsController()),
    ChangeNotifierProvider(create: (context) => CastCrewController()),
    ChangeNotifierProvider(create: (context) => SeriesController())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.black)),
    );
  }
}
