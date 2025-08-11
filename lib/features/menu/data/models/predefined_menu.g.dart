// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predefined_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredefinedMenuImpl _$$PredefinedMenuImplFromJson(Map<String, dynamic> json) =>
    _$PredefinedMenuImpl(
      templateId: json['templateId'] as String,
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String?,
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$PredefinedMenuImplToJson(
  _$PredefinedMenuImpl instance,
) => <String, dynamic>{
  'templateId': instance.templateId,
  'name': instance.name,
  'items': instance.items,
  'createdAt': instance.createdAt.toIso8601String(),
  'description': instance.description,
  'isActive': instance.isActive,
};
