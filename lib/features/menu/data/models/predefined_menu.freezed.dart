// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'predefined_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PredefinedMenu _$PredefinedMenuFromJson(Map<String, dynamic> json) {
  return _PredefinedMenu.fromJson(json);
}

/// @nodoc
mixin _$PredefinedMenu {
  String get templateId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<MenuItem> get items => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this PredefinedMenu to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PredefinedMenu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredefinedMenuCopyWith<PredefinedMenu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredefinedMenuCopyWith<$Res> {
  factory $PredefinedMenuCopyWith(
    PredefinedMenu value,
    $Res Function(PredefinedMenu) then,
  ) = _$PredefinedMenuCopyWithImpl<$Res, PredefinedMenu>;
  @useResult
  $Res call({
    String templateId,
    String name,
    List<MenuItem> items,
    DateTime createdAt,
    String? description,
    bool isActive,
  });
}

/// @nodoc
class _$PredefinedMenuCopyWithImpl<$Res, $Val extends PredefinedMenu>
    implements $PredefinedMenuCopyWith<$Res> {
  _$PredefinedMenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PredefinedMenu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? name = null,
    Object? items = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            templateId: null == templateId
                ? _value.templateId
                : templateId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<MenuItem>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PredefinedMenuImplCopyWith<$Res>
    implements $PredefinedMenuCopyWith<$Res> {
  factory _$$PredefinedMenuImplCopyWith(
    _$PredefinedMenuImpl value,
    $Res Function(_$PredefinedMenuImpl) then,
  ) = __$$PredefinedMenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String templateId,
    String name,
    List<MenuItem> items,
    DateTime createdAt,
    String? description,
    bool isActive,
  });
}

/// @nodoc
class __$$PredefinedMenuImplCopyWithImpl<$Res>
    extends _$PredefinedMenuCopyWithImpl<$Res, _$PredefinedMenuImpl>
    implements _$$PredefinedMenuImplCopyWith<$Res> {
  __$$PredefinedMenuImplCopyWithImpl(
    _$PredefinedMenuImpl _value,
    $Res Function(_$PredefinedMenuImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PredefinedMenu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? name = null,
    Object? items = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _$PredefinedMenuImpl(
        templateId: null == templateId
            ? _value.templateId
            : templateId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<MenuItem>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PredefinedMenuImpl implements _PredefinedMenu {
  const _$PredefinedMenuImpl({
    required this.templateId,
    required this.name,
    required final List<MenuItem> items,
    required this.createdAt,
    this.description,
    this.isActive = false,
  }) : _items = items;

  factory _$PredefinedMenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredefinedMenuImplFromJson(json);

  @override
  final String templateId;
  @override
  final String name;
  final List<MenuItem> _items;
  @override
  List<MenuItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime createdAt;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'PredefinedMenu(templateId: $templateId, name: $name, items: $items, createdAt: $createdAt, description: $description, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredefinedMenuImpl &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    templateId,
    name,
    const DeepCollectionEquality().hash(_items),
    createdAt,
    description,
    isActive,
  );

  /// Create a copy of PredefinedMenu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredefinedMenuImplCopyWith<_$PredefinedMenuImpl> get copyWith =>
      __$$PredefinedMenuImplCopyWithImpl<_$PredefinedMenuImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PredefinedMenuImplToJson(this);
  }
}

abstract class _PredefinedMenu implements PredefinedMenu {
  const factory _PredefinedMenu({
    required final String templateId,
    required final String name,
    required final List<MenuItem> items,
    required final DateTime createdAt,
    final String? description,
    final bool isActive,
  }) = _$PredefinedMenuImpl;

  factory _PredefinedMenu.fromJson(Map<String, dynamic> json) =
      _$PredefinedMenuImpl.fromJson;

  @override
  String get templateId;
  @override
  String get name;
  @override
  List<MenuItem> get items;
  @override
  DateTime get createdAt;
  @override
  String? get description;
  @override
  bool get isActive;

  /// Create a copy of PredefinedMenu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredefinedMenuImplCopyWith<_$PredefinedMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
