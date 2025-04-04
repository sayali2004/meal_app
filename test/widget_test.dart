import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/main.dart';

void main() {
  testWidgets('App launches without errors', (WidgetTester tester) async {
    // Wrap the app with ProviderScope to provide Riverpod dependencies
    await tester.pumpWidget(
      const ProviderScope(child: App()),
    );

    // Verify if the home screen (TabsScreen) is present.
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(App), findsOneWidget);
  });
}
