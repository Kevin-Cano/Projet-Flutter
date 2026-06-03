import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager/application/use_cases/task_use_cases.dart';
import 'package:task_manager/domain/entities/task.dart';

import '../mocks/mock_repositories.mocks.dart';

void main() {
  late MockTaskRepository mockRepository;

  setUp(() {
    mockRepository = MockTaskRepository();
  });

  test('GetTasksDueTodayUseCase filtre via repository mocké', () async {
    final today = DateTime.now();
    final dueToday = DateTime(today.year, today.month, today.day, 12);
    final tasks = [
      Task(
        id: '1',
        title: 'Aujourd\'hui',
        dueDate: dueToday,
        createdAt: today,
      ),
      Task(
        id: '2',
        title: 'Sans échéance',
        createdAt: today,
      ),
    ];

    when(mockRepository.getAll()).thenAnswer((_) async => tasks);

    final useCase = GetTasksDueTodayUseCase(mockRepository);
    final result = await useCase.call();

    expect(result.length, 1);
    expect(result.first.title, 'Aujourd\'hui');
    verify(mockRepository.getAll()).called(1);
  });

  test('DeleteTaskUseCase appelle delete sur le mock', () async {
    when(mockRepository.delete('x')).thenAnswer((_) async {});

    final useCase = DeleteTaskUseCase(mockRepository);
    await useCase.call('x');

    verify(mockRepository.delete('x')).called(1);
  });
}
