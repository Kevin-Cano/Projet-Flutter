import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/project_providers.dart';
import '../../application/providers/tag_providers.dart';
import '../../application/providers/task_providers.dart';
import '../theme/task_labels.dart';
import '../widgets/confirm_delete_dialog.dart';
import '../widgets/task_form_dialog.dart';

@RoutePage()
class TaskDetailPage extends ConsumerWidget {
  const TaskDetailPage({super.key, @PathParam('id') required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(tasksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail de la tâche'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.router.maybePop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () async {
              final task = tasksAsync.valueOrNull
                  ?.where((t) => t.id == id)
                  .firstOrNull;
              if (task == null) return;
              final ok = await showConfirmDeleteDialog(
                context,
                itemName: task.title,
              );
              if (ok) {
                await ref.read(tasksProvider.notifier).delete(id);
                if (context.mounted) context.router.maybePop();
              }
            },
          ),
        ],
      ),
      body: tasksAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
        data: (tasks) {
          final task = tasks.where((t) => t.id == id).firstOrNull;
          if (task == null) {
            return const Center(child: Text('Tâche introuvable'));
          }
          final projects = ref.watch(projectsProvider).valueOrNull ?? [];
          final tags = ref.watch(tagsProvider);

          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title, style: Theme.of(context).textTheme.headlineMedium),
                if (task.description != null) ...[
                  const SizedBox(height: 12),
                  Text(task.description!),
                ],
                const SizedBox(height: 16),
                Text('Priorité : ${priorityLabel(task.priority)}'),
                Text('Statut : ${statusLabel(task.status)}'),
                if (task.dueDate != null)
                  Text('Échéance : ${task.dueDate!.day}/${task.dueDate!.month}/${task.dueDate!.year}'),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () async {
                    final result = await showDialog<TaskFormResult>(
                      context: context,
                      builder: (_) => TaskFormDialog(
                        initialTask: task,
                        projects: projects,
                        tags: tags,
                      ),
                    );
                    if (result == null) return;
                    await ref.read(tasksProvider.notifier).updateTask(
                      task.copyWith(
                        title: result.title,
                        description: result.description?.isEmpty == true
                            ? null
                            : result.description,
                        priority: result.priority,
                        status: result.status,
                        projectId: result.projectId,
                        dueDate: result.dueDate,
                        subTasks: result.subTasks,
                        tagIds: result.tagIds,
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Modifier'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
