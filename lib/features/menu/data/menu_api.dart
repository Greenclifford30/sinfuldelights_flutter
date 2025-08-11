import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/networking/dio_client.dart';
import 'models/menu.dart';
import 'models/menu_item.dart';
import 'models/predefined_menu.dart';

part 'menu_api.g.dart';

class MenuApi {
  final Dio _dio;
  static const _baseUrl = '/admin/menu';

  MenuApi(this._dio);

  Future<Menu> createMenu(Menu menu) async {
    final response = await _dio.post(_baseUrl, data: menu.toJson());
    return Menu.fromJson(response.data);
  }

  Future<Menu> updateMenu(Menu menu) async {
    final response = await _dio.put(
      '$_baseUrl/${menu.menuId}',
      data: menu.toJson(),
    );
    return Menu.fromJson(response.data);
  }

  Future<void> deleteMenu(String menuId) async {
    await _dio.delete('$_baseUrl/$menuId');
  }

  Future<Menu> getMenu(String menuId) async {
    final response = await _dio.get('$_baseUrl/$menuId');
    // Add empty items array if not present in the API response
    final menuJson = Map<String, dynamic>.from(response.data);
    if (!menuJson.containsKey('items')) {
      menuJson['items'] = <Map<String, dynamic>>[];
    }
    return Menu.fromJson(menuJson);
  }

  Future<List<Menu>> getAllMenus({DateTime? fromDate, DateTime? toDate}) async {
    final response = await _dio.get('/admin/menus', queryParameters: {
      if (fromDate != null) 'fromDate': fromDate.toIso8601String(),
      if (toDate != null) 'toDate': toDate.toIso8601String(),
    });
    final items = response.data['items'] as List? ?? [];
    return items.map((json) {
      // Add empty items array if not present in the API response
      final menuJson = Map<String, dynamic>.from(json);
      if (!menuJson.containsKey('items')) {
        menuJson['items'] = <Map<String, dynamic>>[];
      }
      return Menu.fromJson(menuJson);
    }).toList();
  }

  Future<MenuItem> addMenuItem(String menuId, MenuItem item) async {
    final response = await _dio.post(
      '$_baseUrl/$menuId/items',
      data: item.toJson(),
    );
    return MenuItem.fromJson(response.data);
  }

  Future<MenuItem> updateMenuItem(String menuId, MenuItem item) async {
    final response = await _dio.put(
      '$_baseUrl/$menuId/items/${item.itemId}',
      data: item.toJson(),
    );
    return MenuItem.fromJson(response.data);
  }

  Future<void> deleteMenuItem(String menuId, String itemId) async {
    await _dio.delete('$_baseUrl/$menuId/items/$itemId');
  }

  Future<void> updateStock(String menuId, String itemId, int quantity) async {
    await _dio.patch(
      '$_baseUrl/$menuId/items/$itemId/stock',
      data: {'quantity': quantity},
    );
  }

  Future<String> getImageUploadUrl() async {
    final response = await _dio.get('$_baseUrl/image-upload-url');
    return response.data['url'];
  }

  Future<void> uploadImage(String url, List<int> imageBytes) async {
    await _dio.put(
      url,
      data: Stream.fromIterable([imageBytes]),
      options: Options(
        headers: {'Content-Type': 'image/jpeg'},
        contentType: 'image/jpeg',
      ),
    );
  }

  // Predefined Menu Templates
  Future<PredefinedMenu> createTemplate(PredefinedMenu template) async {
    final response = await _dio.post(
      '$_baseUrl/templates',
      data: template.toJson(),
    );
    return PredefinedMenu.fromJson(response.data);
  }

  Future<List<PredefinedMenu>> getTemplates() async {
    final response = await _dio.get('$_baseUrl/templates');
    return (response.data as List)
        .map((json) => PredefinedMenu.fromJson(json))
        .toList();
  }

  Future<void> applyTemplate(String templateId, DateTime date) async {
    await _dio.post('$_baseUrl/templates/$templateId/apply', data: {
      'date': date.toIso8601String(),
    });
  }
}

@riverpod
MenuApi menuApi(Ref ref) {
  final dio = ref.watch(dioProvider);
  return MenuApi(dio);
}