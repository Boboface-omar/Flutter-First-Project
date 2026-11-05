import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lab/main.dart';

void main() {
  testWidgets('app bar title is centered', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.centerTitle, isTrue);
    expect(find.text('Ma première app'), findsOneWidget);
  });
}
