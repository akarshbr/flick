import 'package:flutter/cupertino.dart';

class LanguageController extends ChangeNotifier {
  final List<String> _languagePreference = [];

  List<String> get languagePreference => _languagePreference;

  void addLanguage(String language){
    languagePreference.add(language);
    notifyListeners();
  }
  void removeLanguage(String language){
    languagePreference.remove(language);
    notifyListeners();
  }
}
