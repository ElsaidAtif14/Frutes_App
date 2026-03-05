import 'package:flutter/material.dart';
import 'package:frutes_app/core/utils/app_colors.dart';

void showBar(BuildContext context, String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: color ?? AppColors.primaryColor,
      content: Text(message, overflow: TextOverflow.ellipsis),
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
