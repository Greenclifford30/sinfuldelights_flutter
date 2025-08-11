// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_menu_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adminMenuControllerHash() =>
    r'966eee084bbf076eb24bd751329cfe576c0efbae';

/// See also [AdminMenuController].
@ProviderFor(AdminMenuController)
final adminMenuControllerProvider =
    AutoDisposeNotifierProvider<
      AdminMenuController,
      AsyncValue<List<AdminMenuSummary>>
    >.internal(
      AdminMenuController.new,
      name: r'adminMenuControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adminMenuControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AdminMenuController =
    AutoDisposeNotifier<AsyncValue<List<AdminMenuSummary>>>;
String _$adminMenuDetailControllerHash() =>
    r'a190cc8cd5aa41eee74a1657660abbaad8082f31';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AdminMenuDetailController
    extends BuildlessAutoDisposeNotifier<AsyncValue<AdminMenuDetail?>> {
  late final String menuId;

  AsyncValue<AdminMenuDetail?> build(String menuId);
}

/// See also [AdminMenuDetailController].
@ProviderFor(AdminMenuDetailController)
const adminMenuDetailControllerProvider = AdminMenuDetailControllerFamily();

/// See also [AdminMenuDetailController].
class AdminMenuDetailControllerFamily
    extends Family<AsyncValue<AdminMenuDetail?>> {
  /// See also [AdminMenuDetailController].
  const AdminMenuDetailControllerFamily();

  /// See also [AdminMenuDetailController].
  AdminMenuDetailControllerProvider call(String menuId) {
    return AdminMenuDetailControllerProvider(menuId);
  }

  @override
  AdminMenuDetailControllerProvider getProviderOverride(
    covariant AdminMenuDetailControllerProvider provider,
  ) {
    return call(provider.menuId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'adminMenuDetailControllerProvider';
}

/// See also [AdminMenuDetailController].
class AdminMenuDetailControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          AdminMenuDetailController,
          AsyncValue<AdminMenuDetail?>
        > {
  /// See also [AdminMenuDetailController].
  AdminMenuDetailControllerProvider(String menuId)
    : this._internal(
        () => AdminMenuDetailController()..menuId = menuId,
        from: adminMenuDetailControllerProvider,
        name: r'adminMenuDetailControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$adminMenuDetailControllerHash,
        dependencies: AdminMenuDetailControllerFamily._dependencies,
        allTransitiveDependencies:
            AdminMenuDetailControllerFamily._allTransitiveDependencies,
        menuId: menuId,
      );

  AdminMenuDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.menuId,
  }) : super.internal();

  final String menuId;

  @override
  AsyncValue<AdminMenuDetail?> runNotifierBuild(
    covariant AdminMenuDetailController notifier,
  ) {
    return notifier.build(menuId);
  }

  @override
  Override overrideWith(AdminMenuDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AdminMenuDetailControllerProvider._internal(
        () => create()..menuId = menuId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        menuId: menuId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    AdminMenuDetailController,
    AsyncValue<AdminMenuDetail?>
  >
  createElement() {
    return _AdminMenuDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminMenuDetailControllerProvider && other.menuId == menuId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, menuId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AdminMenuDetailControllerRef
    on AutoDisposeNotifierProviderRef<AsyncValue<AdminMenuDetail?>> {
  /// The parameter `menuId` of this provider.
  String get menuId;
}

class _AdminMenuDetailControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          AdminMenuDetailController,
          AsyncValue<AdminMenuDetail?>
        >
    with AdminMenuDetailControllerRef {
  _AdminMenuDetailControllerProviderElement(super.provider);

  @override
  String get menuId => (origin as AdminMenuDetailControllerProvider).menuId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
