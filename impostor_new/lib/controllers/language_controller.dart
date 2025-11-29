import 'package:flutter/material.dart';

class LanguageController extends ChangeNotifier {
  String _lang = "es"; // default español

  String get lang => _lang;

  void setLanguage(String newLang) {
    _lang = newLang;
    notifyListeners();
  }
}
