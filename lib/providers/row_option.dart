import 'package:flutter/material.dart';

class Row_option with ChangeNotifier {
  int _row_option = 1;
  int get row_option => _row_option;

  void changeRow_1() {
    _row_option = 1;

    notifyListeners();
  }
  void changeRow_2() {
    _row_option = 2;

    notifyListeners();
  }

}