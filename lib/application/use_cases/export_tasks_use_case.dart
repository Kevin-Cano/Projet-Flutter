import 'dart:convert';

import '../../domain/repositories/task_repository.dart';

class ExportTasksUseCase {
  ExportTasksUseCase(this._repository);

  final TaskRepository _repository;

  Future<String> toJson() async {
    final tasks = await _repository.getAll();
    return const JsonEncoder.withIndent('  ').convert(
      tasks.map((t) => t.toJson()).toList(),
    );
  }

  Future<String> toCsv() async {
    final tasks = await _repository.getAll();
    final buffer = StringBuffer(
      'id,titre,description,priorite,statut,echeance,projet,creation\n',
    );
    for (final t in tasks) {
      buffer.writeln(
        [
          t.id,
          _escape(t.title),
          _escape(t.description ?? ''),
          t.priority.name,
          t.status.name,
          t.dueDate?.toIso8601String() ?? '',
          t.projectId ?? '',
          t.createdAt.toIso8601String(),
        ].join(','),
      );
    }
    return buffer.toString();
  }

  String _escape(String value) {
    if (value.contains(',') || value.contains('"')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
  }
}
