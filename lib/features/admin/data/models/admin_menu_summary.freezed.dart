// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_menu_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AdminMenuSummary _$AdminMenuSummaryFromJson(Map<String, dynamic> json) {
  return _AdminMenuSummary.fromJson(json);
}

/// @nodoc
mixin _$AdminMenuSummary {
  String get menuId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this AdminMenuSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminMenuSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminMenuSummaryCopyWith<AdminMenuSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminMenuSummaryCopyWith<$Res> {
  factory $AdminMenuSummaryCopyWith(
    AdminMenuSummary value,
    $Res Function(AdminMenuSummary) then,
  ) = _$AdminMenuSummaryCopyWithImpl<$Res, AdminMenuSummary>;
  @useResult
  $Res call({String menuId, String date, String title});
}

/// @nodoc
class _$AdminMenuSummaryCopyWithImpl<$Res, $Val extends AdminMenuSummary>
    implements $AdminMenuSummaryCopyWith<$Res> {
  _$AdminMenuSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminMenuSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? date = null,
    Object? title = null,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AdminMenuSummaryImplCopyWith<$Res>
    implements $AdminMenuSummaryCopyWith<$Res> {
  factory _$$AdminMenuSummaryImplCopyWith(
    _$AdminMenuSummaryImpl value,
    $Res Function(_$AdminMenuSummaryImpl) then,
  ) = __$$AdminMenuSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String menuId, String date, String title});
}

/// @nodoc
class __$$AdminMenuSummaryImplCopyWithImpl<$Res>
    extends _$AdminMenuSummaryCopyWithImpl<$Res, _$AdminMenuSummaryImpl>
    implements _$$AdminMenuSummaryImplCopyWith<$Res> {
  __$$AdminMenuSummaryImplCopyWithImpl(
    _$AdminMenuSummaryImpl _value,
    $Res Function(_$AdminMenuSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AdminMenuSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuId = null,
    Object? date = null,
    Object? title = null,
  }) {
    return _then(
      _$AdminMenuSummaryImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminMenuSummaryImpl implements _AdminMenuSummary {
  const _$AdminMenuSummaryImpl({
    required this.menuId,
    required this.date,
    required this.title,
  });

  factory _$AdminMenuSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminMenuSummaryImplFromJson(json);

  @override
  final String menuId;
  @override
  final String date;
  @override
  final String title;

  @override
  String toString() {
    return 'AdminMenuSummary(menuId: $menuId, date: $date, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminMenuSummaryImpl &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, menuId, date, title);

  /// Create a copy of AdminMenuSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminMenuSummaryImplCopyWith<_$AdminMenuSummaryImpl> get copyWith =>
      __$$AdminMenuSummaryImplCopyWithImpl<_$AdminMenuSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminMenuSummaryImplToJson(this);
  }
}

abstract class _AdminMenuSummary implements AdminMenuSummary {
  const factory _AdminMenuSummary({
    required final String menuId,
    required final String date,
    required final String title,
  }) = _$AdminMenuSummaryImpl;

  factory _AdminMenuSummary.fromJson(Map<String, dynamic> json) =
      _$AdminMenuSummaryImpl.fromJson;

  @override
  String get menuId;
  @override
  String get date;
  @override
  String get title;

  /// Create a copy of AdminMenuSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminMenuSummaryImplCopyWith<_$AdminMenuSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
