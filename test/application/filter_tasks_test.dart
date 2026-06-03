import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager/application/providers/filter_providers.dart';
import 'package:task_manager/application/providers/repository_providers.dart';
import 'package:task_manager/application/providers/task_providers.dart';
import 'package:task_manager/core/constants/app_tab.dart';
import 'package:task_manager/domain/entities/task.dart';

import '../mocks/mock_repositories.mocks.dart';

void main() {
  test('filteredTasksProvider filtre par statut et recherche', () async {
    final mockRepository = MockTaskRepository();
    final now = DateTime.now();

    when(mockRepository.getAll()).thenAnswer(
      (_) async => [
        Task(
          id: '1',
          title: 'Flutter projet',
          status: TaskStatus.todo,
          createdAt: now,
        ),
        Task(
          id: '2',
          title: 'Courses',
          status: TaskStatus.done,
          createdAt: now,
        ),
      ],
    );

    final container = ProviderContainer(
      overrides: [
        taskRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
    addTearDown(container.dispose);

    await container.read(tasksProvider.future);

    container.read(currentTabProvider.notifier).state = AppTab.projects;
    container.read(selectedStatusFilterProvider.notifier).state =
        TaskStatus.todo;
    container.read(searchTermProvider.notifier).state = 'flutter';

    final filtered = container.read(filteredTasksProvider);

    expect(filtered.length, 1);
    expect(filtered.first.title, 'Flutter projet');
  });
}
