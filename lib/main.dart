import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import 'application/providers/repository_providers.dart';
import 'application/providers/task_providers.dart';
import 'application/providers/theme_provider.dart';
import 'core/constants/app_constants.dart';
import 'core/utils/notification_service.dart';
import 'infrastructure/datasources/preferences_datasource.dart';
import 'presentation/router/app_router.dart';
import 'presentation/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  const windowOptions = WindowOptions(
    minimumSize: Size(
      AppConstants.minWindowWidth,
      AppConstants.minWindowHeight,
    ),
    title: AppConstants.appTitle,
    center: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  final isTest = Platform.environment['FLUTTER_TEST'] == 'true';
  if (!isTest) {
    await NotificationService.initialize();
  }
  final datasource = await PreferencesDatasource.create();

  runApp(
    ProviderScope(
      overrides: [
        preferencesDatasourceProvider.overrideWithValue(datasource),
      ],
      child: const TaskManagerApp(),
    ),
  );
}

class TaskManagerApp extends ConsumerStatefulWidget {
  const TaskManagerApp({super.key});

  @override
  ConsumerState<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends ConsumerState<TaskManagerApp> {
  late final AppRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter();
    if (!kIsWeb && Platform.environment['FLUTTER_TEST'] != 'true') {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scheduleNotifications());
    }
  }

  Future<void> _scheduleNotifications() async {
    try {
      final tasks = await ref.read(tasksProvider.future);
      await NotificationService.scheduleDueReminders(tasks);
    } catch (_) {
      // Ignorer en environnement sans notification desktop
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeAsync = ref.watch(themeModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeAsync.valueOrNull ?? ThemeMode.light,
      routerConfig: _router.config(),
    );
  }
}
