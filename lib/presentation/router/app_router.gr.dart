// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ProjectsPage]
class ProjectsRoute extends PageRouteInfo<void> {
  const ProjectsRoute({List<PageRouteInfo>? children})
    : super(ProjectsRoute.name, initialChildren: children);

  static const String name = 'ProjectsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProjectsPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [ShellPage]
class ShellRoute extends PageRouteInfo<void> {
  const ShellRoute({List<PageRouteInfo>? children})
    : super(ShellRoute.name, initialChildren: children);

  static const String name = 'ShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ShellPage();
    },
  );
}

/// generated route for
/// [TaskDetailPage]
class TaskDetailRoute extends PageRouteInfo<TaskDetailRouteArgs> {
  TaskDetailRoute({Key? key, required String id, List<PageRouteInfo>? children})
    : super(
        TaskDetailRoute.name,
        args: TaskDetailRouteArgs(key: key, id: id),
        rawPathParams: {'id': id},
        initialChildren: children,
      );

  static const String name = 'TaskDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<TaskDetailRouteArgs>(
        orElse: () => TaskDetailRouteArgs(id: pathParams.getString('id')),
      );
      return TaskDetailPage(key: args.key, id: args.id);
    },
  );
}

class TaskDetailRouteArgs {
  const TaskDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'TaskDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [TodayPage]
class TodayRoute extends PageRouteInfo<void> {
  const TodayRoute({List<PageRouteInfo>? children})
    : super(TodayRoute.name, initialChildren: children);

  static const String name = 'TodayRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TodayPage();
    },
  );
}

/// generated route for
/// [WeekPage]
class WeekRoute extends PageRouteInfo<void> {
  const WeekRoute({List<PageRouteInfo>? children})
    : super(WeekRoute.name, initialChildren: children);

  static const String name = 'WeekRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WeekPage();
    },
  );
}
