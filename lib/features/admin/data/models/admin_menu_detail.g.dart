// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_menu_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminMenuDetailImpl _$$AdminMenuDetailImplFromJson(
  Map<String, dynamic> json,
) => _$AdminMenuDetailImpl(
  menuId: json['menuId'] as String,
  date: json['date'] as String,
  title: json['title'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => AdminMenuItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AdminMenuDetailImplToJson(
  _$AdminMenuDetailImpl instance,
) => <String, dynamic>{
  'menuId': instance.menuId,
  'date': instance.date,
  'title': instance.title,
  'items': instance.items,
};

_$AdminMenuItemImpl _$$AdminMenuItemImplFromJson(Map<String, dynamic> json) =>
    _$AdminMenuItemImpl(
      itemId: json['itemId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      stockQty: (json['stockQty'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      isSpecial: json['isSpecial'] as bool,
    );

Map<String, dynamic> _$$AdminMenuItemImplToJson(_$AdminMenuItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'stockQty': instance.stockQty,
      'imageUrl': instance.imageUrl,
      'isSpecial': instance.isSpecial,
    };
