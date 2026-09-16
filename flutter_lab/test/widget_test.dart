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
  testWidgets('Affiche le profil et incrémente les followers', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MonApplication());

    // Verify that our counter starts at 0.
    expect(find.text('0 followers'), findsOneWidget);

    // Tap the button and trigger a frame.
    await tester.tap(find.text('Suivre'));
    await tester.pump();

    // Verify that the counter has incremented.
    expect(find.text('1 followers'), findsOneWidget);
  });
}