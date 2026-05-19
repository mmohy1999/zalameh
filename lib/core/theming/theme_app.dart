import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appThemeData() {
  return ThemeData(
    fontFamily: 'Almarai',
    scaffoldBackgroundColor: Colors.white,
    primaryColor: ColorsManager.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManager.grayColor,

      // Border radius
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: ColorsManager.primaryColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: ColorsManager.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: ColorsManager.red, width: 2),
      ),

      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      suffixIconColor: ColorsManager.black,
      prefixIconColor: ColorsManager.black,
      iconColor: ColorsManager.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 0),
        minimumSize: const Size(0, 46),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ColorsManager.blackText,
        fontWeight: FontWeight.bold,
      ),

      bodyLarge: TextStyle(
        color: ColorsManager.grayText,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
