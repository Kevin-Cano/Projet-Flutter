import '../../core/constants/app_constants.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/preferences_datasource.dart';
import '../seed/seed_data.dart';

class PrefsTaskRepository implements TaskRepository {
  PrefsTaskRepository(this._datasource);

  final PreferencesDatasource _datasource;
  List<Task>? _cache;

  @override
  Future<List<Task>> getAll() async {
    if (_cache != null) return List<Task>.from(_cache!);
    var maps = await _datasource.readJsonList(AppConstants.prefsTasksKey);
    if (maps.isEmpty) {
      final seeded = SeedData.initialTasks();
      await saveAll(seeded);
      return seeded;
    }
    _cache = maps.map(Task.fromJson).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    return List<Task>.from(_cache!);
  }

  @override
  Future<Task?> getById(String id) async {
    final tasks = await getAll();
    try {
      return tasks.firstWhere((t) => t.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> save(Task task) async {
    final tasks = await getAll();
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index >= 0) {
      tasks[index] = task;
    } else {
      tasks.add(task);
    }
    await saveAll(tasks);
  }

  @override
  Future<void> delete(String id) async {
    final tasks = await getAll();
    tasks.removeWhere((t) => t.id == id);
    await saveAll(tasks);
  }

  @override
  Future<void> saveAll(List<Task> tasks) async {
    _cache = List<Task>.from(tasks)
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    final maps = _cache!.map((t) => t.toJson()).toList();
    await _datasource.writeJsonList(AppConstants.prefsTasksKey, maps);
  }
}
