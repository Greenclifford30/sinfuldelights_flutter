// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
  menuId: json['menuId'] as String,
  title: json['title'] as String,
  date: DateTime.parse(json['date'] as String),
  items: (json['items'] as List<dynamic>)
      .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  isActive: json['isActive'] as bool,
  description: json['description'] as String?,
  lastModified: json['lastModified'] == null
      ? null
      : DateTime.parse(json['lastModified'] as String),
);

Map<String, dynamic> _$$MenuImplToJson(_$MenuImpl instance) =>
    <String, dynamic>{
      'menuId': instance.menuId,
      'title': instance.title,
      'date': instance.date.toIso8601String(),
      'items': instance.items,
      'isActive': instance.isActive,
      'description': instance.description,
      'lastModified': instance.lastModified?.toIso8601String(),
    };
