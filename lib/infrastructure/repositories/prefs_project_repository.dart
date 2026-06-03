import '../../core/constants/app_constants.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';
import '../datasources/preferences_datasource.dart';
import '../seed/seed_data.dart';

class PrefsProjectRepository implements ProjectRepository {
  PrefsProjectRepository(this._datasource);

  final PreferencesDatasource _datasource;
  List<Project>? _cache;

  @override
  Future<List<Project>> getAll() async {
    if (_cache != null) return List<Project>.from(_cache!);
    var maps = await _datasource.readJsonList(AppConstants.prefsProjectsKey);
    if (maps.isEmpty) {
      final seeded = SeedData.initialProjects();
      for (final project in seeded) {
        await save(project);
      }
      return seeded;
    }
    _cache = maps.map(Project.fromJson).toList();
    return List<Project>.from(_cache!);
  }

  @override
  Future<Project?> getById(String id) async {
    final projects = await getAll();
    try {
      return projects.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> save(Project project) async {
    final projects = await getAll();
    final index = projects.indexWhere((p) => p.id == project.id);
    if (index >= 0) {
      projects[index] = project;
    } else {
      projects.add(project);
    }
    _cache = projects;
    final maps = projects.map((p) => p.toJson()).toList();
    await _datasource.writeJsonList(AppConstants.prefsProjectsKey, maps);
  }

  @override
  Future<void> delete(String id) async {
    final projects = await getAll();
    projects.removeWhere((p) => p.id == id);
    _cache = projects;
    final maps = projects.map((p) => p.toJson()).toList();
    await _datasource.writeJsonList(AppConstants.prefsProjectsKey, maps);
  }
}
