import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/filter_providers.dart';
import '../../application/providers/project_providers.dart';
import '../../application/providers/tag_providers.dart';
import '../../application/providers/task_providers.dart';
import '../../core/constants/app_tab.dart';
import '../../domain/entities/task.dart';
import '../router/app_router.dart';
import '../widgets/confirm_delete_dialog.dart';
import '../widgets/task_tile.dart';

@RoutePage()
class TodayPage extends ConsumerWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(currentTabProvider.notifier).state = AppTab.today;
    final visible = ref.watch(filteredTasksProvider);
    final projects = ref.watch(projectsProvider).valueOrNull ?? [];
    final byId = {for (final p in projects) p.id: p};
    final tags = ref.watch(tagsProvider);
    final tagById = {for (final t in tags) t.id: t};

    if (visible.isEmpty) {
      return const Center(child: Text('Aucune tâche pour aujourd\'hui'));
    }

    return ListView.builder(
      itemCount: visible.length,
      itemBuilder: (context, index) {
        final task = visible[index];
        return TaskTile(
          task: task,
          project: task.projectId == null ? null : byId[task.projectId],
          tags: task.tagIds.map((id) => tagById[id]).whereType<TaskTag>().toList(),
          onTap: () => context.router.push(TaskDetailRoute(id: task.id)),
          onDelete: () async {
            final ok = await showConfirmDeleteDialog(
              context,
              itemName: task.title,
            );
            if (ok) await ref.read(tasksProvider.notifier).delete(task.id);
          },
        );
      },
    );
  }
}
