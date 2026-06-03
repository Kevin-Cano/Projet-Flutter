import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/filter_providers.dart';
import '../../core/constants/app_tab.dart';

@RoutePage()
class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(currentTabProvider.notifier).state = AppTab.projects;
    return const SizedBox.shrink();
  }
}
