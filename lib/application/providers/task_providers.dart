import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/task.dart';
import 'repository_providers.dart';
import 'use_case_providers.dart';

class TasksNotifier extends AsyncNotifier<List<Task>> {
  @override
  Future<List<Task>> build() async {
    return ref.read(taskRepositoryProvider).getAll();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(taskRepositoryProvider).getAll());
  }

  Future<void> create({
    required String title,
    String? description,
    TaskPriority priority = TaskPriority.medium,
    TaskStatus status = TaskStatus.todo,
    DateTime? dueDate,
    String? projectId,
    List<SubTask> subTasks = const [],
    List<String> tagIds = const [],
  }) async {
    await ref
        .read(createTaskUseCaseProvider)
        .call(
          title: title,
          description: description,
          priority: priority,
          status: status,
          dueDate: dueDate,
          projectId: projectId,
          subTasks: subTasks,
          tagIds: tagIds,
        );
    await refresh();
  }

  Future<void> updateTask(Task task) async {
    await ref.read(updateTaskUseCaseProvider).call(task);
    await refresh();
  }

  Future<void> delete(String id) async {
    await ref.read(deleteTaskUseCaseProvider).call(id);
    await refresh();
  }

  Future<void> reorder(int oldIndex, int newIndex, List<Task> visible) async {
    await ref.read(reorderTasksUseCaseProvider).call(oldIndex, newIndex, visible);
    await refresh();
  }
}

final tasksProvider = AsyncNotifierProvider<TasksNotifier, List<Task>>(
  TasksNotifier.new,
);
