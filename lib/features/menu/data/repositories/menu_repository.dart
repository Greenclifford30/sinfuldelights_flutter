import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../menu_api.dart';
import '../models/menu.dart';
import '../models/menu_item.dart';
import '../models/predefined_menu.dart';
import 'menu_repository_interface.dart';

part 'menu_repository.g.dart';

class MenuRepository implements MenuRepositoryInterface {
  final MenuApi _api;
  final Box<dynamic> _menuCache;
  static const _cacheValidityDuration = Duration(minutes: 15);

  MenuRepository(this._api, this._menuCache);

  @override
  Future<Menu> createMenu(Menu menu) async {
    final createdMenu = await _api.createMenu(menu);
    _cacheMenu(createdMenu);
    return createdMenu;
  }

  @override
  Future<Menu> updateMenu(Menu menu) async {
    final updatedMenu = await _api.updateMenu(menu);
    _cacheMenu(updatedMenu);
    return updatedMenu;
  }

  @override
  Future<void> deleteMenu(String menuId) async {
    await _api.deleteMenu(menuId);
    _menuCache.delete(menuId);
  }

  @override
  Future<Menu> getMenu(String menuId) async {
    try {
      // Check cache first
      final cachedMenuData = _menuCache.get(menuId);
      final cachedMenuJson = cachedMenuData != null ? Map<String, dynamic>.from(cachedMenuData as Map) : null;
      final cacheTimestamp = _menuCache.get('${menuId}_timestamp') as int?;
      final cacheTime = cacheTimestamp != null
          ? DateTime.fromMillisecondsSinceEpoch(cacheTimestamp)
          : DateTime.fromMillisecondsSinceEpoch(0);

      if (cachedMenuJson != null &&
          DateTime.now().difference(cacheTime) < _cacheValidityDuration) {
        return Menu.fromJson(cachedMenuJson);
      }

      // Cache miss or expired, fetch from API
      final menu = await _api.getMenu(menuId);
      _cacheMenu(menu);
      return menu;
    } catch (e) {
      // On error, return cached version if available
      final cachedMenuData = _menuCache.get(menuId);
      final cachedMenuJson = cachedMenuData != null ? Map<String, dynamic>.from(cachedMenuData as Map) : null;
      if (cachedMenuJson != null) {
        return Menu.fromJson(cachedMenuJson);
      }
      rethrow;
    }
  }

  @override
  Future<List<Menu>> getAllMenus({DateTime? fromDate, DateTime? toDate}) async {
    try {
      final menus = await _api.getAllMenus(fromDate: fromDate, toDate: toDate);
      for (final menu in menus) {
        _cacheMenu(menu);
      }
      return menus;
    } catch (e) {
      // On error, return cached menus within date range if available
      if (fromDate != null && toDate != null) {
        return _menuCache.values
            .whereType<Map>()
            .map((value) => Map<String, dynamic>.from(value))
            .map((json) => Menu.fromJson(json))
            .where((menu) =>
                menu.date.isAfter(fromDate) && menu.date.isBefore(toDate))
            .toList();
      }
      rethrow;
    }
  }

  @override
  Future<MenuItem> addMenuItem(String menuId, MenuItem item) async {
    final addedItem = await _api.addMenuItem(menuId, item);
    final menu = await getMenu(menuId);
    final updatedMenu = menu.copyWith(
      items: [...menu.items, addedItem],
    );
    _cacheMenu(updatedMenu);
    return addedItem;
  }

  @override
  Future<MenuItem> updateMenuItem(String menuId, MenuItem item) async {
    final updatedItem = await _api.updateMenuItem(menuId, item);
    final menu = await getMenu(menuId);
    final updatedMenu = menu.copyWith(
      items: menu.items
          .map((i) => i.itemId == item.itemId ? updatedItem : i)
          .toList(),
    );
    _cacheMenu(updatedMenu);
    return updatedItem;
  }

  @override
  Future<void> deleteMenuItem(String menuId, String itemId) async {
    await _api.deleteMenuItem(menuId, itemId);
    final menu = await getMenu(menuId);
    final updatedMenu = menu.copyWith(
      items: menu.items.where((item) => item.itemId != itemId).toList(),
    );
    _cacheMenu(updatedMenu);
  }

  @override
  Future<void> updateStock(String menuId, String itemId, int quantity) async {
    await _api.updateStock(menuId, itemId, quantity);
    final menu = await getMenu(menuId);
    final updatedMenu = menu.copyWith(
      items: menu.items.map((item) {
        if (item.itemId == itemId) {
          return item.copyWith(stockQty: quantity);
        }
        return item;
      }).toList(),
    );
    _cacheMenu(updatedMenu);
  }

  @override
  Future<String> getImageUploadUrl() async {
    return _api.getImageUploadUrl();
  }

  @override
  Future<void> uploadImage(String url, List<int> imageBytes) async {
    await _api.uploadImage(url, imageBytes);
  }

  @override
  Future<PredefinedMenu> createTemplate(PredefinedMenu template) async {
    return _api.createTemplate(template);
  }

  @override
  Future<List<PredefinedMenu>> getTemplates() async {
    return _api.getTemplates();
  }

  @override
  Future<void> applyTemplate(String templateId, DateTime date) async {
    await _api.applyTemplate(templateId, date);
  }

  void _cacheMenu(Menu menu) {
    // Store as JSON Map to avoid Hive serialization issues with Freezed objects
    // Convert to JSON to ensure deep serialization of nested objects
    final jsonMap = menu.toJson();
    
    // Ensure nested MenuItem objects are also serialized as maps
    if (jsonMap['items'] is List) {
      jsonMap['items'] = (jsonMap['items'] as List)
          .map((item) => item is Map ? item : (item as MenuItem).toJson())
          .toList();
    }
    
    _menuCache.put(menu.menuId, jsonMap);
    _menuCache.put(
      '${menu.menuId}_timestamp',
      DateTime.now().millisecondsSinceEpoch,
    );
  }
}

@riverpod
MenuRepository menuRepository(Ref ref) {
  final api = ref.watch(menuApiProvider);
  final cache = Hive.box<dynamic>('menu_cache');
  return MenuRepository(api, cache);
}