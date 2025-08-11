import 'package:flutter_test/flutter_test.dart';
import 'package:sinfuldelights_flutter/features/cart/domain/models/cart_item.dart';
import 'package:sinfuldelights_flutter/features/menu/domain/models/menu_item.dart';

void main() {
  group('CartItem', () {
    test('should calculate total price correctly', () {
      const menuItem = MenuItem(
        id: '1',
        name: 'Test Item',
        description: 'Test Description',
        price: 10.99,
        stockQty: 5,
      );

      const cartItem = CartItem(
        id: 'cart-1',
        menuItem: menuItem,
        quantity: 3,
      );

      expect(cartItem.totalPrice, 32.97);
    });
  });

  group('Cart', () {
    late MenuItem testMenuItem1;
    late MenuItem testMenuItem2;

    setUp(() {
      testMenuItem1 = const MenuItem(
        id: '1',
        name: 'Test Item 1',
        description: 'Test Description 1',
        price: 10.00,
        stockQty: 5,
      );

      testMenuItem2 = const MenuItem(
        id: '2',
        name: 'Test Item 2',
        description: 'Test Description 2',
        price: 15.00,
        stockQty: 3,
      );
    });

    test('should calculate subtotal correctly', () {
      final cartItems = [
        CartItem(
          id: 'cart-1',
          menuItem: testMenuItem1,
          quantity: 2,
        ),
        CartItem(
          id: 'cart-2',
          menuItem: testMenuItem2,
          quantity: 1,
        ),
      ];

      final cart = Cart(
        id: 'test-cart',
        items: cartItems,
      );

      expect(cart.subtotal, 35.00);
    });

    test('should calculate total with tax and tip', () {
      final cartItems = [
        CartItem(
          id: 'cart-1',
          menuItem: testMenuItem1,
          quantity: 2,
        ),
      ];

      final cart = Cart(
        id: 'test-cart',
        items: cartItems,
        tax: 2.80,
        tip: 5.00,
      );

      expect(cart.subtotal, 20.00);
      expect(cart.total, 27.80);
    });

    test('should calculate total items correctly', () {
      final cartItems = [
        CartItem(
          id: 'cart-1',
          menuItem: testMenuItem1,
          quantity: 2,
        ),
        CartItem(
          id: 'cart-2',
          menuItem: testMenuItem2,
          quantity: 3,
        ),
      ];

      final cart = Cart(
        id: 'test-cart',
        items: cartItems,
      );

      expect(cart.totalItems, 5);
    });

    test('should identify empty cart correctly', () {
      const emptyCart = Cart(
        id: 'test-cart',
        items: [],
      );

      final nonEmptyCart = Cart(
        id: 'test-cart',
        items: [
          CartItem(
            id: 'cart-1',
            menuItem: testMenuItem1,
            quantity: 1,
          ),
        ],
      );

      expect(emptyCart.isEmpty, true);
      expect(nonEmptyCart.isEmpty, false);
    });
  });
}