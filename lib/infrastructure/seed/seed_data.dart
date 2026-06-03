import '../../domain/entities/project.dart';
import '../../domain/entities/task.dart';

class SeedData {
  SeedData._();

  static List<Project> initialProjects() => [
    const Project(id: 'p1', name: 'Personnel', colorValue: 0xFF6750A4),
    const Project(id: 'p2', name: 'Travail', colorValue: 0xFF00695C),
    const Project(id: 'p3', name: 'Études', colorValue: 0xFFE65100),
  ];

  static List<Task> initialTasks() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day, 18);
    final weekEnd = now.add(const Duration(days: 3));

    return [
      Task(
        id: 't1',
        title: 'Réviser le projet final',
        description: 'Architecture hexagonale et tests',
        priority: TaskPriority.high,
        status: TaskStatus.inProgress,
        dueDate: today,
        projectId: 'p3',
        createdAt: now.subtract(const Duration(days: 2)),
        sortOrder: 0,
        subTasks: [
          const SubTask(id: 'st1', title: 'Domain layer'),
          const SubTask(id: 'st2', title: 'Tests mockito', completed: true),
        ],
        tagIds: ['urgent'],
      ),
      Task(
        id: 't2',
        title: 'Courses',
        priority: TaskPriority.medium,
        status: TaskStatus.todo,
        dueDate: today,
        projectId: 'p1',
        createdAt: now.subtract(const Duration(days: 1)),
        sortOrder: 1,
      ),
      Task(
        id: 't3',
        title: 'Réunion équipe',
        priority: TaskPriority.urgent,
        status: TaskStatus.todo,
        dueDate: weekEnd,
        projectId: 'p2',
        createdAt: now,
        sortOrder: 2,
        tagIds: ['work'],
      ),
      Task(
        id: 't4',
        title: 'Documentation README',
        priority: TaskPriority.low,
        status: TaskStatus.done,
        projectId: 'p3',
        createdAt: now.subtract(const Duration(days: 5)),
        sortOrder: 3,
      ),
    ];
  }

  static List<TaskTag> initialTags() => [
    const TaskTag(id: 'urgent', label: 'Urgent', colorValue: 0xFFB3261E),
    const TaskTag(id: 'work', label: 'Travail', colorValue: 0xFF1565C0),
  ];
}
