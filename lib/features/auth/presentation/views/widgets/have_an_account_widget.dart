import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frutes_app/core/utils/app_colors.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';

class HaveAnAccountWidgets extends StatelessWidget {
  const HaveAnAccountWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟',
            style: TextStyles.semiBold16.copyWith(color: Color(0xff949D9E)),
          ),
          TextSpan(
            text: ' ',
            style: TextStyles.semiBold16.copyWith(color: Color(0xff949D9E)),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            text: ' تسجيل دخول',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
