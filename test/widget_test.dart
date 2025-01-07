// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:culinary_map_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:culinary_map_app/main.dart';

void main() {
  testWidgets('HomeScreen displays a list of restaurants', (WidgetTester tester) async {
    // Build HomeScreen and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Verify that a restaurant name appears in the list.
    expect(find.text('Restoran A'), findsOneWidget);
    expect(find.text('Restoran B'), findsOneWidget);

    // Tap on a restaurant item and verify navigation to DetailScreen.
    await tester.tap(find.text('Restoran A'));
    await tester.pumpAndSettle();

    // Verify that DetailScreen is displayed with restaurant details.
    expect(find.text('Masakan Italia terbaik di kota.'), findsOneWidget);
  });
}

