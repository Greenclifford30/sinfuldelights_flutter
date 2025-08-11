import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sinfuldelights_flutter/features/menu/data/repositories/menu_repository.dart';
import 'package:sinfuldelights_flutter/features/menu/data/models/menu.dart';
import 'package:sinfuldelights_flutter/features/menu/presentation/controllers/providers.dart';
import '../../helpers/test_helpers.dart';

class MockMenuRepository extends Mock implements MenuRepository {}

void main() {
  late MockMenuRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    mockRepository = MockMenuRepository();
    container = ProviderContainer(
      overrides: [
        menuRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('todayMenu', () {
    test('should load today menu successfully', () async {
      final today = DateTime.now();
      final fromDate = DateTime(today.year, today.month, today.day);
      final toDate = DateTime(today.year, today.month, today.day, 23, 59, 59);

      when(() => mockRepository.getAllMenus(fromDate: fromDate, toDate: toDate))
          .thenAnswer((_) async => [testMenu]);

      final future = container.read(todayMenuProvider.future);
      await expectLater(future, completion(testMenu));

      expect(
        container.read(todayMenuProvider),
        isA<AsyncData<Menu?>>(),
      );
    });

    test('should handle empty menu', () async {
      final today = DateTime.now();
      final fromDate = DateTime(today.year, today.month, today.day);
      final toDate = DateTime(today.year, today.month, today.day, 23, 59, 59);

      when(() => mockRepository.getAllMenus(fromDate: fromDate, toDate: toDate))
          .thenAnswer((_) async => []);

      final future = container.read(todayMenuProvider.future);
      await expectLater(future, completion(null));

      expect(
        container.read(todayMenuProvider),
        isA<AsyncData<Menu?>>(),
      );
    });

    test('should handle error', () async {
      final today = DateTime.now();
      final fromDate = DateTime(today.year, today.month, today.day);
      final toDate = DateTime(today.year, today.month, today.day, 23, 59, 59);

      when(() => mockRepository.getAllMenus(fromDate: fromDate, toDate: toDate))
          .thenThrow(Exception('Failed to load menu'));

      final future = container.read(todayMenuProvider.future);
      await expectLater(future, completion(null));

      expect(
        container.read(todayMenuProvider),
        isA<AsyncData<Menu?>>(),
      );
    });
  });
}