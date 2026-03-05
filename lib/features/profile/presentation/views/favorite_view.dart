import 'package:flutter/material.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import 'package:frutes_app/features/profile/presentation/views/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  static const routeName = 'favoriteview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'المفضلة',
        showNotification: false,
      ),
      body: const FavoriteViewBody(),
    );
  }
}