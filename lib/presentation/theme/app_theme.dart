import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color seedColor = Color(0xFF6750A4);

  static ThemeData light() => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ThemeData dark() => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
