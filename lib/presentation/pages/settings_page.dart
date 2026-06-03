import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/filter_providers.dart';
import '../../application/providers/theme_provider.dart';
import '../../application/providers/use_case_providers.dart';
import '../../core/constants/app_tab.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(currentTabProvider.notifier).state = AppTab.settings;
    final themeAsync = ref.watch(themeModeProvider);
    final statsAsync = ref.watch(taskStatisticsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Paramètres', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 24),
          Text('Apparence', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          themeAsync.when(
            loading: () => const CircularProgressIndicator(),
            error: (e, _) => Text('Erreur: $e'),
            data: (mode) => SegmentedButton<ThemeMode>(
              segments: const [
                ButtonSegment(
                  value: ThemeMode.light,
                  label: Text('Clair'),
                  icon: Icon(Icons.light_mode),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  label: Text('Sombre'),
                  icon: Icon(Icons.dark_mode),
                ),
              ],
              selected: {mode},
              onSelectionChanged: (set) {
                ref.read(themeModeProvider.notifier).setMode(set.first);
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Raccourci : Ctrl+D pour basculer le thème',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 32),
          Text('Statistiques', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          statsAsync.when(
            loading: () => const CircularProgressIndicator(),
            error: (e, _) => Text('Erreur: $e'),
            data: (stats) => Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total : ${stats.total}'),
                    Text('Terminées : ${stats.completed}'),
                    Text('En retard : ${stats.overdue}'),
                    const SizedBox(height: 8),
                    const Text('Par projet :'),
                    ...stats.byProject.entries.map(
                      (e) => Text('  ${e.key ?? "Sans projet"} : ${e.value}'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text('Export', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            children: [
              FilledButton.icon(
                onPressed: () => _export(context, ref, json: true),
                icon: const Icon(Icons.file_download),
                label: const Text('Exporter JSON'),
              ),
              FilledButton.icon(
                onPressed: () => _export(context, ref, json: false),
                icon: const Icon(Icons.table_chart),
                label: const Text('Exporter CSV'),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text('Raccourcis clavier', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          const Text('Ctrl+N — Nouvelle tâche'),
          const Text('Ctrl+F — Recherche'),
          const Text('Ctrl+D — Thème clair/sombre'),
        ],
      ),
    );
  }

  Future<void> _export(
    BuildContext context,
    WidgetRef ref, {
    required bool json,
  }) async {
    final useCase = ref.read(exportTasksUseCaseProvider);
    final content = json ? await useCase.toJson() : await useCase.toCsv();
    final ext = json ? 'json' : 'csv';
    final path = await FilePicker.platform.saveFile(
      dialogTitle: 'Exporter les tâches',
      fileName: 'tasks_export.$ext',
      type: FileType.custom,
      allowedExtensions: [ext],
    );
    if (path == null) return;
    await File(path).writeAsString(content);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exporté vers $path')),
      );
    }
  }
}
