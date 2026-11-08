import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_menu_app/order_summary.dart';

void main() {
  testWidgets('Order Summary Screen shows correct text and total (RM 25.00)', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OrderSummaryScreen(),
      ),
    );

    expect(find.text('Item: Vegetable Pizza'), findsOneWidget);
    expect(find.text('Total Price: RM 25.00'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}