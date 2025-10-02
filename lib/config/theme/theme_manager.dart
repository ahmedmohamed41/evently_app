import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: false,
    primaryColor: ColorsManager.blue,
    cardTheme: CardThemeData(
      color: ColorsManager.whiteBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.whiteBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.whiteBlue,
      titleTextStyle: GoogleFonts.inter(
        color: ColorsManager.blue,
        fontSize: 25,
      ),
      centerTitle: true,
      foregroundColor: ColorsManager.blue,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.blue,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue,
      foregroundColor: ColorsManager.white,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManager.white, width: 4),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grey,
      ),
      prefixIconColor: ColorsManager.grey,
      suffixIconColor: ColorsManager.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: REdgeInsets.symmetric(vertical: 16),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.whiteBlue,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        side: const BorderSide(color: ColorsManager.blue, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.blue,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black1c,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black1c,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.blue,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black1c,
      ),
    ),
  );
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: false,
    primaryColor: ColorsManager.darkBlue,
    iconTheme: const IconThemeData(color: ColorsManager.ofWhite),
    cardTheme: CardThemeData(
      color: ColorsManager.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.darkBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.darkBlue,
      titleTextStyle: GoogleFonts.inter(
        color: ColorsManager.blue,
        fontSize: 25,
      ),
      centerTitle: true,
      foregroundColor: ColorsManager.blue,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.darkBlue,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.darkBlue,
      foregroundColor: ColorsManager.ofWhite,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManager.white, width: 4),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.ofWhite,
      ),
      prefixIconColor: ColorsManager.ofWhite,
      suffixIconColor: ColorsManager.ofWhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: REdgeInsets.symmetric(vertical: 16),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.whiteBlue,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        side: const BorderSide(color: ColorsManager.blue, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.ofWhite,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManager.darkBlue,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.ofWhite,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.ofWhite,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.ofWhite,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.blue,
      ),
    ),
  );
}
