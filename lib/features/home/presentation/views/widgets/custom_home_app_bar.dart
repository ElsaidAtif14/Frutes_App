import 'package:flutter/material.dart';
import 'package:frutes_app/core/helper/get_user.dart';
import 'package:frutes_app/core/utils/app_images.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';
import 'package:frutes_app/core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final subtitleColor = isDarkMode ? Colors.grey[100] : Colors.black;
    final greetingColor = isDarkMode ? Colors.grey[400] : const Color(0xFF949D9E);

    return ListTile(
      trailing: NotificationWidget(),
      leading: Image.asset(Assets.assetsImagesProfileImage),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: TextStyles.regular16.copyWith(color: greetingColor),
      ),
      subtitle: Text(
        getUser().name,
        textAlign: TextAlign.right,
        style: TextStyles.bold16.copyWith(color: subtitleColor),
      ),
    );
  }
}
