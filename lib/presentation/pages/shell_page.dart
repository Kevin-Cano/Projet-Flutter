import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/filter_providers.dart';
import '../../application/providers/theme_provider.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_tab.dart';
import '../router/app_router.dart';
import '../widgets/filters_bar.dart';
import '../widgets/task_list_view.dart';

@RoutePage()
class ShellPage extends ConsumerStatefulWidget {
  const ShellPage({super.key});

  @override
  ConsumerState<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends ConsumerState<ShellPage> {
  final _searchFocusNode = FocusNode();
  final _taskListKey = GlobalKey<TaskListViewState>();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _openNewTask() {
    _taskListKey.currentState?.openCreateTask();
  }

  void _toggleSearch() {
    final visible = ref.read(searchVisibleProvider);
    ref.read(searchVisibleProvider.notifier).state = !visible;
    if (!visible) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _searchFocusNode.requestFocus();
      });
    }
  }

  void _toggleTheme() {
    ref.read(themeModeProvider.notifier).toggle();
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyN, control: true):
            _openNewTask,
        const SingleActivator(LogicalKeyboardKey.keyF, control: true):
            _toggleSearch,
        const SingleActivator(LogicalKeyboardKey.keyD, control: true):
            _toggleTheme,
      },
      child: Focus(
        autofocus: true,
        child: AutoTabsRouter(
          routes: const [
            ProjectsRoute(),
            TodayRoute(),
            WeekRoute(),
            SettingsRoute(),
          ],
          builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            final isWide = MediaQuery.of(context).size.width >= 900;

            void select(int index) {
              tabsRouter.setActiveIndex(index);
              ref.read(currentTabProvider.notifier).state =
                  AppTab.values[index];
            }

            final rail = NavigationRail(
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: select,
              labelType: isWide
                  ? NavigationRailLabelType.all
                  : NavigationRailLabelType.none,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.folder_outlined),
                  label: Text('Projets'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.today_outlined),
                  label: Text("Aujourd'hui"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.date_range_outlined),
                  label: Text('Cette semaine'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  label: Text('Paramètres'),
                ),
              ],
            );

            final showFilters = tabsRouter.activeIndex <= 2;

            return Scaffold(
              appBar: AppBar(title: const Text(AppConstants.appTitle)),
              drawer: isWide ? null : Drawer(child: rail),
              body: Row(
                children: [
                  if (isWide) rail,
                  const VerticalDivider(width: 1),
                  Expanded(
                    child: Column(
                      children: [
                        if (showFilters)
                          FiltersBar(searchFocusNode: _searchFocusNode),
                        Expanded(
                          child: tabsRouter.activeIndex == 0
                              ? TaskListView(
                                  key: _taskListKey,
                                  searchFocusNode: _searchFocusNode,
                                )
                              : child,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
