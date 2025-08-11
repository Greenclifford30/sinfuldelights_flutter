import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sinfuldelights_flutter/features/menu/presentation/widgets/menu_item_card.dart';
import 'package:sinfuldelights_flutter/features/menu/domain/models/menu_item.dart';
import 'package:sinfuldelights_flutter/core/theme/app_theme.dart';

void main() {
  group('MenuItemCard Widget Tests', () {
    late MenuItem testMenuItem;
    late MenuItem outOfStockItem;
    late MenuItem specialItem;

    setUp(() {
      testMenuItem = const MenuItem(
        id: '1',
        name: 'Test Item',
        description: 'A delicious test item for testing purposes',
        price: 12.99,
        stockQty: 5,
        imageUrl: 'https://example.com/test.jpg',
      );

      outOfStockItem = const MenuItem(
        id: '2',
        name: 'Out of Stock Item',
        description: 'This item is out of stock',
        price: 15.99,
        stockQty: 0,
        imageUrl: 'https://example.com/test.jpg',
      );

      specialItem = const MenuItem(
        id: '3',
        name: 'Special Item',
        description: 'Today\'s special item',
        price: 18.99,
        stockQty: 3,
        isSpecial: true,
        imageUrl: 'https://example.com/test.jpg',
        dietaryTags: ['vegetarian', 'gluten-free'],
      );
    });

    Widget createTestWidget(MenuItem menuItem, {VoidCallback? onAddToCart}) {
      return MaterialApp(
        theme: AppTheme.darkTheme,
        home: Scaffold(
          body: MenuItemCard(
            menuItem: menuItem,
            onAddToCart: onAddToCart ?? () {},
          ),
        ),
      );
    }

    testWidgets('should display menu item information correctly', (tester) async {
      await tester.pumpWidget(createTestWidget(testMenuItem));

      expect(find.text('Test Item'), findsOneWidget);
      expect(find.text('A delicious test item for testing purposes'), findsOneWidget);
      expect(find.text('\$12.99'), findsOneWidget);
      expect(find.text('Add'), findsOneWidget);
    });

    testWidgets('should show special badge for special items', (tester) async {
      await tester.pumpWidget(createTestWidget(specialItem));

      expect(find.text('SPECIAL'), findsOneWidget);
    });

    testWidgets('should display dietary tags', (tester) async {
      await tester.pumpWidget(createTestWidget(specialItem));

      expect(find.text('VEGETARIAN'), findsOneWidget);
      expect(find.text('GLUTEN-FREE'), findsOneWidget);
    });

    testWidgets('should show sold out state for out of stock items', (tester) async {
      await tester.pumpWidget(createTestWidget(outOfStockItem));

      expect(find.text('SOLD OUT'), findsOneWidget);
      expect(find.text('Sold Out'), findsOneWidget);
      
      // Button should be disabled
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
    });

    testWidgets('should call onAddToCart when add button is tapped', (tester) async {
      bool wasCallbackCalled = false;
      
      await tester.pumpWidget(createTestWidget(
        testMenuItem,
        onAddToCart: () => wasCallbackCalled = true,
      ));

      await tester.tap(find.text('Add'));
      
      expect(wasCallbackCalled, isTrue);
    });

    testWidgets('should not call onAddToCart for out of stock items', (tester) async {
      bool wasCallbackCalled = false;
      
      await tester.pumpWidget(createTestWidget(
        outOfStockItem,
        onAddToCart: () => wasCallbackCalled = true,
      ));

      await tester.tap(find.text('Sold Out'));
      
      expect(wasCallbackCalled, isFalse);
    });
  });
}