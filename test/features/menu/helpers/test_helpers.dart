import 'package:mocktail/mocktail.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sinfuldelights_flutter/features/menu/data/menu_api.dart';
import 'package:sinfuldelights_flutter/features/menu/data/models/menu.dart';
import 'package:sinfuldelights_flutter/features/menu/data/models/menu_item.dart';
import 'package:sinfuldelights_flutter/features/menu/data/models/predefined_menu.dart';

// Mocks
class MockMenuApi extends Mock implements MenuApi {}
class MockMenuBox extends Mock implements Box<dynamic> {}

// Test Data
final testMenuItem = MenuItem(
  itemId: 'item1',
  name: 'Test Item',
  description: 'Test Description',
  price: 9.99,
  stockQty: 10,
  isSpecial: false,
);

final testMenu = Menu(
  menuId: 'menu1',
  title: 'Test Menu',
  date: DateTime(2025, 7, 23),
  items: [testMenuItem],
  isActive: true,
);

final testTemplate = PredefinedMenu(
  templateId: 'template1',
  name: 'Test Template',
  items: [testMenuItem],
  createdAt: DateTime(2025, 7, 23),
  isActive: true,
);