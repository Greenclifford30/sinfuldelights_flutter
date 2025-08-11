import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? '';
  static String get publicApiKey => dotenv.env['PUBLIC_API_KEY'] ?? '';
  static String get adminApiKey => dotenv.env['ADMIN_API_KEY'] ?? '';
  static String get stripePublishableKey => dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
  
  static bool get isDevelopment => dotenv.env['ENV'] == 'development';
  static bool get isProduction => dotenv.env['ENV'] == 'production';
}