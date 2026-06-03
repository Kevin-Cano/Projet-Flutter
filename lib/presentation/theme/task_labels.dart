import 'package:flutter/material.dart';

import '../../domain/entities/task.dart';

String priorityLabel(TaskPriority priority) => switch (priority) {
  TaskPriority.low => 'Basse',
  TaskPriority.medium => 'Moyenne',
  TaskPriority.high => 'Haute',
  TaskPriority.urgent => 'Urgente',
};

String statusLabel(TaskStatus status) => switch (status) {
  TaskStatus.todo => 'À faire',
  TaskStatus.inProgress => 'En cours',
  TaskStatus.done => 'Terminée',
};

Color priorityColor(TaskPriority priority) => switch (priority) {
  TaskPriority.low => Colors.blueGrey,
  TaskPriority.medium => Colors.blue,
  TaskPriority.high => Colors.orange,
  TaskPriority.urgent => Colors.red,
};

Color statusColor(TaskStatus status) => switch (status) {
  TaskStatus.todo => Colors.grey,
  TaskStatus.inProgress => Colors.amber,
  TaskStatus.done => Colors.green,
};
