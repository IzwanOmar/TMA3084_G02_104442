import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_menu_app/main.dart';

// Class untuk mengelakkan ralat carian HTTP/Assets dalam persekitaran CI
class TestHttpOverrides extends HttpOverrides {}

void main() {
  setUpAll(() {
    HttpOverrides.global = TestHttpOverrides();
  });

  testWidgets('Test that the menu lists the three items', (WidgetTester tester) async {
    await tester.pumpWidget(const MenuApp());

    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Fries'), findsOneWidget);
  });

  testWidgets('Test that tapping a card opens its detail screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MenuApp());

    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();

    expect(find.text('Fresh vegetables with mozzarella and tomato sauce.'), findsOneWidget);
  });

  testWidgets('Test that the back button returns to the menu', (WidgetTester tester) async {
    await tester.pumpWidget(const MenuApp());

    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Restaurant Menu'), findsOneWidget);
  });
}