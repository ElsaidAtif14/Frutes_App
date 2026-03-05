// ignore: strict_top_level_inference
import 'package:flutter/material.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';

// ignore: strict_top_level_inference
AppBar buildAppBar(context, {required String title, Widget? leadingWedgit}) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final backgroundColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
  final textColor = isDarkMode ? Colors.grey[100] : Colors.black;

  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: backgroundColor,
    leading: leadingWedgit,
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    title: Text(title, 
      textAlign: TextAlign.center, 
      style: TextStyles.bold19.copyWith(color: textColor),
    ),
  );
}
