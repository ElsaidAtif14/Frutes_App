import 'package:flutter/material.dart';
import 'package:frutes_app/core/widgets/notification_widget.dart';

import '../utils/app_text_styles.dart';

AppBar customAppBar(
  // ignore: strict_top_level_inference
  context, {
  required String title,
  bool showBackButton = true,
  bool showNotification = true,
}) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final backgroundColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
  final iconColor = isDarkMode ? Colors.grey[400] : Colors.black;
  final textColor = isDarkMode ? Colors.grey[100] : Colors.black;

  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0,
    scrolledUnderElevation: 0,
    actions: [
      Visibility(
        visible: showNotification,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      ),
    ],
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_new, color: iconColor),
      ),
    ),
    centerTitle: true,
    title: Text(title, 
      textAlign: TextAlign.center, 
      style: TextStyles.bold19.copyWith(color: textColor),
    ),
  );
}
