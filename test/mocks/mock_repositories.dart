import 'package:mockito/annotations.dart';
import 'package:task_manager/domain/repositories/project_repository.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

@GenerateNiceMocks([
  MockSpec<TaskRepository>(),
  MockSpec<ProjectRepository>(),
])
void main() {}
