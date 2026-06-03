import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'use_case_providers.dart';

class ThemeNotifier extends AsyncNotifier<ThemeMode> {
  @override
  Future<ThemeMode> build() async {
    return ref.read(loadThemeUseCaseProvider).call();
  }

  Future<void> toggle() async {
    final next = await ref.read(toggleThemeUseCaseProvider).call();
    state = AsyncData(next);
  }

  Future<void> setMode(ThemeMode mode) async {
    await ref.read(saveThemeUseCaseProvider).call(mode);
    state = AsyncData(mode);
  }
}

final themeModeProvider = AsyncNotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);
