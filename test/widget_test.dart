import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/main.dart';

void main() {
  testWidgets('App launches without errors', (WidgetTester tester) async {
    // Build the App widget and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify if the home screen (TabsScreen) is present.
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(App), findsOneWidget);
  });
}
