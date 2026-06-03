import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager/application/providers/repository_providers.dart';
import 'package:task_manager/application/providers/task_providers.dart';
import 'package:task_manager/core/errors/failure.dart';

import '../mocks/mock_repositories.mocks.dart';

void main() {
  late MockTaskRepository mockRepository;

  setUp(() {
    mockRepository = MockTaskRepository();
    when(mockRepository.getAll()).thenAnswer((_) async => []);
    when(mockRepository.save(any)).thenAnswer((_) async {});
  });

  test('TasksNotifier.create ajoute une tâche via le repository mocké', () async {
    final container = ProviderContainer(
      overrides: [
        taskRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
    addTearDown(container.dispose);

    await container.read(tasksProvider.notifier).create(title: 'Test tâche');

    verify(mockRepository.save(any)).called(1);
    verify(mockRepository.getAll()).called(greaterThan(0));
  });

  test('CreateTaskUseCase refuse un titre vide', () async {
    when(mockRepository.getAll()).thenAnswer((_) async => []);

    final container = ProviderContainer(
      overrides: [
        taskRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
    addTearDown(container.dispose);

    expect(
      () => container.read(tasksProvider.notifier).create(title: '   '),
      throwsA(isA<ValidationFailure>()),
    );
  });
}
