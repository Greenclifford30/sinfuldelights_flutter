// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_menu_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AdminMenuDetail _$AdminMenuDetailFromJson(Map<String, dynamic> json) {
  return _AdminMenuDetail.fromJson(json);
}

/// @nodoc
mixin _$AdminMenuDetail {
  String get menuId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<AdminMenuItem> get items => throw _privateConstructorUsedError;

  /// Serializes this AdminMenuDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminMenuDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminMenuDetailCopyWith<AdminMenuDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminMenuDetailCopyWith<$Res> {
  factory $AdminMenuDetailCopyWith(
    AdminMenuDetail value,
    $Res Function(AdminMenuDetail) then,
  ) = _$AdminMenuDetailCopyWithImpl<$Res, AdminMenuDetail>;
  @useResult
  $Res call({
    String menuId,
    String date,
    String title,
    List<AdminMenuItem> items,
  });
}

/// @nodoc
class _$AdminMenuDetailCopyWithImpl<$Res, $Val extends AdminMenuDetail>
    implements $AdminMenuDetailCopyWith<$Res> {
  _$AdminMenuDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminMenuDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? date = null,
    Object? title = null,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            menuId: null == menuId
                ? _value.menuId
                : menuId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<AdminMenuItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AdminMenuDetailImplCopyWith<$Res>
    implements $AdminMenuDetailCopyWith<$Res> {
  factory _$$AdminMenuDetailImplCopyWith(
    _$AdminMenuDetailImpl value,
    $Res Function(_$AdminMenuDetailImpl) then,
  ) = __$$AdminMenuDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String menuId,
    String date,
    String title,
    List<AdminMenuItem> items,
  });
}

