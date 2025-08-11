import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/admin_menu_summary.dart';
import '../../data/models/admin_menu_detail.dart';
import '../../data/repositories/admin_menu_repository.dart';

part 'admin_menu_controller.g.dart';

@riverpod
class AdminMenuController extends _$AdminMenuController {
  @override
  AsyncValue<List<AdminMenuSummary>> build() {
    loadMenus();
    return const AsyncValue.loading();
  }

  Future<void> loadMenus() async {
    state = const AsyncValue.loading();
    
    final repository = ref.read(adminMenuRepositoryProvider);
    final result = await repository.getMenus();
    
    result.when(
      success: (menus) => state = AsyncValue.data(menus),
      failure: (failure) => state = AsyncValue.error(failure, StackTrace.current),
    );
  }

  Future<void> deleteMenu(String menuId) async {
    final repository = ref.read(adminMenuRepositoryProvider);
    final result = await repository.deleteMenu(menuId);
    
    result.when(
      success: (_) => loadMenus(), // Refresh the list after deletion
      failure: (failure) => state = AsyncValue.error(failure, StackTrace.current),
    );
  }
}

@riverpod
class AdminMenuDetailController extends _$AdminMenuDetailController {
  @override
  AsyncValue<AdminMenuDetail?> build(String menuId) {
    loadMenuDetail(menuId);
    return const AsyncValue.loading();
  }

  Future<void> loadMenuDetail(String menuId) async {
    state = const AsyncValue.loading();
    
    final repository = ref.read(adminMenuRepositoryProvider);
    final result = await repository.getMenuDetail(menuId);
    
    result.when(
      success: (menu) => state = AsyncValue.data(menu),
      failure: (failure) => state = AsyncValue.error(failure, StackTrace.current),
    );
  }
}