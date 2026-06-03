import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_constants.dart';

class PreferencesDatasource {
  PreferencesDatasource(this._prefs);

  final SharedPreferences _prefs;

  static Future<PreferencesDatasource> create() async {
    final prefs = await SharedPreferences.getInstance();
    return PreferencesDatasource(prefs);
  }

  Future<String?> readString(String key) async => _prefs.getString(key);

  Future<void> writeString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<ThemeMode> getThemeMode() async {
    final value = _prefs.getString(AppConstants.prefsThemeKey);
    return switch (value) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => ThemeMode.light,
    };
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final value = mode == ThemeMode.dark ? 'dark' : 'light';
    await _prefs.setString(AppConstants.prefsThemeKey, value);
  }

  Future<List<Map<String, dynamic>>> readJsonList(String key) async {
    final raw = _prefs.getString(key);
    if (raw == null || raw.isEmpty) return [];
    final decoded = jsonDecode(raw);
    if (decoded is! List) return [];
    return decoded.cast<Map<String, dynamic>>();
  }

  Future<void> writeJsonList(String key, List<Map<String, dynamic>> data) async {
    await _prefs.setString(key, jsonEncode(data));
  }
}
