import 'package:flutter/cupertino.dart';

class PasswordVisibilityProvider extends ChangeNotifier {
  bool visibility = true;
  bool visibility2 = true;

  void iconPressed() {
    visibility = !visibility;
    notifyListeners();
  }
  void iconPressed2() {
    visibility2 = !visibility2;
    notifyListeners();
  }
}
