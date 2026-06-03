import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/projects_page.dart';
import '../pages/settings_page.dart';
import '../pages/shell_page.dart';
import '../pages/task_detail_page.dart';
import '../pages/today_page.dart';
import '../pages/week_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: ShellRoute.page,
      initial: true,
      children: [
        AutoRoute(path: 'projects', page: ProjectsRoute.page, initial: true),
        AutoRoute(path: 'today', page: TodayRoute.page),
        AutoRoute(path: 'week', page: WeekRoute.page),
        AutoRoute(path: 'settings', page: SettingsRoute.page),
      ],
    ),
    AutoRoute(path: '/task/:id', page: TaskDetailRoute.page),
  ];
}
