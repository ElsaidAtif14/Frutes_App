import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/widgets/custom_button.dart';
import 'package:frutes_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:frutes_app/features/home/presentation/cubits/cart_cubits/cart_cubit.dart';
import 'package:frutes_app/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

class CusttomCartButton extends StatelessWidget {
  const CusttomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return Visibility(
          visible: context.read<CartCubit>().cartEntity.cartItems.isNotEmpty,
          child: CustomButton(
            onPressed: () {
              if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
                Navigator.pushNamed(
                  context,
                  CheckoutView.routeName,
                  arguments: context.read<CartCubit>().cartEntity,
                );
              }
            },
            text:
                'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
          ),
        );
      },
    );
  }
}
