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

  testWidgets('renders splash screen content', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));

    expect(find.text('Découvrez.'), findsOneWidget);
    expect(find.text('Les exclusivités.'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
