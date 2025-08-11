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
  String get itemId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get stockQty => throw _privateConstructorUsedError;
  bool get isSpecial => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isDisabled => throw _privateConstructorUsedError;
  DateTime? get availableFrom => throw _privateConstructorUsedError;
  DateTime? get availableTo => throw _privateConstructorUsedError;

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
    String itemId,
    String name,
    String description,
    double price,
    int stockQty,
    bool isSpecial,
    String? imageUrl,
    bool isDisabled,
    DateTime? availableFrom,
    DateTime? availableTo,
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
    Object? itemId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? stockQty = null,
    Object? isSpecial = null,
    Object? imageUrl = freezed,
    Object? isDisabled = null,
    Object? availableFrom = freezed,
    Object? availableTo = freezed,
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
            isSpecial: null == isSpecial
                ? _value.isSpecial
                : isSpecial // ignore: cast_nullable_to_non_nullable
                      as bool,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isDisabled: null == isDisabled
                ? _value.isDisabled
                : isDisabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            availableFrom: freezed == availableFrom
                ? _value.availableFrom
                : availableFrom // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            availableTo: freezed == availableTo
                ? _value.availableTo
                : availableTo // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
    String itemId,
    String name,
    String description,
    double price,
    int stockQty,
    bool isSpecial,
    String? imageUrl,
    bool isDisabled,
    DateTime? availableFrom,
    DateTime? availableTo,
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
    Object? itemId = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? stockQty = null,
    Object? isSpecial = null,
    Object? imageUrl = freezed,
    Object? isDisabled = null,
    Object? availableFrom = freezed,
    Object? availableTo = freezed,
  }) {
    return _then(
      _$MenuItemImpl(
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
        isSpecial: null == isSpecial
            ? _value.isSpecial
            : isSpecial // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isDisabled: null == isDisabled
            ? _value.isDisabled
            : isDisabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        availableFrom: freezed == availableFrom
            ? _value.availableFrom
            : availableFrom // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        availableTo: freezed == availableTo
            ? _value.availableTo
            : availableTo // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemImpl implements _MenuItem {
  const _$MenuItemImpl({
    required this.itemId,
    required this.name,
    required this.description,
    required this.price,
    required this.stockQty,
    required this.isSpecial,
    this.imageUrl,
    this.isDisabled = false,
    this.availableFrom,
    this.availableTo,
  });

  factory _$MenuItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemImplFromJson(json);

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
  final bool isSpecial;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final bool isDisabled;
  @override
  final DateTime? availableFrom;
  @override
  final DateTime? availableTo;

  @override
  String toString() {
    return 'MenuItem(itemId: $itemId, name: $name, description: $description, price: $price, stockQty: $stockQty, isSpecial: $isSpecial, imageUrl: $imageUrl, isDisabled: $isDisabled, availableFrom: $availableFrom, availableTo: $availableTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
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
            (identical(other.isDisabled, isDisabled) ||
                other.isDisabled == isDisabled) &&
            (identical(other.availableFrom, availableFrom) ||
                other.availableFrom == availableFrom) &&
            (identical(other.availableTo, availableTo) ||
                other.availableTo == availableTo));
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
    isSpecial,
    imageUrl,
    isDisabled,
    availableFrom,
    availableTo,
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
    required final String itemId,
    required final String name,
    required final String description,
    required final double price,
    required final int stockQty,
    required final bool isSpecial,
    final String? imageUrl,
    final bool isDisabled,
    final DateTime? availableFrom,
    final DateTime? availableTo,
  }) = _$MenuItemImpl;

  factory _MenuItem.fromJson(Map<String, dynamic> json) =
      _$MenuItemImpl.fromJson;

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
  bool get isSpecial;
  @override
  String? get imageUrl;
  @override
  bool get isDisabled;
  @override
  DateTime? get availableFrom;
  @override
  DateTime? get availableTo;

  /// Create a copy of MenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemImplCopyWith<_$MenuItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
