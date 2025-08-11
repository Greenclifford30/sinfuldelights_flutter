import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: const Color(0xFF8B0000),
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(24.0),
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: [
          _buildDashboardTile(
            context,
            icon: Icons.restaurant_menu,
            title: 'Menus',
            onTap: () => _navigateTo(context, '/admin/menu'),
          ),
          _buildDashboardTile(
            context,
            icon: Icons.pattern,
            title: 'Templates',
            onTap: () => _navigateTo(context, '/admin/menu/templates'),
          ),
          _buildDashboardTile(
            context,
            icon: Icons.analytics,
            title: 'Analytics',
            onTap: () {},
          ),
          _buildDashboardTile(
            context,
            icon: Icons.inventory_2,
            title: 'Inventory',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: const Color(0xFF8B0000)),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, String route) {
    context.push(route);
  }
}