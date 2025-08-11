import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/menu_repository.dart';
import '../../data/models/menu.dart';
import '../../data/models/menu_item.dart';
import '../../data/models/predefined_menu.dart';

part 'menu_controller.g.dart';

@riverpod
class MenuController extends _$MenuController {
  @override
  FutureOr<Menu?> build(String menuId) async {
    if (menuId.isEmpty) return null;
    return _fetchMenu(menuId);
  }

  Future<Menu> _fetchMenu(String menuId) async {
    final repository = ref.read(menuRepositoryProvider);
    return repository.getMenu(menuId);
  }

  Future<void> updateMenu(Menu menu) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(menuRepositoryProvider);
      return repository.updateMenu(menu);
    });
  }

  Future<void> deleteMenu() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(menuRepositoryProvider);
      await repository.deleteMenu(menuId);
      return null;
    });
  }

  Future<void> addMenuItem(MenuItem item) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(menuRepositoryProvider);
      await repository.addMenuItem(menuId, item);
      return _fetchMenu(menuId);
    });
  }

  Future<void> updateMenuItem(MenuItem item) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(menuRepositoryProvider);
      await repository.updateMenuItem(menuId, item);
      return _fetchMenu(menuId);
    });
  }

  Future<void> deleteMenuItem(String itemId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(menuRepositoryProvider);
      await repository.deleteMenuItem(menuId, itemId);
      return _fetchMenu(menuId);
    });
  }

  Future<void> updateStock(String itemId, int quantity) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(menuRepositoryProvider);
      await repository.updateStock(menuId, itemId, quantity);
      return _fetchMenu(menuId);
    });
  }
}

@riverpod
class MenuListController extends _$MenuListController {
  @override
  FutureOr<List<Menu>> build() async {
    return _fetchMenus();
  }

  Future<List<Menu>> _fetchMenus({DateTime? fromDate, DateTime? toDate}) async {
    final repository = ref.read(menuRepositoryProvider);
    return repository.getAllMenus(fromDate: fromDate, toDate: toDate);
  }

  Future<void> createMenu(Menu menu) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(menuRepositoryProvider);
      await repository.createMenu(menu);
      return _fetchMenus();
    });
  }

  Future<void> refreshMenus({DateTime? fromDate, DateTime? toDate}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return _fetchMenus(fromDate: fromDate, toDate: toDate);
    });
  }
}

@riverpod
class MenuTemplateController extends _$MenuTemplateController {
  @override
  FutureOr<List<PredefinedMenu>> build() async {
    return _fetchTemplates();
  }

  Future<List<PredefinedMenu>> _fetchTemplates() async {
    final repository = ref.read(menuRepositoryProvider);
    return repository.getTemplates();
  }

  Future<void> createTemplate(PredefinedMenu template) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(menuRepositoryProvider);
      await repository.createTemplate(template);
      return _fetchTemplates();
    });
  }

  Future<void> applyTemplate(String templateId, DateTime date) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(menuRepositoryProvider);
      await repository.applyTemplate(templateId, date);
      return _fetchTemplates();
    });
  }

  Future<void> refreshTemplates() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return _fetchTemplates();
    });
  }
}

@riverpod
Future<String> imageUploadUrl(Ref ref) async {
  final repository = ref.read(menuRepositoryProvider);
  return repository.getImageUploadUrl();
}

@riverpod
Future<void> uploadImage(
  Ref ref,
  String url,
  List<int> imageBytes,
) async {
  final repository = ref.read(menuRepositoryProvider);
  return repository.uploadImage(url, imageBytes);
}