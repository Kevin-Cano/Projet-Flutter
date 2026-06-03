import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/filter_providers.dart';
import '../../application/providers/project_providers.dart';
import '../../domain/entities/task.dart';
import '../theme/task_labels.dart';

class FiltersBar extends ConsumerWidget {
  const FiltersBar({super.key, required this.searchFocusNode});

  final FocusNode searchFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchVisible = ref.watch(searchVisibleProvider);
    final projects = ref.watch(projectsProvider).valueOrNull ?? [];

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          if (searchVisible)
            Expanded(
              child: TextField(
                focusNode: searchFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Rechercher…',
                  prefixIcon: Icon(Icons.search),
                  isDense: true,
                ),
                onChanged: (v) =>
                    ref.read(searchTermProvider.notifier).state = v,
              ),
            )
          else
            const Spacer(),
          const SizedBox(width: 8),
          DropdownButton<TaskStatus?>(
            value: ref.watch(selectedStatusFilterProvider),
            hint: const Text('Statut'),
            items: [
              const DropdownMenuItem(value: null, child: Text('Tous statuts')),
              ...TaskStatus.values.map(
                (s) => DropdownMenuItem(
                  value: s,
                  child: Text(statusLabel(s)),
                ),
              ),
            ],
            onChanged: (v) =>
                ref.read(selectedStatusFilterProvider.notifier).state = v,
          ),
          const SizedBox(width: 8),
          DropdownButton<TaskPriority?>(
            value: ref.watch(selectedPriorityFilterProvider),
            hint: const Text('Priorité'),
            items: [
              const DropdownMenuItem(value: null, child: Text('Toutes priorités')),
              ...TaskPriority.values.map(
                (p) => DropdownMenuItem(
                  value: p,
                  child: Text(priorityLabel(p)),
                ),
              ),
            ],
            onChanged: (v) =>
                ref.read(selectedPriorityFilterProvider.notifier).state = v,
          ),
          const SizedBox(width: 8),
          DropdownButton<String?>(
            value: ref.watch(selectedProjectIdProvider),
            hint: const Text('Projet'),
            items: [
              const DropdownMenuItem(value: null, child: Text('Tous projets')),
              ...projects.map(
                (p) => DropdownMenuItem(value: p.id, child: Text(p.name)),
              ),
            ],
            onChanged: (v) =>
                ref.read(selectedProjectIdProvider.notifier).state = v,
          ),
        ],
      ),
    );
  }
}
