import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_menu_detail.freezed.dart';
part 'admin_menu_detail.g.dart';

@freezed
class AdminMenuDetail with _$AdminMenuDetail {
  const factory AdminMenuDetail({
    required String menuId,
    required String date,
    required String title,
    required List<AdminMenuItem> items,
  }) = _AdminMenuDetail;

  factory AdminMenuDetail.fromJson(Map<String, dynamic> json) => 
      _$AdminMenuDetailFromJson(json);
}

@freezed
class AdminMenuItem with _$AdminMenuItem {
  const factory AdminMenuItem({
    required String itemId,
    required String name,
    required String description,
    required double price,
    required int stockQty,
    required String imageUrl,
    required bool isSpecial,
  }) = _AdminMenuItem;

  factory AdminMenuItem.fromJson(Map<String, dynamic> json) => 
      _$AdminMenuItemFromJson(json);
}