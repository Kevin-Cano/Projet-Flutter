import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/date_utils.dart';
import '../../domain/entities/task.dart';
import '../../core/constants/app_tab.dart';
import 'project_providers.dart';
import 'task_providers.dart';
import 'use_case_providers.dart';

final currentTabProvider = StateProvider<AppTab>((ref) => AppTab.projects);
final searchTermProvider = StateProvider<String>((ref) => '');
final searchVisibleProvider = StateProvider<bool>((ref) => false);
final selectedStatusFilterProvider = StateProvider<TaskStatus?>((ref) => null);
final selectedPriorityFilterProvider = StateProvider<TaskPriority?>(
  (ref) => null,
);

final filteredTasksProvider = Provider<List<Task>>((ref) {
  final tasks = ref.watch(tasksProvider).valueOrNull ?? [];
  final tab = ref.watch(currentTabProvider);
  final search = ref.watch(searchTermProvider).trim().toLowerCase();
  final projectId = ref.watch(selectedProjectIdProvider);
  final status = ref.watch(selectedStatusFilterProvider);
  final priority = ref.watch(selectedPriorityFilterProvider);

  List<Task> result;
  switch (tab) {
    case AppTab.projects:
      result = List<Task>.from(tasks);
    case AppTab.today:
      result = tasks.where((t) => isDueToday(t.dueDate)).toList();
    case AppTab.week:
      result = tasks.where((t) => isDueThisWeek(t.dueDate)).toList();
    case AppTab.settings:
      result = List<Task>.from(tasks);
  }

  if (projectId != null) {
    result = result.where((t) => t.projectId == projectId).toList();
  }
  if (status != null) {
    result = result.where((t) => t.status == status).toList();
  }
  if (priority != null) {
    result = result.where((t) => t.priority == priority).toList();
  }
  if (search.isNotEmpty) {
    result = result.where((task) {
      final hay = '${task.title} ${task.description ?? ''}'.toLowerCase();
      return hay.contains(search);
    }).toList();
  }

  result.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  return result;
});

final taskStatisticsProvider = FutureProvider((ref) async {
  ref.watch(tasksProvider);
  return ref.read(getTaskStatisticsUseCaseProvider).call();
});
