import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frutes_app/core/utils/app_colors.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';
import 'package:frutes_app/features/auth/presentation/views/signup_view.dart';

class DontHaveAnAccountWidgets extends StatelessWidget {
  const DontHaveAnAccountWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب؟ ',
            style: TextStyles.semiBold16.copyWith(color: Color(0xff949D9E)),
          ),
          TextSpan(
            text: ' ',
            style: TextStyles.semiBold16.copyWith(color: Color(0xff949D9E)),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
            text: 'قم بإنشاء حساب',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
