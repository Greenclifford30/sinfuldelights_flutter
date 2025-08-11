import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sinfuldelights_flutter/features/menu/data/models/menu_item.dart';
import 'package:sinfuldelights_flutter/features/menu/presentation/widgets/menu_item_form.dart';

void main() {
  late MenuItem item;

  setUp(() {
    item = MenuItem(
      itemId: 'test-item',
      name: 'Test Item',
      description: 'Test Description',
      price: 9.99,
      stockQty: 10,
      isSpecial: false,
    );
  });

  testWidgets('should render empty form correctly', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuItemForm(onSave: (_) {}),
          ),
        ),
      ),
    );

    expect(find.text('Item Name'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('Price'), findsOneWidget);
    expect(find.text('Stock Quantity'), findsOneWidget);
    expect(find.text('Special Item'), findsOneWidget);
    expect(find.text('Add Item'), findsOneWidget);
  });

  testWidgets('should render form with initial data correctly', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuItemForm(
              initialItem: item,
              onSave: (_) {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Test Item'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
    expect(find.text('9.99'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
    expect(find.text('Update Item'), findsOneWidget);
  });

  testWidgets('should validate required fields', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuItemForm(onSave: (_) {}),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Add Item'));
    await tester.pump();

    expect(find.text('Please enter a name'), findsOneWidget);
    expect(find.text('Please enter a description'), findsOneWidget);
    expect(find.text('Please enter a price'), findsOneWidget);
    expect(find.text('Please enter a stock quantity'), findsOneWidget);
  });

  testWidgets('should validate price format', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuItemForm(onSave: (_) {}),
          ),
        ),
      ),
    );

    await tester.enterText(find.widgetWithText(TextFormField, 'Price'), 'invalid');
    await tester.tap(find.text('Add Item'));
    await tester.pump();

    expect(find.text('Please enter a valid price'), findsOneWidget);
  });

  testWidgets('should validate negative stock quantity', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuItemForm(onSave: (_) {}),
          ),
        ),
      ),
    );

    await tester.enterText(find.widgetWithText(TextFormField, 'Stock Quantity'), '-1');
    await tester.tap(find.text('Add Item'));
    await tester.pump();

    expect(find.text('Please enter a valid quantity'), findsOneWidget);
  });

  testWidgets('should call onSave with updated data', (tester) async {
    MenuItem? savedItem;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: MenuItemForm(
              onSave: (item) => savedItem = item,
            ),
          ),
        ),
      ),
    );

    await tester.enterText(find.widgetWithText(TextFormField, 'Item Name'), 'New Item');
    await tester.enterText(find.widgetWithText(TextFormField, 'Description'), 'New Description');
    await tester.enterText(find.widgetWithText(TextFormField, 'Price'), '19.99');
    await tester.enterText(find.widgetWithText(TextFormField, 'Stock Quantity'), '20');
    await tester.tap(find.text('Add Item'));
    await tester.pump();

    expect(savedItem?.name, equals('New Item'));
    expect(savedItem?.description, equals('New Description'));
    expect(savedItem?.price, equals(19.99));
    expect(savedItem?.stockQty, equals(20));
  });
}