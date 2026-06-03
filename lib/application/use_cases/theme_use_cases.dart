import 'package:flutter/material.dart';

import '../../domain/repositories/preferences_repository.dart';

class LoadThemeUseCase {
  LoadThemeUseCase(this._repository);

  final PreferencesRepository _repository;

  Future<ThemeMode> call() => _repository.getThemeMode();
}

class SaveThemeUseCase {
  SaveThemeUseCase(this._repository);

  final PreferencesRepository _repository;

  Future<void> call(ThemeMode mode) => _repository.setThemeMode(mode);
}

class ToggleThemeUseCase {
  ToggleThemeUseCase(this._load, this._save);

  final LoadThemeUseCase _load;
  final SaveThemeUseCase _save;

  Future<ThemeMode> call() async {
    final current = await _load();
    final next = current == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _save(next);
    return next;
  }
}
