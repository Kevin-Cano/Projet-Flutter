import 'package:flutter/material.dart';

import '../../domain/repositories/preferences_repository.dart';
import '../datasources/preferences_datasource.dart';

class PrefsPreferencesRepository implements PreferencesRepository {
  PrefsPreferencesRepository(this._datasource);

  final PreferencesDatasource _datasource;

  @override
  Future<ThemeMode> getThemeMode() => _datasource.getThemeMode();

  @override
  Future<void> setThemeMode(ThemeMode mode) => _datasource.setThemeMode(mode);
}
