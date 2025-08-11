import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/admin_menu_summary.dart';
import '../models/admin_menu_detail.dart';
import '../services/admin_menu_api.dart';
import '../../../../core/failures/result.dart';

part 'admin_menu_repository.g.dart';

@riverpod
AdminMenuRepository adminMenuRepository(Ref ref) {
  final api = ref.watch(adminMenuApiProvider);
  return AdminMenuRepository(api);
}

class AdminMenuRepository {
  final AdminMenuApi _api;

  AdminMenuRepository(this._api);

  Future<Result<List<AdminMenuSummary>>> getMenus() async {
    return await _api.getMenus();
  }

  Future<Result<AdminMenuDetail>> getMenuDetail(String menuId) async {
    return await _api.getMenuDetail(menuId);
  }

  Future<Result<void>> deleteMenu(String menuId) async {
    return await _api.deleteMenu(menuId);
  }
}