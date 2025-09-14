import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      foregroundColor: ColorsManager.blue,
      backgroundColor: ColorsManager.whiteBlue,
    ),
    scaffoldBackgroundColor: ColorsManager.whiteBlue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 30.w),
        backgroundColor: ColorsManager.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
    ),
  );
  static final ThemeData dark = ThemeData();
}
