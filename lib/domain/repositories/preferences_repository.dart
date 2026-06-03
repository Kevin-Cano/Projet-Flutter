import 'package:flutter/material.dart';

abstract class PreferencesRepository {
  Future<ThemeMode> getThemeMode();
  Future<void> setThemeMode(ThemeMode mode);
}
