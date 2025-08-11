import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/admin_menu_controller.dart';
import '../widgets/admin_menu_tile.dart';
import '../../../../core/failures/failures.dart';

class AdminMenusScreen extends ConsumerWidget {
  const AdminMenusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menusState = ref.watch(adminMenuControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Menus'),
        backgroundColor: const Color(0xFF8B0000), // Sinful Delights crimson
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(adminMenuControllerProvider.notifier).loadMenus(),
          ),
        ],
      ),
      body: menusState.when(
        data: (menus) {
          if (menus.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restaurant_menu, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No menus found',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(adminMenuControllerProvider.notifier).loadMenus();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: menus.length,
              itemBuilder: (context, index) {
                final menu = menus[index];
                return AdminMenuTile(
                  menu: menu,
                  onTap: () => context.push('/admin/menu/${menu.menuId}'),
                  onDelete: () => _showDeleteConfirmation(context, ref, menu.menuId, menu.title),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
              const SizedBox(height: 16),
              Text(
                _getErrorMessage(error),
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(adminMenuControllerProvider.notifier).loadMenus(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/admin/menu/new'),
        backgroundColor: const Color(0xFF8B0000),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  String _getErrorMessage(Object error) {
    if (error is Failure) {
      return error.when(
        network: (message) => 'Network error: ${message ?? 'Please check your connection'}',
        auth: (message) => 'Authentication error: ${message ?? 'Please log in again'}',
        server: (message, statusCode) => 'Server error: ${message ?? 'Something went wrong'}',
        unknown: (message) => 'Error: ${message ?? 'Something went wrong'}',
      );
    }
    return 'An unexpected error occurred';
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
    String menuId,
    String menuTitle,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Menu'),
        content: Text('Are you sure you want to delete "$menuTitle"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(adminMenuControllerProvider.notifier).deleteMenu(menuId);
    }
  }
}