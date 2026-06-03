import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/preferences_repository.dart';
import '../../domain/repositories/project_repository.dart';
import '../../domain/repositories/task_repository.dart';
import '../../infrastructure/datasources/preferences_datasource.dart';
import '../../infrastructure/repositories/prefs_preferences_repository.dart';
import '../../infrastructure/repositories/prefs_project_repository.dart';
import '../../infrastructure/repositories/prefs_task_repository.dart';

final preferencesDatasourceProvider = Provider<PreferencesDatasource>((ref) {
  throw UnimplementedError('Datasource initialisé dans main');
});

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return PrefsTaskRepository(ref.watch(preferencesDatasourceProvider));
});

final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  return PrefsProjectRepository(ref.watch(preferencesDatasourceProvider));
});

final preferencesRepositoryProvider = Provider<PreferencesRepository>((ref) {
  return PrefsPreferencesRepository(ref.watch(preferencesDatasourceProvider));
});
