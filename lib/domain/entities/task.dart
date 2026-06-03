import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

enum TaskPriority { low, medium, high, urgent }

enum TaskStatus { todo, inProgress, done }

@freezed
class SubTask with _$SubTask {
  const factory SubTask({
    required String id,
    required String title,
    @Default(false) bool completed,
  }) = _SubTask;

  factory SubTask.fromJson(Map<String, dynamic> json) =>
      _$SubTaskFromJson(json);
}

@freezed
class TaskTag with _$TaskTag {
  const factory TaskTag({
    required String id,
    required String label,
    required int colorValue,
  }) = _TaskTag;

  factory TaskTag.fromJson(Map<String, dynamic> json) =>
      _$TaskTagFromJson(json);
}

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    String? description,
    @Default(TaskPriority.medium) TaskPriority priority,
    @Default(TaskStatus.todo) TaskStatus status,
    DateTime? dueDate,
    String? projectId,
    required DateTime createdAt,
    @Default(0) int sortOrder,
    @Default([]) List<SubTask> subTasks,
    @Default([]) List<String> tagIds,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
