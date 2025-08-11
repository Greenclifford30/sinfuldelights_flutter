// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuItemImpl _$$MenuItemImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemImpl(
      itemId: json['itemId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      stockQty: (json['stockQty'] as num).toInt(),
      isSpecial: json['isSpecial'] as bool,
      imageUrl: json['imageUrl'] as String?,
      isDisabled: json['isDisabled'] as bool? ?? false,
      availableFrom: json['availableFrom'] == null
          ? null
          : DateTime.parse(json['availableFrom'] as String),
      availableTo: json['availableTo'] == null
          ? null
          : DateTime.parse(json['availableTo'] as String),
    );

Map<String, dynamic> _$$MenuItemImplToJson(_$MenuItemImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'stockQty': instance.stockQty,
      'isSpecial': instance.isSpecial,
      'imageUrl': instance.imageUrl,
      'isDisabled': instance.isDisabled,
      'availableFrom': instance.availableFrom?.toIso8601String(),
      'availableTo': instance.availableTo?.toIso8601String(),
    };
