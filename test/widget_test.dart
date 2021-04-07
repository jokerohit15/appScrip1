// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:appscrip1/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  testWidgets('login to blank page', (WidgetTester tester) async {
    final email = find.byKey(const ValueKey('Email Field'));
    final password = find.byKey(const ValueKey('Password Field'));
    final login = find.byKey(const ValueKey('Login Button'));
    // Build our app and trigger a frame.
    await tester.pumpWidget(GetMaterialApp(home: LoginScreen()));
    await tester.enterText(email, 'rohit@gmail.com');
    await tester.enterText(password, 'Rohit_08');
    await tester.tap(login);
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('rohit@gmail.com'), findsNothing);
    expect(find.text('Rohit_08'), findsNothing);
  });
}
