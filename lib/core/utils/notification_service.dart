import 'package:local_notifier/local_notifier.dart';

import '../../domain/entities/task.dart';
import 'date_utils.dart';

class NotificationService {
  static Future<void> initialize() async {
    await localNotifier.setup(
      appName: 'Gestionnaire de tâches',
    );
  }

  static Future<void> scheduleDueReminders(List<Task> tasks) async {
    for (final task in tasks) {
      if (task.dueDate == null || task.status == TaskStatus.done) continue;
      if (!isDueToday(task.dueDate)) continue;

      final notification = LocalNotification(
        title: 'Échéance aujourd\'hui',
        body: task.title,
      );
      notification.show();
    }
  }
}
