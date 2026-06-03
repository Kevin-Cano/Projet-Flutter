import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/project.dart';
import 'use_case_providers.dart';

class ProjectsNotifier extends AsyncNotifier<List<Project>> {
  @override
  Future<List<Project>> build() async {
    return ref.read(listProjectsUseCaseProvider).call();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(listProjectsUseCaseProvider).call(),
    );
  }

  Future<void> create({required String name, required int colorValue}) async {
    await ref
        .read(createProjectUseCaseProvider)
        .call(name: name, colorValue: colorValue);
    await refresh();
  }

  Future<void> delete(String id) async {
    await ref.read(deleteProjectUseCaseProvider).call(id);
    await refresh();
  }
}

final projectsProvider = AsyncNotifierProvider<ProjectsNotifier, List<Project>>(
  ProjectsNotifier.new,
);

final selectedProjectIdProvider = StateProvider<String?>((ref) => null);
