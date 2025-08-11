import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/cart/presentation/cart_controller.dart';
import '../features/auth/presentation/auth_controller.dart';
import '../core/utils/logo_utils.dart';
import '../features/cart/domain/models/cart_item.dart';
import '../core/auth/admin_access_control.dart';

class HomeShell extends ConsumerWidget {
  const HomeShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartControllerProvider);
    final currentRoute = GoRouterState.of(context).uri.path;
    final isAdmin = ref.watch(isCurrentUserAdminProvider);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          LogoUtils.getLogo(
            isDarkMode: Theme.of(context).brightness == Brightness.dark,
            isHorizontal: false,
          ),
          height: 40,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (cart.totalItems > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${cart.totalItems}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () => context.go('/cart'),
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'logout') {
                await ref.read(authControllerProvider.notifier).signOut();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'logout',
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sign Out'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
            child: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _getSelectedIndex(currentRoute, isAdmin),
        onTap: (index) => _onItemTapped(context, index, isAdmin),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Catering',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.repeat),
            label: 'Subscription',
          ),
          if (isAdmin)
            const BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings),
              label: 'Admin',
            ),
        ],
      ),
    );
  }

  int _getSelectedIndex(String currentRoute, bool isAdmin) {
    switch (currentRoute) {
      case '/menu':
        return 0;
      case '/catering':
        return 1;
      case '/subscription':
        return 2;
      case '/admin':
        return isAdmin ? 3 : 0; // Return 0 (menu) if not admin
      default:
        return 0;
    }
  }

  void _onItemTapped(BuildContext context, int index, bool isAdmin) {
    switch (index) {
      case 0:
        context.go('/menu');
        break;
      case 1:
        context.go('/catering');
        break;
      case 2:
        context.go('/subscription');
        break;
      case 3:
        if (isAdmin) {
          context.go('/admin');
        }
        break;
    }
  }
}