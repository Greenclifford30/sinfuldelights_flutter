import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/menu_repository.dart';
import '../../data/models/menu.dart';

part 'today_menu_controller.g.dart';

@riverpod
Future<Menu?> todayMenu(Ref ref) async {
  try {
    final repository = ref.read(menuRepositoryProvider);
    final today = DateTime.now();
    final menus = await repository.getAllMenus(
      fromDate: DateTime(today.year, today.month, today.day),
      toDate: DateTime(today.year, today.month, today.day, 23, 59, 59),
    );
    return menus.firstOrNull;
  } catch (e) {
    return null;
  }
}