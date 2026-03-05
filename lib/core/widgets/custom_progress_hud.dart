import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frutes_app/core/utils/app_colors.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomProgressHud extends StatelessWidget {
  const CustomProgressHud({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.transparent,
      progressIndicator: const CupertinoActivityIndicator(
        color: AppColors.primaryColor,
      ),
      inAsyncCall: isLoading,
      child: child,
    );
  }
}
