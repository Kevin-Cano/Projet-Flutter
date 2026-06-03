import 'package:uuid/uuid.dart';

import '../../core/errors/failure.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';

const _uuid = Uuid();

class CreateProjectUseCase {
  CreateProjectUseCase(this._repository);

  final ProjectRepository _repository;

  Future<Project> call({required String name, required int colorValue}) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      throw const ValidationFailure('Le nom du projet est obligatoire');
    }
    final project = Project(
      id: _uuid.v4(),
      name: trimmed,
      colorValue: colorValue,
    );
    await _repository.save(project);
    return project;
  }
}

class DeleteProjectUseCase {
  DeleteProjectUseCase(this._repository);

  final ProjectRepository _repository;

  Future<void> call(String id) => _repository.delete(id);
}

class ListProjectsUseCase {
  ListProjectsUseCase(this._repository);

  final ProjectRepository _repository;

  Future<List<Project>> call() => _repository.getAll();
}
