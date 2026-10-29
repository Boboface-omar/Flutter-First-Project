import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lab/main.dart';

void main() {
  testWidgets('theme switch toggles between light and dark', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    MaterialApp app = tester.widget(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.light);

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    app = tester.widget(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.dark);
  });
}
