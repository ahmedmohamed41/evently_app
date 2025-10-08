import 'package:evently_app/core/resources/constant_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void savedTheme(ThemeMode themeMode) {
    String currentTheme = themeMode == ThemeMode.light ? 'Light' : 'Dark';

    prefs.setString(CacheConstant.themeKey, currentTheme);
  }

  static ThemeMode? getSavedTheme() {
    String? savedTheme = prefs.getString(CacheConstant.themeKey);
    if (savedTheme == null) {
      return null;
    } else {
      ThemeMode themeMode = savedTheme == 'Light'
          ? ThemeMode.light
          : ThemeMode.dark;

      return themeMode;
    }
  }

  static void savedLanguage(String language) {
    prefs.setString(CacheConstant.languageKey, language);
  }

  static String? getSavedLanguage() {
    String? savedLanguage = prefs.getString(CacheConstant.languageKey);
    if (savedLanguage == null) {
      return null;
    } else {
      return savedLanguage;
    }
  }

  static Future<void> removePrefs(String key) async {
    await prefs.remove(key);
  }
}
