import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../menu/domain/models/menu_item.dart';
import '../domain/models/cart_item.dart';

part 'cart_controller.g.dart';

@riverpod
class CartController extends _$CartController {
  @override
  Cart build() {
    return const Cart(
      id: 'user-cart',
      items: [],
    );
  }

  void addItem(MenuItem menuItem, {int quantity = 1}) {
    final existingItemIndex = state.items.indexWhere(
      (item) => item.menuItem.id == menuItem.id,
    );

    if (existingItemIndex >= 0) {
      final existingItem = state.items[existingItemIndex];
      final newQuantity = existingItem.quantity + quantity;
      
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingItemIndex] = existingItem.copyWith(
        quantity: newQuantity,
      );
      
      state = state.copyWith(items: updatedItems);
    } else {
      final newItem = CartItem(
        id: '${menuItem.id}_${DateTime.now().millisecondsSinceEpoch}',
        menuItem: menuItem,
        quantity: quantity,
      );
      
      state = state.copyWith(
        items: [...state.items, newItem],
      );
    }
  }

  void removeItem(String cartItemId) {
    final updatedItems = state.items
        .where((item) => item.id != cartItemId)
        .toList();
    
    state = state.copyWith(items: updatedItems);
  }

  void updateQuantity(String cartItemId, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(cartItemId);
      return;
    }

    final updatedItems = state.items.map((item) {
      if (item.id == cartItemId) {
        return item.copyWith(quantity: newQuantity);
      }
      return item;
    }).toList();

    state = state.copyWith(items: updatedItems);
  }

  void clearCart() {
    state = state.copyWith(items: []);
  }

  void updateTip(double tipAmount) {
    state = state.copyWith(tip: tipAmount);
  }

  void updateTax(double taxAmount) {
    state = state.copyWith(tax: taxAmount);
  }
}