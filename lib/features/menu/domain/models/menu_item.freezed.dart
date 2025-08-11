// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return _MenuItem.fromJson(json);
}

/// @nodoc
mixin _$MenuItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get stockQty => throw _privateConstructorUsedError;
  bool get isSpecial => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get dietaryTags => throw _privateConstructorUsedError;

  /// Serializes this MenuItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemCopyWith<MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemCopyWith<$Res> {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) then) =
      _$MenuItemCopyWithImpl<$Res, MenuItem>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    double price,
    int stockQty,
    bool isSpecial,
    String imageUrl,
    List<String> dietaryTags,
  });
}

/// @nodoc
class _$MenuItemCopyWithImpl<$Res, $Val extends MenuItem>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? stockQty = null,
    Object? isSpecial = null,
    Object? imageUrl = null,
    Object? dietaryTags = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            stockQty: null == stockQty
                ? _value.stockQty
                : stockQty // ignore: cast_nullable_to_non_nullable
                      as int,
            isSpecial: null == isSpecial
                ? _value.isSpecial
                : isSpecial // ignore: cast_nullable_to_non_nullable
                      as bool,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            dietaryTags: null == dietaryTags
                ? _value.dietaryTags
                : dietaryTags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenuItemImplCopyWith<$Res>
    implements $MenuItemCopyWith<$Res> {
  factory _$$MenuItemImplCopyWith(
    _$MenuItemImpl value,
    $Res Function(_$MenuItemImpl) then,
  ) = __$$MenuItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    double price,
    int stockQty,
    bool isSpecial,
    String imageUrl,
    List<String> dietaryTags,
  });
}

/// @nodoc
class __$$MenuItemImplCopyWithImpl<$Res>
    extends _$MenuItemCopyWithImpl<$Res, _$MenuItemImpl>
    implements _$$MenuItemImplCopyWith<$Res> {
  __$$MenuItemImplCopyWithImpl(
    _$MenuItemImpl _value,
    $Res Function(_$MenuItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? stockQty = null,
    Object? isSpecial = null,
    Object? imageUrl = null,
    Object? dietaryTags = null,
  }) {
    return _then(
      _$MenuItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        stockQty: null == stockQty
            ? _value.stockQty
            : stockQty // ignore: cast_nullable_to_non_nullable
                  as int,
        isSpecial: null == isSpecial
            ? _value.isSpecial
            : isSpecial // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        dietaryTags: null == dietaryTags
            ? _value._dietaryTags
            : dietaryTags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemImpl implements _MenuItem {
  const _$MenuItemImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stockQty,
    this.isSpecial = false,
    this.imageUrl = '',
    final List<String> dietaryTags = const [],
  }) : _dietaryTags = dietaryTags;

  factory _$MenuItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final int stockQty;
  @override
  @JsonKey()
  final bool isSpecial;
  @override
  @JsonKey()
  final String imageUrl;
  final List<String> _dietaryTags;
  @override
  @JsonKey()
  List<String> get dietaryTags {
    if (_dietaryTags is EqualUnmodifiableListView) return _dietaryTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryTags);
  }

  @override
  String toString() {
    return 'MenuItem(id: $id, name: $name, description: $description, price: $price, stockQty: $stockQty, isSpecial: $isSpecial, imageUrl: $imageUrl, dietaryTags: $dietaryTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stockQty, stockQty) ||
                other.stockQty == stockQty) &&
            (identical(other.isSpecial, isSpecial) ||
                other.isSpecial == isSpecial) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(
              other._dietaryTags,
              _dietaryTags,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    price,
    stockQty,
    isSpecial,
    imageUrl,
    const DeepCollectionEquality().hash(_dietaryTags),
  );

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      __$$MenuItemImplCopyWithImpl<_$MenuItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemImplToJson(this);
  }
}

abstract class _MenuItem implements MenuItem {
  const factory _MenuItem({
    required final String id,
    required final String name,
    required final String description,
    required final double price,
    required final int stockQty,
    final bool isSpecial,
    final String imageUrl,
    final List<String> dietaryTags,
  }) = _$MenuItemImpl;

  factory _MenuItem.fromJson(Map<String, dynamic> json) =
      _$MenuItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  int get stockQty;
  @override
  bool get isSpecial;
  @override
  String get imageUrl;
  @override
  List<String> get dietaryTags;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyMenu _$DailyMenuFromJson(Map<String, dynamic> json) {
  return _DailyMenu.fromJson(json);
}

/// @nodoc
mixin _$DailyMenu {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<MenuItem> get items => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this DailyMenu to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyMenu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyMenuCopyWith<DailyMenu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyMenuCopyWith<$Res> {
  factory $DailyMenuCopyWith(DailyMenu value, $Res Function(DailyMenu) then) =
      _$DailyMenuCopyWithImpl<$Res, DailyMenu>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    String title,
    List<MenuItem> items,
    bool isActive,
  });
}

/// @nodoc
class _$DailyMenuCopyWithImpl<$Res, $Val extends DailyMenu>
    implements $DailyMenuCopyWith<$Res> {
  _$DailyMenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyMenu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? title = null,
    Object? items = null,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<MenuItem>,
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
abstract class _$$DailyMenuImplCopyWith<$Res>
    implements $DailyMenuCopyWith<$Res> {
  factory _$$DailyMenuImplCopyWith(
    _$DailyMenuImpl value,
    $Res Function(_$DailyMenuImpl) then,
  ) = __$$DailyMenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    String title,
    List<MenuItem> items,
    bool isActive,
  });
}

/// @nodoc
class __$$DailyMenuImplCopyWithImpl<$Res>
    extends _$DailyMenuCopyWithImpl<$Res, _$DailyMenuImpl>
    implements _$$DailyMenuImplCopyWith<$Res> {
  __$$DailyMenuImplCopyWithImpl(
    _$DailyMenuImpl _value,
    $Res Function(_$DailyMenuImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyMenu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? title = null,
    Object? items = null,
    Object? isActive = null,
  }) {
    return _then(
      _$DailyMenuImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<MenuItem>,
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
class _$DailyMenuImpl implements _DailyMenu {
  const _$DailyMenuImpl({
    required this.id,
    required this.date,
    required this.title,
    required final List<MenuItem> items,
    this.isActive = true,
  }) : _items = items;

  factory _$DailyMenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyMenuImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String title;
  final List<MenuItem> _items;
  @override
  List<MenuItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'DailyMenu(id: $id, date: $date, title: $title, items: $items, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyMenuImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    title,
    const DeepCollectionEquality().hash(_items),
    isActive,
  );

  /// Create a copy of DailyMenu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyMenuImplCopyWith<_$DailyMenuImpl> get copyWith =>
      __$$DailyMenuImplCopyWithImpl<_$DailyMenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyMenuImplToJson(this);
  }
}

abstract class _DailyMenu implements DailyMenu {
  const factory _DailyMenu({
    required final String id,
    required final DateTime date,
    required final String title,
    required final List<MenuItem> items,
    final bool isActive,
  }) = _$DailyMenuImpl;

  factory _DailyMenu.fromJson(Map<String, dynamic> json) =
      _$DailyMenuImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get title;
  @override
  List<MenuItem> get items;
  @override
  bool get isActive;

  /// Create a copy of DailyMenu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyMenuImplCopyWith<_$DailyMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
