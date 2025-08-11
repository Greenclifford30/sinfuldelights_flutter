// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageUploadUrlHash() => r'df2b46e3543b3529269f76f9e0839d67257d6ba0';

/// See also [imageUploadUrl].
@ProviderFor(imageUploadUrl)
final imageUploadUrlProvider = AutoDisposeFutureProvider<String>.internal(
  imageUploadUrl,
  name: r'imageUploadUrlProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imageUploadUrlHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ImageUploadUrlRef = AutoDisposeFutureProviderRef<String>;
String _$uploadImageHash() => r'e3e8531d0b653927af75aace3b3a3a388846ea9e';

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

/// See also [uploadImage].
@ProviderFor(uploadImage)
const uploadImageProvider = UploadImageFamily();

/// See also [uploadImage].
class UploadImageFamily extends Family<AsyncValue<void>> {
  /// See also [uploadImage].
  const UploadImageFamily();

  /// See also [uploadImage].
  UploadImageProvider call(String url, List<int> imageBytes) {
    return UploadImageProvider(url, imageBytes);
  }

  @override
  UploadImageProvider getProviderOverride(
    covariant UploadImageProvider provider,
  ) {
    return call(provider.url, provider.imageBytes);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'uploadImageProvider';
}

/// See also [uploadImage].
class UploadImageProvider extends AutoDisposeFutureProvider<void> {
  /// See also [uploadImage].
  UploadImageProvider(String url, List<int> imageBytes)
    : this._internal(
        (ref) => uploadImage(ref as UploadImageRef, url, imageBytes),
        from: uploadImageProvider,
        name: r'uploadImageProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$uploadImageHash,
        dependencies: UploadImageFamily._dependencies,
        allTransitiveDependencies: UploadImageFamily._allTransitiveDependencies,
        url: url,
        imageBytes: imageBytes,
      );

  UploadImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
    required this.imageBytes,
  }) : super.internal();

  final String url;
  final List<int> imageBytes;

  @override
  Override overrideWith(
    FutureOr<void> Function(UploadImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadImageProvider._internal(
        (ref) => create(ref as UploadImageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
        imageBytes: imageBytes,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UploadImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadImageProvider &&
        other.url == url &&
        other.imageBytes == imageBytes;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);
    hash = _SystemHash.combine(hash, imageBytes.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UploadImageRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `url` of this provider.
  String get url;

  /// The parameter `imageBytes` of this provider.
  List<int> get imageBytes;
}

class _UploadImageProviderElement extends AutoDisposeFutureProviderElement<void>
    with UploadImageRef {
  _UploadImageProviderElement(super.provider);

  @override
  String get url => (origin as UploadImageProvider).url;
  @override
  List<int> get imageBytes => (origin as UploadImageProvider).imageBytes;
}

String _$menuControllerHash() => r'5184db13b622130456bb465d78a5357798c6ec9b';

abstract class _$MenuController
    extends BuildlessAutoDisposeAsyncNotifier<Menu?> {
  late final String menuId;

  FutureOr<Menu?> build(String menuId);
}

/// See also [MenuController].
@ProviderFor(MenuController)
const menuControllerProvider = MenuControllerFamily();

/// See also [MenuController].
class MenuControllerFamily extends Family<AsyncValue<Menu?>> {
  /// See also [MenuController].
  const MenuControllerFamily();

  /// See also [MenuController].
  MenuControllerProvider call(String menuId) {
    return MenuControllerProvider(menuId);
  }

  @override
  MenuControllerProvider getProviderOverride(
    covariant MenuControllerProvider provider,
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
  String? get name => r'menuControllerProvider';
}

/// See also [MenuController].
class MenuControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MenuController, Menu?> {
  /// See also [MenuController].
  MenuControllerProvider(String menuId)
    : this._internal(
        () => MenuController()..menuId = menuId,
        from: menuControllerProvider,
        name: r'menuControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$menuControllerHash,
        dependencies: MenuControllerFamily._dependencies,
        allTransitiveDependencies:
            MenuControllerFamily._allTransitiveDependencies,
        menuId: menuId,
      );

  MenuControllerProvider._internal(
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
  FutureOr<Menu?> runNotifierBuild(covariant MenuController notifier) {
    return notifier.build(menuId);
  }

  @override
  Override overrideWith(MenuController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MenuControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<MenuController, Menu?>
  createElement() {
    return _MenuControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MenuControllerProvider && other.menuId == menuId;
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
mixin MenuControllerRef on AutoDisposeAsyncNotifierProviderRef<Menu?> {
  /// The parameter `menuId` of this provider.
  String get menuId;
}

class _MenuControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MenuController, Menu?>
    with MenuControllerRef {
  _MenuControllerProviderElement(super.provider);

  @override
  String get menuId => (origin as MenuControllerProvider).menuId;
}

String _$menuListControllerHash() =>
    r'e93890f8475a088e4b62f8fc01590e0ce6b98fe6';

/// See also [MenuListController].
@ProviderFor(MenuListController)
final menuListControllerProvider =
    AutoDisposeAsyncNotifierProvider<MenuListController, List<Menu>>.internal(
      MenuListController.new,
      name: r'menuListControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$menuListControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MenuListController = AutoDisposeAsyncNotifier<List<Menu>>;
String _$menuTemplateControllerHash() =>
    r'90ecf4288d7efc7744d4436cb6d70260322bca0b';

/// See also [MenuTemplateController].
@ProviderFor(MenuTemplateController)
final menuTemplateControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      MenuTemplateController,
      List<PredefinedMenu>
    >.internal(
      MenuTemplateController.new,
      name: r'menuTemplateControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$menuTemplateControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MenuTemplateController =
    AutoDisposeAsyncNotifier<List<PredefinedMenu>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
