import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/admin_menu_summary.dart';
import '../models/admin_menu_detail.dart';
import '../../../../core/failures/result.dart';
import '../../../../core/failures/failures.dart';
import 'admin_dio_client.dart';

part 'admin_menu_api.g.dart';

@riverpod
AdminMenuApi adminMenuApi(Ref ref) {
  final dio = ref.watch(adminDioProvider);
  return AdminMenuApi(dio);
}

class AdminMenuApi {
  final Dio _dio;

  AdminMenuApi(this._dio);

  Future<Result<List<AdminMenuSummary>>> getMenus() async {
    try {
      final response = await _dio.get('/admin/menus');
      final List<dynamic> menuData = response.data;
      final menus = menuData
          .map((menu) => AdminMenuSummary.fromJson(menu as Map<String, dynamic>))
          .toList();
      return Result.success(menus);
    } on DioException catch (e) {
      return Result.failure(_mapDioException(e));
    } catch (e) {
      return Result.failure(const Failure.unknown());
    }
  }

  Future<Result<AdminMenuDetail>> getMenuDetail(String menuId) async {
    try {
      final response = await _dio.get('/admin/menu/$menuId');
      final menu = AdminMenuDetail.fromJson(response.data as Map<String, dynamic>);
      return Result.success(menu);
    } on DioException catch (e) {
      return Result.failure(_mapDioException(e));
    } catch (e) {
      return Result.failure(const Failure.unknown());
    }
  }

  Future<Result<void>> deleteMenu(String menuId) async {
    try {
      await _dio.delete('/admin/menu/$menuId');
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(_mapDioException(e));
    } catch (e) {
      return Result.failure(const Failure.unknown());
    }
  }

  Failure _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return Failure.network(message: e.message);
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401 || statusCode == 403) {
          return Failure.auth(message: 'Authentication failed');
        }
        return Failure.server(
          message: e.response?.statusMessage ?? 'Server error',
          statusCode: statusCode,
        );
      default:
        return Failure.unknown(message: e.message);
    }
  }
}