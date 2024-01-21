import 'package:flick/controller/language_provider.dart';
import 'package:flick/view/select_your_language.dart';
import 'package:flick/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => LanguageProvider(), child: const MaterialApp(home: SelectLanguage())));
}
