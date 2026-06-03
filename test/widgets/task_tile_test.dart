import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/presentation/theme/task_labels.dart';
import 'package:task_manager/presentation/widgets/task_tile.dart';

void main() {
  testWidgets('TaskTile affiche titre, priorité et statut en français', (
    WidgetTester tester,
  ) async {
    final task = Task(
      id: '1',
      title: 'Ma tâche',
      priority: TaskPriority.high,
      status: TaskStatus.inProgress,
      createdAt: DateTime(2025, 1, 1),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: TaskTile(task: task)),
      ),
    );

    expect(find.text('Ma tâche'), findsOneWidget);
    expect(find.text(priorityLabel(TaskPriority.high)), findsOneWidget);
    expect(find.text(statusLabel(TaskStatus.inProgress)), findsOneWidget);
  });
}
