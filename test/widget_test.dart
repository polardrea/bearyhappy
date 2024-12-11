import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bearyhappy_ver1/main.dart';

void main() {
  group('LoginPage Widget Tests', () {
    testWidgets('LoginPage displays input fields and button', (WidgetTester tester) async {
      // Build the LoginPage widget
      await tester.pumpWidget(MyApp());

      // Verify the presence of Username TextField
      expect(find.byType(TextField), findsNWidgets(2));

      // Verify the presence of the Sign In button
      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('Button press navigates to HomePage', (WidgetTester tester) async {
      // Build the LoginPage widget
      await tester.pumpWidget(MyApp());

      // Tap the Sign In button
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // Verify navigation to HomePage
      expect(find.text('Welcome to Starzada E-Commerce!'), findsOneWidget);
    });
  });
}

