import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/helper/product.details.args.dart';
import 'package:frutes_app/core/widgets/custom_button.dart';
import 'package:frutes_app/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.args});
  static const routeName = 'productDetailsView';
  final ProductDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          onPressed: () {
            args.cubit.addedCartItem(args.product);
          },
          text: 'أضف إلى السلة',
        ),
      ),
      body: BlocProvider(
        create: (context) => CartItemCubit(),
        child: ProductDetailsViewBody(productEntity: args.product),
      ),
    );
  }
}
