// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_lab/main.dart';

void main() {
  testWidgets('renders the centered message form', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Ma première app'), findsOneWidget);
    expect(find.text('Écris ton message'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Appuie sur le bouton pour valider.'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('floating action button displays the entered message', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField), 'Bonjour Flutter');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(
      find.descendant(
        of: find.byType(SnackBar),
        matching: find.text('Bonjour Flutter'),
      ),
      findsOneWidget,
    );
  });
}
