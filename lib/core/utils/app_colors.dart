import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xff1F5E3B);
  static const Color lightPrimaryColor = Color(0xFF2D9F5D);
  
  // Secondary Colors
  static const Color secondaryColor = Color(0xFFF4A91F);
  static const Color lightSecondaryColor = Color(0xFFF8C76D);
  
  // Neutral Colors - Work for both light and dark modes
  static const Color darkText = Color(0xFF222222);
  static const Color lightText = Color(0xFF616161);
  static const Color hintText = Color(0xFF9C9C9C);
  static const Color borderColor = Color(0xffF2F3F3);
  
  // Background Colors
  static const Color lightBackground = Colors.white;
  static const Color darkBackground = Color(0xFF1E1E1E);
  
  // Colors that work well on both backgrounds
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFE53935);
  static const Color warningColor = Color(0xFFFFA726);
  static const Color infoColor = Color(0xFF29B6F6);
}
