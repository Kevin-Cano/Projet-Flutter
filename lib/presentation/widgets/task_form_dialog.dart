import 'package:flutter/material.dart';

import '../../domain/entities/project.dart';
import '../../domain/entities/task.dart';
import '../theme/task_labels.dart';

class TaskFormResult {
  const TaskFormResult({
    required this.title,
    this.description,
    required this.priority,
    required this.status,
    this.projectId,
    this.dueDate,
    this.subTasks = const [],
    this.tagIds = const [],
  });

  final String title;
  final String? description;
  final TaskPriority priority;
  final TaskStatus status;
  final String? projectId;
  final DateTime? dueDate;
  final List<SubTask> subTasks;
  final List<String> tagIds;
}

class TaskFormDialog extends StatefulWidget {
  const TaskFormDialog({
    super.key,
    this.initialTask,
    required this.projects,
    this.tags = const [],
  });

  final Task? initialTask;
  final List<Project> projects;
  final List<TaskTag> tags;

  @override
  State<TaskFormDialog> createState() => _TaskFormDialogState();
}

class _TaskFormDialogState extends State<TaskFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _title;
  late final TextEditingController _description;
  late TaskPriority _priority;
  late TaskStatus _status;
  String? _projectId;
  DateTime? _dueDate;
  final List<String> _selectedTagIds = [];
  final List<SubTask> _subTasks = [];
  final _subTaskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.initialTask?.title ?? '');
    _description = TextEditingController(
      text: widget.initialTask?.description ?? '',
    );
    _priority = widget.initialTask?.priority ?? TaskPriority.medium;
    _status = widget.initialTask?.status ?? TaskStatus.todo;
    _projectId = widget.initialTask?.projectId;
    _dueDate = widget.initialTask?.dueDate;
    _selectedTagIds.addAll(widget.initialTask?.tagIds ?? []);
    _subTasks.addAll(widget.initialTask?.subTasks ?? []);
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _subTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialTask == null ? 'Nouvelle tâche' : 'Modifier la tâche'),
      content: SizedBox(
        width: 480,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _title,
                  decoration: const InputDecoration(labelText: 'Titre *'),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Titre obligatoire' : null,
                ),
                TextFormField(
                  controller: _description,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<TaskPriority>(
                  value: _priority,
                  decoration: const InputDecoration(labelText: 'Priorité'),
                  items: TaskPriority.values
                      .map(
                        (p) => DropdownMenuItem(
                          value: p,
                          child: Text(priorityLabel(p)),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => setState(() => _priority = v!),
                ),
                DropdownButtonFormField<TaskStatus>(
                  value: _status,
                  decoration: const InputDecoration(labelText: 'Statut'),
                  items: TaskStatus.values
                      .map(
                        (s) => DropdownMenuItem(
                          value: s,
                          child: Text(statusLabel(s)),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => setState(() => _status = v!),
                ),
                DropdownButtonFormField<String?>(
                  value: _projectId,
                  decoration: const InputDecoration(labelText: 'Projet'),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Aucun')),
                    ...widget.projects.map(
                      (p) => DropdownMenuItem(value: p.id, child: Text(p.name)),
                    ),
                  ],
                  onChanged: (v) => setState(() => _projectId = v),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    _dueDate == null
                        ? 'Date d\'échéance'
                        : 'Échéance : ${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                        initialDate: _dueDate ?? DateTime.now(),
                      );
                      if (picked != null) setState(() => _dueDate = picked);
                    },
                  ),
                ),
                if (widget.tags.isNotEmpty) ...[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Tags'),
                  ),
                  Wrap(
                    spacing: 8,
                    children: widget.tags.map((tag) {
                      final selected = _selectedTagIds.contains(tag.id);
                      return FilterChip(
                        label: Text(tag.label),
                        selected: selected,
                        onSelected: (v) {
                          setState(() {
                            if (v) {
                              _selectedTagIds.add(tag.id);
                            } else {
                              _selectedTagIds.remove(tag.id);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Sous-tâches'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _subTaskController,
                        decoration: const InputDecoration(
                          hintText: 'Nouvelle sous-tâche',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final text = _subTaskController.text.trim();
                        if (text.isEmpty) return;
                        setState(() {
                          _subTasks.add(
                            SubTask(
                              id: DateTime.now().millisecondsSinceEpoch.toString(),
                              title: text,
                            ),
                          );
                          _subTaskController.clear();
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                ..._subTasks.map(
                  (st) => ListTile(
                    dense: true,
                    title: Text(st.title),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => setState(() => _subTasks.remove(st)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        FilledButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;
            Navigator.pop(
              context,
              TaskFormResult(
                title: _title.text.trim(),
                description: _description.text.trim(),
                priority: _priority,
                status: _status,
                projectId: _projectId,
                dueDate: _dueDate,
                subTasks: _subTasks,
                tagIds: _selectedTagIds,
              ),
            );
          },
          child: const Text('Enregistrer'),
        ),
      ],
    );
  }
}
