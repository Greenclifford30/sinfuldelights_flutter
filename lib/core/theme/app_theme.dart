import 'package:flutter/material.dart';

class SinfulColors {
  static const Color primary = Color(0xFF8B0000); // Deep crimson
  static const Color accent = Color(0xFFFF7A00); // Orange
  static const Color surface = Color(0xFF1A1A1A); // Dark background
  static const Color background = Color(0xFF121212); // Darker background
  static const Color onSurface = Color(0xFFFFFFFF); // White text
  static const Color onBackground = Color(0xFFFFFFFF); // White text
  static const Color onPrimary = Color(0xFFFFFFFF); // White text on primary
  static const Color error = Color(0xFFCF6679);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color disabled = Color(0xFF7A7A7A);
  static const Color outline = Color(0xFF3A3A3A);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: SinfulColors.primary,
        secondary: SinfulColors.accent,
        surface: SinfulColors.surface,
        onSurface: SinfulColors.onSurface,
        onPrimary: SinfulColors.onPrimary,
        error: SinfulColors.error,
        outline: SinfulColors.outline,
      ),
      scaffoldBackgroundColor: SinfulColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: SinfulColors.surface,
        foregroundColor: SinfulColors.onSurface,
        elevation: 2,
      ),
      cardTheme: CardThemeData(
        color: SinfulColors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: SinfulColors.primary,
          foregroundColor: SinfulColors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: SinfulColors.primary,
          side: const BorderSide(color: SinfulColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: SinfulColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: SinfulColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: SinfulColors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: SinfulColors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: SinfulColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: SinfulColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      textTheme: _buildTextTheme(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: SinfulColors.surface,
        selectedItemColor: SinfulColors.primary,
        unselectedItemColor: SinfulColors.disabled,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: SinfulColors.onBackground,
        height: 1.2,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: SinfulColors.onBackground,
        height: 1.2,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: SinfulColors.onBackground,
        height: 1.3,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: SinfulColors.onBackground,
        height: 1.3,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: SinfulColors.onBackground,
        height: 1.4,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: SinfulColors.onBackground,
        height: 1.4,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: SinfulColors.onBackground,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: SinfulColors.onBackground,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: SinfulColors.disabled,
        height: 1.4,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: SinfulColors.onBackground,
        height: 1.4,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: SinfulColors.onBackground,
        height: 1.3,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: SinfulColors.disabled,
        height: 1.3,
      ),
    );
  }
}