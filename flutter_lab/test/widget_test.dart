// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_lab/main.dart';

void main() {
  test('splash_person asset exists', () {
    expect(File('assets/images/splash_person.png').existsSync(), isTrue);
  });

  testWidgets('renders app shell', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Statefull BottomNav'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('password visibility can be toggled', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final passwordField = find.byWidgetPredicate(
      (widget) =>
          widget is TextField && widget.decoration?.labelText == 'Mot de passe',
    );
    expect(tester.widget<TextField>(passwordField).obscureText, isTrue);

    await tester.tap(find.byTooltip('Afficher le mot de passe'));
    await tester.pump();

    expect(tester.widget<TextField>(passwordField).obscureText, isFalse);
    expect(find.byTooltip('Masquer le mot de passe'), findsOneWidget);

    await tester.tap(find.byTooltip('Masquer le mot de passe'));
    await tester.pump();

    expect(tester.widget<TextField>(passwordField).obscureText, isTrue);
  });
}
