import 'package:flutter/cupertino.dart';

class TermsAndConditionProvider extends ChangeNotifier{
  final List<bool> _termAndConditionAccepted =[];
  List<bool> get termsAndConditionAccepted => _termAndConditionAccepted;

  void acceptTerm(bool terms){
    termsAndConditionAccepted.add(terms);
    notifyListeners();
  }
  void rejectTerm(bool terms){
    termsAndConditionAccepted.remove(terms);
    notifyListeners();
  }
}