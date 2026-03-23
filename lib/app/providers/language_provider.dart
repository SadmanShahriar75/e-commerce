import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocal = Locale('en');
  Locale get currentLocale => _currentLocal;

  void changeLocale(Locale newLocale) {
    if (_currentLocal == newLocale) return;
    _currentLocal = newLocale;
    notifyListeners();
  }
}
