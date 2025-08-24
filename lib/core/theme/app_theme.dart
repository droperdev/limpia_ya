import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = _theme(Brightness.light, Colors.white, Colors.black);
  static ThemeData dark = _theme(Brightness.dark, Colors.black, Colors.white);
}

const int primaryColorValue = 0xFF4CAF50;

final MaterialColor customPrimary = MaterialColor(
  primaryColorValue,
  <int, Color>{
    for (var i in [50, 100, 200, 300, 400, 500, 600, 700, 800, 900])
      i: Color(primaryColorValue),
  },
);

ThemeData _theme(Brightness brightness, Color scaffoldBg, Color outlineColor) {
  return ThemeData(
    brightness: brightness,
    primarySwatch: customPrimary,
    primaryColor: const Color(primaryColorValue),
    scaffoldBackgroundColor: scaffoldBg,
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(primaryColorValue),
      foregroundColor: brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(primaryColorValue),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(primaryColorValue),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: outlineColor,
        textStyle: TextStyle(
          color: brightness == Brightness.dark ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
        side: BorderSide(color: outlineColor),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
