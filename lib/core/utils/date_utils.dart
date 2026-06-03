extension TaskDateUtils on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isInSameWeek(DateTime other) {
    final start = other.startOfWeek;
    final end = start.add(const Duration(days: 7));
    return isAfter(start.subtract(const Duration(microseconds: 1))) &&
        isBefore(end);
  }

  DateTime get startOfWeek {
    final weekday = this.weekday;
    return DateTime(year, month, day).subtract(Duration(days: weekday - 1));
  }
}

extension DateTimeList on List<DateTime> {
  static DateTime today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}

bool isDueToday(DateTime? dueDate) {
  if (dueDate == null) return false;
  return dueDate.isSameDay(DateTime.now());
}

bool isDueThisWeek(DateTime? dueDate) {
  if (dueDate == null) return false;
  return dueDate.isInSameWeek(DateTime.now());
}

bool isOverdue(DateTime? dueDate, {required bool isDone}) {
  if (dueDate == null || isDone) return false;
  final today = DateTime.now();
  final endOfToday = DateTime(today.year, today.month, today.day, 23, 59, 59);
  return dueDate.isBefore(endOfToday) && !dueDate.isSameDay(today);
}
