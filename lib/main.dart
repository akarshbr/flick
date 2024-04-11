import 'package:flick/presentation/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:flick/presentation/login_signup_screens/controller/password_visibility_controller.dart';
import 'package:flick/presentation/login_signup_screens/controller/terms_and_condition_provider.dart';
import 'package:flick/presentation/movie_screen/controller/movie_controller.dart';
import 'package:flick/presentation/select_language_screen/controller/language_controller.dart';
import 'package:flick/presentation/series_screen/controller/series_controller.dart';
import 'package:flick/presentation/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => BottomNavigationController()),
    ChangeNotifierProvider(create: (context) => LanguageController()),
    ChangeNotifierProvider(create: (context) => TermsAndConditionProvider()),
    ChangeNotifierProvider(create: (context) => PasswordVisibilityProvider()),
    ChangeNotifierProvider(create: (context) => MovieController()),
    ChangeNotifierProvider(create: (context) => SeriesController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.black)),
    );
  }
}
