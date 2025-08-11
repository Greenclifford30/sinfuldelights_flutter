// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuItemImpl _$$MenuItemImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      stockQty: (json['stockQty'] as num).toInt(),
      isSpecial: json['isSpecial'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String? ?? '',
      dietaryTags:
          (json['dietaryTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MenuItemImplToJson(_$MenuItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'stockQty': instance.stockQty,
      'isSpecial': instance.isSpecial,
      'imageUrl': instance.imageUrl,
      'dietaryTags': instance.dietaryTags,
    };

_$DailyMenuImpl _$$DailyMenuImplFromJson(Map<String, dynamic> json) =>
    _$DailyMenuImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$DailyMenuImplToJson(_$DailyMenuImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'title': instance.title,
      'items': instance.items,
      'isActive': instance.isActive,
    };
