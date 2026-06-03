import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/presentation/theme/app_theme.dart';

void main() {
  testWidgets('AppTheme fournit un ThemeData Material 3', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        home: const Scaffold(body: Text('Test')),
      ),
    );

    expect(find.text('Test'), findsOneWidget);
    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.theme!.useMaterial3, isTrue);
  });
}
