import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/helper/show_bar.dart';
import 'package:frutes_app/features/home/presentation/cubits/cart_cubits/cart_cubit.dart';
import 'package:frutes_app/features/home/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:frutes_app/features/home/presentation/cubits/favorite/favorite_state.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state is CartItemAdded) {
              showBar(context, 'تمت العملية بنجاح');
            }
            if (state is CartItemRemoved) {
              showBar(context, 'تم الحذف بنجاح');
            }
          },
        ),
        BlocListener<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            if (state is FavoriteItemAdded) {
              showBar(context, 'تمت الإضافة للمفضلة');
            }
            if (state is FavoriteItemRemoved) {
              showBar(context, 'تم الحذف من المفضلة');
            }
          },
        ),
      ],
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
