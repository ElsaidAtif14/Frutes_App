import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/constants.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import 'package:frutes_app/features/home/presentation/cubits/cart_cubits/cart_cubit.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/car_items_list.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/cart_header.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/custom_cart_buttom.dart';
import 'package:gap/gap.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Gap(kTopPaddding),
                  customAppBar(
                    context,
                    title: 'السلة',
                    showBackButton: false,
                    showNotification: false,
                  ),
                  Gap(kTopPaddding),
                  CartHeader(),
                  Gap(24),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
            CarItemsList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child: CusttomCartButton(),
        ),
      ],
    );
  }
}
