import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/menu.dart';
import '../controllers/menu_controller.dart';
import '../widgets/menu_form.dart';

class AdminMenuListScreen extends ConsumerWidget {
  const AdminMenuListScreen({super.key});

  void _handleCreateMenu(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Create Menu', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            MenuForm(
              onSave: (menu) async {
                await ref.read(menuListControllerProvider.notifier).createMenu(menu);
                if (context.mounted) Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuListAsync = ref.watch(menuListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Menus'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _handleCreateMenu(context, ref),
          ),
        ],
      ),
      body: menuListAsync.when(
        data: (menus) => _MenuList(menus: menus),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: ${error.toString()}'),
        ),
      ),
    );
  }
}

class _MenuList extends ConsumerWidget {
  const _MenuList({required this.menus});

  final List<Menu> menus;

  void _handleEditMenu(BuildContext context, WidgetRef ref, Menu menu) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Edit Menu', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            MenuForm(
              initialMenu: menu,
              onSave: (updatedMenu) async {
                await ref.read(menuControllerProvider(menu.menuId).notifier)
                    .updateMenu(updatedMenu);
                await ref.read(menuListControllerProvider.notifier).refreshMenus();
                if (context.mounted) Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleDeleteMenu(BuildContext context, WidgetRef ref, Menu menu) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Menu'),
        content: const Text('Are you sure you want to delete this menu?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(menuControllerProvider(menu.menuId).notifier)
                  .deleteMenu();
              await ref.read(menuListControllerProvider.notifier).refreshMenus();
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (menus.isEmpty) {
      return const Center(
        child: Text('No menus found. Create one to get started.'),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(menuListControllerProvider.notifier).refreshMenus();
      },
      child: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          final menu = menus[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(menu.title),
              subtitle: Text(
                '${menu.date.toString().split(' ')[0]} • ${menu.items.length} items',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _handleEditMenu(context, ref, menu),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _handleDeleteMenu(context, ref, menu),
                  ),
                ],
              ),
              onTap: () => context.go('/admin/menu/${menu.menuId}'),
            ),
          );
        },
      ),
    );
  }
}