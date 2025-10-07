import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentlanguage = 'en';
  bool get isDark => currentTheme == ThemeMode.dark;
  void changeAppTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeAppLanguage(String newLaguage) {
    if (currentlanguage == newLaguage) return;
    currentlanguage = newLaguage;
    notifyListeners();
  }
}