/// @nodoc
class __$$AdminMenuDetailImplCopyWithImpl<$Res>
    extends _$AdminMenuDetailCopyWithImpl<$Res, _$AdminMenuDetailImpl>
    implements _$$AdminMenuDetailImplCopyWith<$Res> {
  __$$AdminMenuDetailImplCopyWithImpl(
    _$AdminMenuDetailImpl _value,
    $Res Function(_$AdminMenuDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AdminMenuDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? date = null,
    Object? title = null,
    Object? items = null,
  }) {
    return _then(
      _$AdminMenuDetailImpl(
        menuId: null == menuId
            ? _value.menuId
            : menuId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<AdminMenuItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminMenuDetailImpl implements _AdminMenuDetail {
  const _$AdminMenuDetailImpl({
    required this.menuId,
    required this.date,
    required this.title,
    required final List<AdminMenuItem> items,
  }) : _items = items;

  factory _$AdminMenuDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminMenuDetailImplFromJson(json);

  @override
  final String menuId;
  @override
  final String date;
  @override
  final String title;
  final List<AdminMenuItem> _items;
  @override
  List<AdminMenuItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'AdminMenuDetail(menuId: $menuId, date: $date, title: $title, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminMenuDetailImpl &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    menuId,
    date,
    title,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of AdminMenuDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminMenuDetailImplCopyWith<_$AdminMenuDetailImpl> get copyWith =>
      __$$AdminMenuDetailImplCopyWithImpl<_$AdminMenuDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminMenuDetailImplToJson(this);
  }
}

abstract class _AdminMenuDetail implements AdminMenuDetail {
  const factory _AdminMenuDetail({
    required final String menuId,
    required final String date,
    required final String title,
    required final List<AdminMenuItem> items,
  }) = _$AdminMenuDetailImpl;

  factory _AdminMenuDetail.fromJson(Map<String, dynamic> json) =
      _$AdminMenuDetailImpl.fromJson;

  @override
  String get menuId;
  @override
  String get date;
  @override
  String get title;
  @override
  List<AdminMenuItem> get items;

  /// Create a copy of AdminMenuDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminMenuDetailImplCopyWith<_$AdminMenuDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdminMenuItem _$AdminMenuItemFromJson(Map<String, dynamic> json) {
  return _AdminMenuItem.fromJson(json);
}

/// @nodoc
mixin _$AdminMenuItem {
  String get itemId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get stockQty => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  bool get isSpecial => throw _privateConstructorUsedError;

  /// Serializes this AdminMenuItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminMenuItemCopyWith<AdminMenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminMenuItemCopyWith<$Res> {
  factory $AdminMenuItemCopyWith(
    AdminMenuItem value,
    $Res Function(AdminMenuItem) then,
  ) = _$AdminMenuItemCopyWithImpl<$Res, AdminMenuItem>;
  @useResult
  $Res call({
    String itemId,
    String name,
    String description,
    double price,
    int stockQty,
    String imageUrl,
    bool isSpecial,
  });
}

/// @nodoc
class _$AdminMenuItemCopyWithImpl<$Res, $Val extends AdminMenuItem>
    implements $AdminMenuItemCopyWith<$Res> {
  _$AdminMenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? stockQty = null,
    Object? imageUrl = null,
    Object? isSpecial = null,
  }) {
    return _then(
      _value.copyWith(
            itemId: null == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
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
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            isSpecial: null == isSpecial
                ? _value.isSpecial
                : isSpecial // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AdminMenuItemImplCopyWith<$Res>
    implements $AdminMenuItemCopyWith<$Res> {
  factory _$$AdminMenuItemImplCopyWith(
    _$AdminMenuItemImpl value,
    $Res Function(_$AdminMenuItemImpl) then,
  ) = __$$AdminMenuItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String itemId,
    String name,
    String description,
    double price,
    int stockQty,
    String imageUrl,
    bool isSpecial,
  });
}

/// @nodoc
class __$$AdminMenuItemImplCopyWithImpl<$Res>
    extends _$AdminMenuItemCopyWithImpl<$Res, _$AdminMenuItemImpl>
    implements _$$AdminMenuItemImplCopyWith<$Res> {
  __$$AdminMenuItemImplCopyWithImpl(
    _$AdminMenuItemImpl _value,
    $Res Function(_$AdminMenuItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AdminMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? stockQty = null,
    Object? imageUrl = null,
    Object? isSpecial = null,
  }) {
    return _then(
      _$AdminMenuItemImpl(
        itemId: null == itemId
            ? _value.itemId
            : itemId // ignore: cast_nullable_to_non_nullable
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
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        isSpecial: null == isSpecial
            ? _value.isSpecial
            : isSpecial // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminMenuItemImpl implements _AdminMenuItem {
  const _$AdminMenuItemImpl({
    required this.itemId,
    required this.name,
    required this.description,
    required this.price,
    required this.stockQty,
    required this.imageUrl,
    required this.isSpecial,
  });

  factory _$AdminMenuItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminMenuItemImplFromJson(json);

  @override
  final String itemId;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final int stockQty;
  @override
  final String imageUrl;
  @override
  final bool isSpecial;

  @override
  String toString() {
    return 'AdminMenuItem(itemId: $itemId, name: $name, description: $description, price: $price, stockQty: $stockQty, imageUrl: $imageUrl, isSpecial: $isSpecial)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminMenuItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stockQty, stockQty) ||
                other.stockQty == stockQty) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isSpecial, isSpecial) ||
                other.isSpecial == isSpecial));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    itemId,
    name,
    description,
    price,
    stockQty,
    imageUrl,
    isSpecial,
  );

  /// Create a copy of AdminMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminMenuItemImplCopyWith<_$AdminMenuItemImpl> get copyWith =>
      __$$AdminMenuItemImplCopyWithImpl<_$AdminMenuItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminMenuItemImplToJson(this);
  }
}

abstract class _AdminMenuItem implements AdminMenuItem {
  const factory _AdminMenuItem({
    required final String itemId,
    required final String name,
    required final String description,
    required final double price,
    required final int stockQty,
    required final String imageUrl,
    required final bool isSpecial,
  }) = _$AdminMenuItemImpl;

  factory _AdminMenuItem.fromJson(Map<String, dynamic> json) =
      _$AdminMenuItemImpl.fromJson;

  @override
  String get itemId;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  int get stockQty;
  @override
  String get imageUrl;
  @override
  bool get isSpecial;

  /// Create a copy of AdminMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminMenuItemImplCopyWith<_$AdminMenuItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
