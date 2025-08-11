import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../menu/domain/models/menu_item.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    required MenuItem menuItem,
    required int quantity,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}

extension CartItemExtension on CartItem {
  double get totalPrice => menuItem.price * quantity;
}

@freezed
class Cart with _$Cart {
  const factory Cart({
    required String id,
    @Default([]) List<CartItem> items,
    @Default(0.0) double tax,
    @Default(0.0) double tip,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

extension CartExtension on Cart {
  double get subtotal => items.fold(0.0, (sum, item) => sum + item.totalPrice);
  double get total => subtotal + tax + tip;
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
  bool get isEmpty => items.isEmpty;
}

