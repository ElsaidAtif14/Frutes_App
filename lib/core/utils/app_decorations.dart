import 'package:flutter/material.dart';
import 'package:frutes_app/core/utils/app_colors.dart';

abstract class AppDecorations {
  static var greyBoxDecoration = ShapeDecoration(
    color:  AppColors.primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}
