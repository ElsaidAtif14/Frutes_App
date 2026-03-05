import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:frutes_app/core/utils/app_images.dart';
import 'package:frutes_app/features/profile/presentation/views/favorite_view.dart';
import 'package:frutes_app/features/profile/presentation/views/widgets/profile_language_item.dart';
import 'package:frutes_app/features/profile/presentation/views/widgets/profile_menu_item.dart';
import 'package:frutes_app/features/profile/presentation/views/widgets/profile_toggle_item.dart';

class ProfileItemSliverList extends StatefulWidget {
  const ProfileItemSliverList({super.key});

  @override
  State<ProfileItemSliverList> createState() => _ProfileItemSliverListState();
}

class _ProfileItemSliverListState extends State<ProfileItemSliverList> {
  bool notificationToggle = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return SliverList(
          delegate: SliverChildListDelegate([
            ProfileMenuItem(
              icon: Assets.assetsImagesProfileIconsVuesaxOutlineUser,
              title: 'الملف الشخصي',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Assets.assetsImagesProfileIconsVuesaxOutlineBox,
              title: 'طلباتي',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Assets.assetsImagesProfileIconsVuesaxOutlineEmptyWallet,
              title: 'المدفوعات',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Assets.assetsImagesProfileIconsHeart,
              title: 'المفضلة',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  FavoriteView.routeName,
                );
              },
            ),
            ProfileToggleItem(
              icon: Assets.assetsImagesProfileIconsNotification,
              title: 'الاشعارات',
              value: notificationToggle,
              onChanged: (v) {
                setState(() {
                  notificationToggle = v;
                });
              },
            ),
            ProfileLanguageItem(
              title: 'اللغة',
              currentLang: 'العربية',
              icon: Assets.assetsImagesProfileIconsGlobal,
            ),
            ProfileToggleItem(
              icon: Assets.assetsImagesProfileIconsMagicpen,
              title: 'الوضع',
              value: themeState.isDarkMode,
              onChanged: (v) {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
            //
          ]),
        );
      },
    );
  }
}
