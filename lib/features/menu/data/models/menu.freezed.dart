// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return _Menu.fromJson(json);
}

/// @nodoc
mixin _$Menu {
  String get menuId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<MenuItem> get items => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get lastModified => throw _privateConstructorUsedError;

  /// Serializes this Menu to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res, Menu>;
  @useResult
  $Res call({
    String menuId,
    String title,
    DateTime date,
    List<MenuItem> items,
    bool isActive,
    String? description,
    DateTime? lastModified,
  });
}

/// @nodoc
class _$MenuCopyWithImpl<$Res, $Val extends Menu>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? title = null,
    Object? date = null,
    Object? items = null,
    Object? isActive = null,
    Object? description = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(
      _value.copyWith(
            menuId: null == menuId
                ? _value.menuId
                : menuId // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<MenuItem>,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastModified: freezed == lastModified
                ? _value.lastModified
                : lastModified // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenuImplCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$$MenuImplCopyWith(
    _$MenuImpl value,
    $Res Function(_$MenuImpl) then,
  ) = __$$MenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String menuId,
    String title,
    DateTime date,
    List<MenuItem> items,
    bool isActive,
    String? description,
    DateTime? lastModified,
  });
}

/// @nodoc
class __$$MenuImplCopyWithImpl<$Res>
    extends _$MenuCopyWithImpl<$Res, _$MenuImpl>
    implements _$$MenuImplCopyWith<$Res> {
  __$$MenuImplCopyWithImpl(_$MenuImpl _value, $Res Function(_$MenuImpl) _then)
    : super(_value, _then);

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? title = null,
    Object? date = null,
    Object? items = null,
    Object? isActive = null,
    Object? description = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(
      _$MenuImpl(
        menuId: null == menuId
            ? _value.menuId
            : menuId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<MenuItem>,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastModified: freezed == lastModified
            ? _value.lastModified
            : lastModified // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuImpl implements _Menu {
  const _$MenuImpl({
    required this.menuId,
    required this.title,
    required this.date,
    required final List<MenuItem> items,
    required this.isActive,
    this.description,
    this.lastModified,
  }) : _items = items;

  factory _$MenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuImplFromJson(json);

  @override
  final String menuId;
  @override
  final String title;
  @override
  final DateTime date;
  final List<MenuItem> _items;
  @override
  List<MenuItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool isActive;
  @override
  final String? description;
  @override
  final DateTime? lastModified;

  @override
  String toString() {
    return 'Menu(menuId: $menuId, title: $title, date: $date, items: $items, isActive: $isActive, description: $description, lastModified: $lastModified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuImpl &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    menuId,
    title,
    date,
    const DeepCollectionEquality().hash(_items),
    isActive,
    description,
    lastModified,
  );

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      __$$MenuImplCopyWithImpl<_$MenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuImplToJson(this);
  }
}

abstract class _Menu implements Menu {
  const factory _Menu({
    required final String menuId,
    required final String title,
    required final DateTime date,
    required final List<MenuItem> items,
    required final bool isActive,
    final String? description,
    final DateTime? lastModified,
  }) = _$MenuImpl;

  factory _Menu.fromJson(Map<String, dynamic> json) = _$MenuImpl.fromJson;

  @override
  String get menuId;
  @override
  String get title;
  @override
  DateTime get date;
  @override
  List<MenuItem> get items;
  @override
  bool get isActive;
  @override
  String? get description;
  @override
  DateTime? get lastModified;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
