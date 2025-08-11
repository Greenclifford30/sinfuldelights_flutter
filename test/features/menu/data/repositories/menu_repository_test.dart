import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinfuldelights_flutter/features/menu/data/repositories/menu_repository.dart';
import 'package:sinfuldelights_flutter/features/menu/data/models/menu.dart';
import '../../helpers/test_helpers.dart';

void main() {
  late MockMenuApi mockApi;
  late MockMenuBox mockCache;
  late MenuRepository repository;

  setUp(() {
    mockApi = MockMenuApi();
    mockCache = MockMenuBox();
    repository = MenuRepository(mockApi, mockCache);
  });

  group('createMenu', () {
    test('should call API and update cache', () async {
      when(() => mockApi.createMenu(testMenu))
          .thenAnswer((_) async => testMenu);
      when(() => mockCache.put(any(), any())).thenAnswer((_) async => {});

      final result = await repository.createMenu(testMenu);

      expect(result, equals(testMenu));
      verify(() => mockApi.createMenu(testMenu)).called(1);
      verify(() => mockCache.put(testMenu.menuId, testMenu.toJson())).called(1);
    });
  });

  group('getMenu', () {
    test('should return cached menu if valid', () async {
      final now = DateTime.now();
      when(() => mockCache.get(testMenu.menuId)).thenReturn(testMenu.toJson());
      when(() => mockCache.get('${testMenu.menuId}_timestamp'))
          .thenReturn(now.millisecondsSinceEpoch);

      final result = await repository.getMenu(testMenu.menuId);

      expect(result, equals(testMenu));
      verifyNever(() => mockApi.getMenu(any()));
    });

    test('should fetch from API if cache expired', () async {
      final expiredTime = DateTime.now()
          .subtract(const Duration(minutes: 16))
          .millisecondsSinceEpoch;
      when(() => mockCache.get(testMenu.menuId)).thenReturn(testMenu.toJson());
      when(() => mockCache.get('${testMenu.menuId}_timestamp'))
          .thenReturn(expiredTime);
      when(() => mockApi.getMenu(testMenu.menuId))
          .thenAnswer((_) async => testMenu);
      when(() => mockCache.put(any(), any())).thenAnswer((_) async => {});

      final result = await repository.getMenu(testMenu.menuId);

      expect(result, equals(testMenu));
      verify(() => mockApi.getMenu(testMenu.menuId)).called(1);
      verify(() => mockCache.put(testMenu.menuId, testMenu.toJson())).called(1);
    });

    test('should return cached menu on API error if available', () async {
      when(() => mockCache.get(testMenu.menuId)).thenReturn(testMenu.toJson());
      when(() => mockApi.getMenu(testMenu.menuId))
          .thenThrow(Exception('API Error'));

      final result = await repository.getMenu(testMenu.menuId);

      expect(result, equals(testMenu));
    });
  });

  group('updateMenuItem', () {
    test('should update item and refresh cache', () async {
      final updatedItem = testMenuItem.copyWith(price: 14.99);
      when(() => mockApi.updateMenuItem(testMenu.menuId, updatedItem))
          .thenAnswer((_) async => updatedItem);
      when(() => mockCache.get(testMenu.menuId)).thenReturn(testMenu.toJson());
      when(() => mockCache.put(any(), any())).thenAnswer((_) async => {});

      final result = await repository.updateMenuItem(testMenu.menuId, updatedItem);

      expect(result, equals(updatedItem));
      verify(() => mockApi.updateMenuItem(testMenu.menuId, updatedItem))
          .called(1);
      
      final List<dynamic> captured = verify(() => mockCache.put(testMenu.menuId, captureAny()))
          .captured;
      final Map<String, dynamic> capturedJsonMap = captured.first as Map<String, dynamic>;
      final Menu capturedMenu = Menu.fromJson(capturedJsonMap);
      expect(capturedMenu.items.first.price, equals(14.99));
    });
  });

  group('updateStock', () {
    test('should update stock and refresh cache', () async {
      const newStock = 5;
      when(() => mockApi.updateStock(testMenu.menuId, testMenuItem.itemId, newStock))
          .thenAnswer((_) async => {});
      when(() => mockCache.get(testMenu.menuId)).thenReturn(testMenu.toJson());
      when(() => mockCache.put(any(), any())).thenAnswer((_) async => {});

      await repository.updateStock(testMenu.menuId, testMenuItem.itemId, newStock);

      verify(() => mockApi.updateStock(testMenu.menuId, testMenuItem.itemId, newStock))
          .called(1);
      
      final List<dynamic> captured = verify(() => mockCache.put(testMenu.menuId, captureAny()))
          .captured;
      final Map<String, dynamic> capturedJsonMap = captured.first as Map<String, dynamic>;
      final Menu capturedMenu = Menu.fromJson(capturedJsonMap);
      expect(capturedMenu.items.first.stockQty, equals(newStock));
    });
  });

  group('templates', () {
    test('should create template', () async {
      when(() => mockApi.createTemplate(testTemplate))
          .thenAnswer((_) async => testTemplate);

      final result = await repository.createTemplate(testTemplate);

      expect(result, equals(testTemplate));
      verify(() => mockApi.createTemplate(testTemplate)).called(1);
    });

    test('should apply template', () async {
      final date = DateTime(2025, 7, 23);
      when(() => mockApi.applyTemplate(testTemplate.templateId, date))
          .thenAnswer((_) async => {});

      await repository.applyTemplate(testTemplate.templateId, date);

      verify(() => mockApi.applyTemplate(testTemplate.templateId, date))
          .called(1);
    });
  });
}