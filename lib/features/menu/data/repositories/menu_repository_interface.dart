import '../models/menu.dart';
import '../models/menu_item.dart';
import '../models/predefined_menu.dart';

abstract class MenuRepositoryInterface {
  Future<Menu> createMenu(Menu menu);
  Future<Menu> updateMenu(Menu menu);
  Future<void> deleteMenu(String menuId);
  Future<Menu> getMenu(String menuId);
  Future<List<Menu>> getAllMenus({DateTime? fromDate, DateTime? toDate});
  Future<MenuItem> addMenuItem(String menuId, MenuItem item);
  Future<MenuItem> updateMenuItem(String menuId, MenuItem item);
  Future<void> deleteMenuItem(String menuId, String itemId);
  Future<void> updateStock(String menuId, String itemId, int quantity);
  Future<String> getImageUploadUrl();
  Future<void> uploadImage(String url, List<int> imageBytes);
  Future<PredefinedMenu> createTemplate(PredefinedMenu template);
  Future<List<PredefinedMenu>> getTemplates();
  Future<void> applyTemplate(String templateId, DateTime date);
}