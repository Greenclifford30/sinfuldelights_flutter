import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/menu.dart';
import '../../data/models/menu_item.dart';
import '../widgets/menu_item_form.dart';
import '../controllers/menu_controller.dart';

class AdminMenuDetailScreen extends ConsumerWidget {
  const AdminMenuDetailScreen({
    super.key,
    required this.menuId,
  });

  final String menuId;

  void _handleAddItem(BuildContext context, WidgetRef ref) {
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
            const Text('Add Menu Item', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            MenuItemForm(
              onSave: (item) async {
                await ref.read(menuControllerProvider(menuId).notifier)
                    .addMenuItem(item);
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
    final menuAsync = ref.watch(menuControllerProvider(menuId));

    return Scaffold(
      appBar: AppBar(
        title: menuAsync.when(
          data: (menu) => Text(menu?.title ?? 'Menu Details'),
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Menu Details'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _handleAddItem(context, ref),
          ),
        ],
      ),
      body: menuAsync.when(
        data: (menu) => menu == null
            ? const Center(child: Text('Menu not found'))
            : _MenuItemList(menu: menu),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: ${error.toString()}'),
        ),
      ),
    );
  }
}

class _MenuItemList extends ConsumerWidget {
  const _MenuItemList({required this.menu});

  final Menu menu;

  void _handleEditItem(BuildContext context, WidgetRef ref, MenuItem item) {
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
            const Text('Edit Menu Item', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            MenuItemForm(
              initialItem: item,
              onSave: (updatedItem) async {
                await ref.read(menuControllerProvider(menu.menuId).notifier)
                    .updateMenuItem(updatedItem);
                if (context.mounted) Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleDeleteItem(BuildContext context, WidgetRef ref, MenuItem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Item'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(menuControllerProvider(menu.menuId).notifier)
                  .deleteMenuItem(item.itemId);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _handleUpdateStock(BuildContext context, WidgetRef ref, MenuItem item) {
    final controller = TextEditingController(text: item.stockQty.toString());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Stock'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Stock Quantity'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final quantity = int.tryParse(controller.text);
              if (quantity != null && quantity >= 0) {
                await ref.read(menuControllerProvider(menu.menuId).notifier)
                    .updateStock(item.itemId, quantity);
                if (context.mounted) Navigator.pop(context);
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (menu.items.isEmpty) {
      return const Center(
        child: Text('No items in this menu. Add some to get started.'),
      );
    }

    return ListView.builder(
      itemCount: menu.items.length,
      itemBuilder: (context, index) {
        final item = menu.items[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              if (item.imageUrl != null)
                Image.network(
                  item.imageUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ListTile(
                title: Text(item.name),
                subtitle: Text(item.description),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text('Edit'),
                      onTap: () => _handleEditItem(context, ref, item),
                    ),
                    PopupMenuItem(
                      child: const Text('Update Stock'),
                      onTap: () => _handleUpdateStock(context, ref, item),
                    ),
                    PopupMenuItem(
                      child: const Text('Delete'),
                      onTap: () => _handleDeleteItem(context, ref, item),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.inventory),
                        const SizedBox(width: 8),
                        Text(
                          'Stock: ${item.stockQty}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}