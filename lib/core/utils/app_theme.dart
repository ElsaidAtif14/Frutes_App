import 'package:flutter/material.dart';
import 'package:frutes_app/core/utils/app_colors.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ),
    // إعدادات الأيقونات للوضع الفاتح
    iconTheme: const IconThemeData(
      color: Color(0xFF222222),
      size: 24,
    ),
    // إعدادات الدايلوج للوضع الفاتح
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      titleTextStyle: const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF222222),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF222222)),
      bodyMedium: TextStyle(color: Color(0xFF616161)),
      bodySmall: TextStyle(color: Color(0xFF9C9C9C)),
    ),
    dividerColor: const Color(0xffF2F3F3),
    listTileTheme: const ListTileThemeData(
      textColor: Color(0xFF222222),
      iconColor: Color(0xFF222222),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF222222)),
      surfaceTintColor: Colors.white,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xffF2F3F3)),
      ),
    ),
    inputDecorationTheme: _buildInputDecorationTheme(Brightness.light),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Cairo',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimaryColor,
      brightness: Brightness.dark,
    ),
    // إعدادات الأيقونات للوضع الداكن
    iconTheme: const IconThemeData(
      color: Color(0xFFEAEAEA),
      size: 24,
    ),
    // إعدادات الدايلوج للوضع الداكن
    dialogTheme: DialogThemeData(
      backgroundColor: const Color(0xFF2A2A2A),
      surfaceTintColor: Colors.transparent, // لمنع تداخل الألوان في Material 3
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      titleTextStyle: const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFFEAEAEA),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFEAEAEA)),
      bodyMedium: TextStyle(color: Color(0xFFB0B0B0)),
      bodySmall: TextStyle(color: Color(0xFF808080)),
    ),
    dividerColor: const Color(0xFF333333),
    listTileTheme: const ListTileThemeData(
      textColor: Color(0xFFEAEAEA),
      iconColor: Color(0xFFEAEAEA),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFEAEAEA)),
      surfaceTintColor: Color(0xFF1E1E1E),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF2A2A2A),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xFF333333)),
      ),
    ),
    inputDecorationTheme: _buildInputDecorationTheme(Brightness.dark),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.lightPrimaryColor,
    ),
  );

  // دالة مساعدة لتوحيد تصميم الحقول
  static InputDecorationTheme _buildInputDecorationTheme(Brightness brightness) {
    bool isDark = brightness == Brightness.dark;
    return InputDecorationTheme(
      filled: true,
      fillColor: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF7F7F7),
      hintStyle: TextStyle(color: isDark ? const Color(0xFF808080) : const Color(0xFF9C9C9C)),
      labelStyle: TextStyle(color: isDark ? const Color(0xFFEAEAEA) : const Color(0xFF616161)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: isDark ? const Color(0xFF555555) : const Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: isDark ? AppColors.lightPrimaryColor : AppColors.primaryColor),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}