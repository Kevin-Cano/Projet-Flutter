import 'package:uuid/uuid.dart';

import '../../core/errors/failure.dart';
import '../../core/utils/date_utils.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

const _uuid = Uuid();

class CreateTaskUseCase {
  CreateTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<Task> call({
    required String title,
    String? description,
    TaskPriority priority = TaskPriority.medium,
    TaskStatus status = TaskStatus.todo,
    DateTime? dueDate,
    String? projectId,
    List<SubTask> subTasks = const [],
    List<String> tagIds = const [],
  }) async {
    final trimmed = title.trim();
    if (trimmed.isEmpty) {
      throw const ValidationFailure('Le titre est obligatoire');
    }
    final tasks = await _repository.getAll();
    final task = Task(
      id: _uuid.v4(),
      title: trimmed,
      description: description?.trim().isEmpty == true
          ? null
          : description?.trim(),
      priority: priority,
      status: status,
      dueDate: dueDate,
      projectId: projectId,
      createdAt: DateTime.now(),
      sortOrder: tasks.length,
      subTasks: subTasks,
      tagIds: tagIds,
    );
    await _repository.save(task);
    return task;
  }
}

class UpdateTaskUseCase {
  UpdateTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<Task> call(Task task) async {
    if (task.title.trim().isEmpty) {
      throw const ValidationFailure('Le titre est obligatoire');
    }
    await _repository.save(task);
    return task;
  }
}

class DeleteTaskUseCase {
  DeleteTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<void> call(String id) => _repository.delete(id);
}

class ReorderTasksUseCase {
  ReorderTasksUseCase(this._repository);

  final TaskRepository _repository;

  Future<void> call(int oldIndex, int newIndex, List<Task> visibleTasks) async {
    if (oldIndex < newIndex) newIndex -= 1;
    final items = List<Task>.from(visibleTasks);
    final moved = items.removeAt(oldIndex);
    items.insert(newIndex, moved);
    final updated = <Task>[];
    for (var i = 0; i < items.length; i++) {
      updated.add(items[i].copyWith(sortOrder: i));
    }
    final all = await _repository.getAll();
    final map = {for (final t in all) t.id: t};
    for (final t in updated) {
      map[t.id] = t;
    }
    await _repository.saveAll(map.values.toList());
  }
}

class GetTasksByProjectUseCase {
  GetTasksByProjectUseCase(this._repository);

  final TaskRepository _repository;

  Future<List<Task>> call(String? projectId) async {
    final all = await _repository.getAll();
    if (projectId == null) return all;
    return all.where((t) => t.projectId == projectId).toList();
  }
}

class GetTasksDueTodayUseCase {
  GetTasksDueTodayUseCase(this._repository);

  final TaskRepository _repository;

  Future<List<Task>> call() async {
    final all = await _repository.getAll();
    return all.where((t) => isDueToday(t.dueDate)).toList();
  }
}

class GetTasksDueThisWeekUseCase {
  GetTasksDueThisWeekUseCase(this._repository);

  final TaskRepository _repository;

  Future<List<Task>> call() async {
    final all = await _repository.getAll();
    return all.where((t) => isDueThisWeek(t.dueDate)).toList();
  }
}

class GetTaskStatisticsUseCase {
  GetTaskStatisticsUseCase(this._repository);

  final TaskRepository _repository;

  Future<TaskStatistics> call() async {
    final all = await _repository.getAll();
    final done = all.where((t) => t.status == TaskStatus.done).length;
    final overdue = all
        .where(
          (t) => isOverdue(t.dueDate, isDone: t.status == TaskStatus.done),
        )
        .length;
    final byProject = <String?, int>{};
    for (final task in all) {
      byProject[task.projectId] = (byProject[task.projectId] ?? 0) + 1;
    }
    return TaskStatistics(
      total: all.length,
      completed: done,
      overdue: overdue,
      byProject: byProject,
    );
  }
}

class TaskStatistics {
  const TaskStatistics({
    required this.total,
    required this.completed,
    required this.overdue,
    required this.byProject,
  });

  final int total;
  final int completed;
  final int overdue;
  final Map<String?, int> byProject;
}
