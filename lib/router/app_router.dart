import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/menu/presentation/menu_screen.dart';
import '../features/cart/presentation/cart_screen.dart';
import '../features/catering/presentation/catering_form_screen.dart';
import '../features/subscription/presentation/subscription_flow.dart';
import '../features/menu/presentation/screens/admin_menu_list_screen.dart';
import '../features/menu/presentation/screens/admin_menu_detail_screen.dart';
import '../features/menu/presentation/screens/admin_menu_templates_screen.dart';
import '../features/splash/splash_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/auth_controller.dart';
import '../core/auth/admin_access_control.dart';
import '../features/admin/presentation/screens/admin_screen.dart';
import 'home_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  final currentUser = ref.watch(currentUserProvider);
  final isAdmin = ref.watch(isCurrentUserAdminProvider);
  
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = currentUser != null;
      final isLoggingIn = state.matchedLocation == '/login';
      final isAdminRoute = state.matchedLocation.startsWith('/admin');
      
      // If not logged in and not on login page, redirect to login
      if (!isLoggedIn && !isLoggingIn) {
        return '/login';
      }
      
      // If logged in and on login page, redirect to menu
      if (isLoggedIn && isLoggingIn) {
        return '/menu';
      }
      
      // If trying to access admin route without admin permissions, redirect to menu
      if (isAdminRoute && !isAdmin) {
        return '/menu';
      }
      
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        redirect: (context, state) => '/menu',
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return HomeShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/menu',
            name: 'menu',
            builder: (context, state) => const MenuScreen(),
          ),
          GoRoute(
            path: '/cart',
            name: 'cart',
            builder: (context, state) => const CartScreen(),
          ),
          GoRoute(
            path: '/catering',
            name: 'catering',
            builder: (context, state) => const CateringFormScreen(),
          ),
          GoRoute(
            path: '/subscription',
            name: 'subscription',
            builder: (context, state) => const SubscriptionFlowScreen(),
          ),
          GoRoute(
            path: '/admin',
            name: 'admin',
            builder: (context, state) => const Admin(),
            routes: [
              GoRoute(
                path: 'menu',
                name: 'admin_menu_list',
                builder: (context, state) => const AdminMenuListScreen(),
              ),
              GoRoute(
                path: 'menu/:menuId',
                name: 'admin_menu_detail',
                builder: (context, state) => AdminMenuDetailScreen(
                  menuId: state.pathParameters['menuId']!,
                ),
              ),
              GoRoute(
                path: 'menu/templates',
                name: 'admin_menu_templates',
                builder: (context, state) => const AdminMenuTemplatesScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

