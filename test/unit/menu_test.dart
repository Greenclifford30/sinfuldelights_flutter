import 'package:flutter_test/flutter_test.dart';
import 'package:sinfuldelights_flutter/features/menu/domain/models/menu_item.dart';

void main() {
  group('MenuItem', () {
    test('should create MenuItem with correct properties', () {
      const menuItem = MenuItem(
        id: '1',
        name: 'Test Item',
        description: 'Test Description',
        price: 10.99,
        stockQty: 5,
        isSpecial: true,
        imageUrl: 'test.jpg',
        dietaryTags: ['vegetarian'],
      );

      expect(menuItem.id, '1');
      expect(menuItem.name, 'Test Item');
      expect(menuItem.description, 'Test Description');
      expect(menuItem.price, 10.99);
      expect(menuItem.stockQty, 5);
      expect(menuItem.isSpecial, true);
      expect(menuItem.imageUrl, 'test.jpg');
      expect(menuItem.dietaryTags, ['vegetarian']);
    });

    test('should create MenuItem with default values', () {
      const menuItem = MenuItem(
        id: '1',
        name: 'Test Item',
        description: 'Test Description',
        price: 10.99,
        stockQty: 5,
      );

      expect(menuItem.isSpecial, false);
      expect(menuItem.imageUrl, '');
      expect(menuItem.dietaryTags, []);
    });
  });

  group('DailyMenu', () {
    test('should create DailyMenu with correct properties', () {
      const menuItems = [
        MenuItem(
          id: '1',
          name: 'Test Item',
          description: 'Test Description',
          price: 10.99,
          stockQty: 5,
        ),
      ];

      final date = DateTime(2025, 7, 19);
      final dailyMenu = DailyMenu(
        id: 'menu-1',
        date: date,
        title: 'Test Menu',
        items: menuItems,
        isActive: false,
      );

      expect(dailyMenu.id, 'menu-1');
      expect(dailyMenu.date, date);
      expect(dailyMenu.title, 'Test Menu');
      expect(dailyMenu.items.length, 1);
      expect(dailyMenu.isActive, false);
    });

    test('should have default isActive value as true', () {
      final date = DateTime(2025, 7, 19);
      final dailyMenu = DailyMenu(
        id: 'menu-1',
        date: date,
        title: 'Test Menu',
        items: [],
      );

      expect(dailyMenu.isActive, true);
    });
  });
}