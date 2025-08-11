import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? 'https://zgm602x7mh.execute-api.us-east-1.amazonaws.com/development/v1';
  static String get publicApiKey => dotenv.env['PUBLIC_API_KEY'] ?? 'wGJFhJKLjA4OodcdrkuTC9wv6y1j0QOz4Woa8jrX';
  static String get adminApiKey => dotenv.env['ADMIN_API_KEY'] ?? 'wGJFhJKLjA4OodcdrkuTC9wv6y1j0QOz4Woa8jrX';
  static String get stripePublishableKey => dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? 'pk_test_dev';
  static bool get isDevelopment => dotenv.env['ENV'] == 'development';
  static bool get isProduction => dotenv.env['ENV'] == 'production';
  static Future<void> initialize() async {
    await dotenv.load(fileName: '.env');
  }
}