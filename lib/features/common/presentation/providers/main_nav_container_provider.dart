import 'package:flutter/material.dart';

class MainNavContainerProvider extends ChangeNotifier {
  int _seletedIndex = 0;
  int get selectedIndex => _seletedIndex;

  void changeItem(int index) {
    if (_seletedIndex == index) return;

    _seletedIndex = index;
    notifyListeners();
  }
}
