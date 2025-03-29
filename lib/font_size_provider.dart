import 'package:flutter/material.dart';

class FontSizeProvider extends ChangeNotifier {
  double _arabFontSize = 70.0;
  double _uzbFontSize = 25.0;

  double get arabFontSize => _arabFontSize;
  double get uzbFontSize => _uzbFontSize;

  void setArabFontSize(double newSize) {
    _arabFontSize = newSize;
    notifyListeners(); // UI'ni yangilash uchun
  }

  void setUzbFontSize(double newSize) {
    _uzbFontSize = newSize;
    notifyListeners();
  }
}
