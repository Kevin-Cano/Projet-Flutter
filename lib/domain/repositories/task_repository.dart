import '../entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getAll();
  Future<Task?> getById(String id);
  Future<void> save(Task task);
  Future<void> delete(String id);
  Future<void> saveAll(List<Task> tasks);
}
