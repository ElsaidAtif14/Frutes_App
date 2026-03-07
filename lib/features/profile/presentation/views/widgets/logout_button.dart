import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frutes_app/core/services/firebase_auth_services.dart';
import 'package:frutes_app/core/utils/app_images.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';
import 'package:frutes_app/features/auth/presentation/views/signin_view.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode
        // ignore: deprecated_member_use
        ? const Color(0xFF1B5E37).withOpacity(0.2)
        : const Color(0xFFE8F5E9);
    final textColor = isDarkMode ? Colors.green[300] : const Color(0xff1B5E37);

    return GestureDetector(
      onTap: () {
        FirebaseAuthServices().signOut();
        Navigator.pushNamedAndRemoveUntil(
          context,
          SigninView.routeName,
          (route) => false,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'تسجيل الخروج',
              style: TextStyles.semiBold13.copyWith(color: textColor),
            ),

            Positioned(
              left: 33,
              child: SvgPicture.asset(
                Assets.assetsImagesProfileIconsLogout,
                colorFilter: ColorFilter.mode(textColor!, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
