import 'package:flutter/material.dart';

import '../../domain/entities/project.dart';
import '../../domain/entities/task.dart';
import '../theme/task_labels.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    this.project,
    this.onTap,
    this.onDelete,
    this.tags = const [],
  });

  final Task task;
  final Project? project;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final List<TaskTag> tags;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        onTap: onTap,
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.status == TaskStatus.done
                ? TextDecoration.lineThrough
                : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.description != null && task.description!.isNotEmpty)
              Text(task.description!, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: [
                _Chip(
                  label: priorityLabel(task.priority),
                  color: priorityColor(task.priority),
                ),
                _Chip(
                  label: statusLabel(task.status),
                  color: statusColor(task.status),
                ),
                if (project != null)
                  _Chip(
                    label: project!.name,
                    color: Color(project!.colorValue),
                  ),
                if (task.dueDate != null)
                  _Chip(
                    label: _formatDate(task.dueDate!),
                    color: Colors.teal,
                  ),
                ...tags.map(
                  (tag) => _Chip(
                    label: tag.label,
                    color: Color(tag.colorValue),
                  ),
                ),
              ],
            ),
            if (task.subTasks.isNotEmpty) ...[
              const SizedBox(height: 6),
              ...task.subTasks.map(
                (st) => Row(
                  children: [
                    Icon(
                      st.completed
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        st.title,
                        style: TextStyle(
                          decoration: st.completed
                              ? TextDecoration.lineThrough
                              : null,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
        trailing: IconButton(
          tooltip: 'Supprimer',
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
