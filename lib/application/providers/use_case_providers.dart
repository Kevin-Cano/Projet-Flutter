import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../use_cases/export_tasks_use_case.dart';
import '../use_cases/project_use_cases.dart';
import '../use_cases/task_use_cases.dart';
import '../use_cases/theme_use_cases.dart';
import 'repository_providers.dart';

final createTaskUseCaseProvider = Provider(
  (ref) => CreateTaskUseCase(ref.watch(taskRepositoryProvider)),
);
final updateTaskUseCaseProvider = Provider(
  (ref) => UpdateTaskUseCase(ref.watch(taskRepositoryProvider)),
);
final deleteTaskUseCaseProvider = Provider(
  (ref) => DeleteTaskUseCase(ref.watch(taskRepositoryProvider)),
);
final reorderTasksUseCaseProvider = Provider(
  (ref) => ReorderTasksUseCase(ref.watch(taskRepositoryProvider)),
);
final getTasksByProjectUseCaseProvider = Provider(
  (ref) => GetTasksByProjectUseCase(ref.watch(taskRepositoryProvider)),
);
final getTasksDueTodayUseCaseProvider = Provider(
  (ref) => GetTasksDueTodayUseCase(ref.watch(taskRepositoryProvider)),
);
final getTasksDueThisWeekUseCaseProvider = Provider(
  (ref) => GetTasksDueThisWeekUseCase(ref.watch(taskRepositoryProvider)),
);
final getTaskStatisticsUseCaseProvider = Provider(
  (ref) => GetTaskStatisticsUseCase(ref.watch(taskRepositoryProvider)),
);
final createProjectUseCaseProvider = Provider(
  (ref) => CreateProjectUseCase(ref.watch(projectRepositoryProvider)),
);
final deleteProjectUseCaseProvider = Provider(
  (ref) => DeleteProjectUseCase(ref.watch(projectRepositoryProvider)),
);
final listProjectsUseCaseProvider = Provider(
  (ref) => ListProjectsUseCase(ref.watch(projectRepositoryProvider)),
);
final loadThemeUseCaseProvider = Provider(
  (ref) => LoadThemeUseCase(ref.watch(preferencesRepositoryProvider)),
);
final saveThemeUseCaseProvider = Provider(
  (ref) => SaveThemeUseCase(ref.watch(preferencesRepositoryProvider)),
);
final toggleThemeUseCaseProvider = Provider(
  (ref) => ToggleThemeUseCase(
    ref.watch(loadThemeUseCaseProvider),
    ref.watch(saveThemeUseCaseProvider),
  ),
);
final exportTasksUseCaseProvider = Provider(
  (ref) => ExportTasksUseCase(ref.watch(taskRepositoryProvider)),
);
