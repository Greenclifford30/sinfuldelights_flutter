import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/menu_item.dart' as domain;

part 'menu_item.freezed.dart';
part 'menu_item.g.dart';

@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    required String itemId,
    required String name,
    required String description,
    required double price,
    required int stockQty,
    required bool isSpecial,
    String? imageUrl,
    @Default(false) bool isDisabled,
    DateTime? availableFrom,
    DateTime? availableTo,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

  // Add a static empty constructor within the class definition
  static MenuItem empty() => const MenuItem(
    itemId: '',
    name: '',
    description: '',
    price: 0.0,
    stockQty: 0,
    isSpecial: false,
  );
}

// Extension to add domain conversion method
extension MenuItemExtension on MenuItem {
  domain.MenuItem toDomainModel() {
    return domain.MenuItem(
      id: itemId,
      name: name,
      description: description,
      price: price,
      stockQty: stockQty,
      isSpecial: isSpecial,
      imageUrl: imageUrl ?? '',
      dietaryTags: const [],
    );
  }
}