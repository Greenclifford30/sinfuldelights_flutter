import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item.freezed.dart';
part 'menu_item.g.dart';

@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    required String id,
    required String name,
    required String description,
    required double price,
    required int stockQty,
    @Default(false) bool isSpecial,
    @Default('') String imageUrl,
    @Default([]) List<String> dietaryTags,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);
}

@freezed
class DailyMenu with _$DailyMenu {
  const factory DailyMenu({
    required String id,
    required DateTime date,
    required String title,
    required List<MenuItem> items,
    @Default(true) bool isActive,
  }) = _DailyMenu;

  factory DailyMenu.fromJson(Map<String, dynamic> json) => _$DailyMenuFromJson(json);
}