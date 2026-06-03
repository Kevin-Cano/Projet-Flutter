import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/filter_providers.dart';
import '../../application/providers/project_providers.dart';
import '../../application/providers/tag_providers.dart';
import '../../application/providers/task_providers.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/task.dart';
import '../router/app_router.dart';
import 'confirm_delete_dialog.dart';
import 'project_form_dialog.dart';
import 'task_form_dialog.dart';
import 'task_tile.dart';

class TaskListView extends ConsumerStatefulWidget {
  const TaskListView({super.key, this.searchFocusNode});

  final FocusNode? searchFocusNode;

  @override
  ConsumerState<TaskListView> createState() => TaskListViewState();
}

class TaskListViewState extends ConsumerState<TaskListView> {
  void openCreateTask() => _createTask(context);

  @override
  Widget build(BuildContext context) {
    final tasksAsync = ref.watch(tasksProvider);
    final projectsAsync = ref.watch(projectsProvider);
    final tags = ref.watch(tagsProvider);

    return tasksAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Erreur: $error')),
      data: (_) => projectsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Erreur projets: $error')),
        data: (projects) {
          final visible = ref.watch(filteredTasksProvider);
          final byId = {for (final p in projects) p.id: p};
          final tagById = {for (final t in tags) t.id: t};

          return Row(
            children: [
              SizedBox(
                width: 220,
                child: _ProjectSidebar(
                  projects: projects,
                  onCreate: () => _createProject(context),
                ),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          FilledButton.icon(
                            onPressed: () => _createTask(context),
                            icon: const Icon(Icons.add),
                            label: const Text('Tâche'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: visible.isEmpty
                          ? const Center(child: Text('Aucune tâche'))
                          : ReorderableListView.builder(
                              buildDefaultDragHandles: false,
                              itemCount: visible.length,
                              // ignore: deprecated_member_use
                              onReorder: (oldIndex, newIndex) {
                                ref
                                    .read(tasksProvider.notifier)
                                    .reorder(oldIndex, newIndex, visible);
                              },
                              itemBuilder: (context, index) {
                                final task = visible[index];
                                return ReorderableDragStartListener(
                                  key: ValueKey(task.id),
                                  index: index,
                                  child: TaskTile(
                                    task: task,
                                    project: task.projectId == null
                                        ? null
                                        : byId[task.projectId],
                                    tags: task.tagIds
                                        .map((id) => tagById[id])
                                        .whereType<TaskTag>()
                                        .toList(),
                                    onTap: () => context.router.push(
                                      TaskDetailRoute(id: task.id),
                                    ),
                                    onDelete: () => _deleteTask(context, task),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _createTask(BuildContext context) async {
    final projects = ref.read(projectsProvider).valueOrNull ?? [];
    final tags = ref.read(tagsProvider);
    final result = await showDialog<TaskFormResult>(
      context: context,
      builder: (_) => TaskFormDialog(projects: projects, tags: tags),
    );
    if (result == null) return;
    await ref.read(tasksProvider.notifier).create(
      title: result.title,
      description: result.description,
      priority: result.priority,
      status: result.status,
      dueDate: result.dueDate,
      projectId: result.projectId,
      subTasks: result.subTasks,
      tagIds: result.tagIds,
    );
  }

  Future<void> _createProject(BuildContext context) async {
    final result = await showDialog<ProjectFormResult>(
      context: context,
      builder: (_) => const ProjectFormDialog(),
    );
    if (result == null) return;
    await ref.read(projectsProvider.notifier).create(
      name: result.name,
      colorValue: result.colorValue,
    );
  }

  Future<void> _deleteTask(BuildContext context, Task task) async {
    final ok = await showConfirmDeleteDialog(context, itemName: task.title);
    if (!ok) return;
    await ref.read(tasksProvider.notifier).delete(task.id);
  }
}

class _ProjectSidebar extends ConsumerWidget {
  const _ProjectSidebar({required this.projects, required this.onCreate});

  final List<Project> projects;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedProjectIdProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'Projets',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ListTile(
          selected: selected == null,
          leading: const Icon(Icons.all_inbox),
          title: const Text('Tous'),
          onTap: () =>
              ref.read(selectedProjectIdProvider.notifier).state = null,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return ListTile(
                selected: selected == project.id,
                leading: CircleAvatar(
                  radius: 10,
                  backgroundColor: Color(project.colorValue),
                ),
                title: Text(project.name),
                onTap: () => ref
                    .read(selectedProjectIdProvider.notifier)
                    .state = project.id,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: OutlinedButton.icon(
            onPressed: onCreate,
            icon: const Icon(Icons.add),
            label: const Text('Projet'),
          ),
        ),
      ],
    );
  }
}
