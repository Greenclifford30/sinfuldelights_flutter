import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';
import 'core/env/env_config.dart';
import 'firebase_options.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    // Initialize Hive
    await Hive.initFlutter();
    await Hive.openBox<dynamic>('menu_cache');
    
    // Initialize Firebase
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    
    // Initialize environment config
    await EnvConfig.initialize();
  } catch (e) {
    debugPrint('Failed to initialize app: $e');
  }

  runApp(
    const ProviderScope(
      child: SinfulDelightsApp(),
    ),
  );
}

class SinfulDelightsApp extends ConsumerWidget {
  const SinfulDelightsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    
    return MaterialApp.router(
      title: 'Sinful Delights',
      theme: AppTheme.darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

