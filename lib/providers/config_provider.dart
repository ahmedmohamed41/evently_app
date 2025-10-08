import 'package:evently_app/core/prefs/prefs_manager.dart';
import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = PrefsManager.getSavedTheme() ?? ThemeMode.light;
  String currentlanguage = PrefsManager.getSavedLanguage() ?? 'en';
  bool get isDark => currentTheme == ThemeMode.dark;

  void changeAppTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    PrefsManager.savedTheme(newTheme);
    notifyListeners();
  }

  void changeAppLanguage(String newLaguage) {
    if (currentlanguage == newLaguage) return;
    currentlanguage = newLaguage;
    PrefsManager.savedLanguage(newLaguage);
    notifyListeners();
  }
}
