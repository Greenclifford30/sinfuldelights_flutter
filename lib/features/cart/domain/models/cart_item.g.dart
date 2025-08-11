// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      id: json['id'] as String,
      menuItem: MenuItem.fromJson(json['menuItem'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'menuItem': instance.menuItem,
      'quantity': instance.quantity,
    };

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
  id: json['id'] as String,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
  tip: (json['tip'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items,
      'tax': instance.tax,
      'tip': instance.tip,
    };
