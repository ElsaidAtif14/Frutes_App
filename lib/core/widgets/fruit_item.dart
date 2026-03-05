import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/core/helper/product.details.args.dart';
import 'package:frutes_app/core/utils/app_colors.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';
import 'package:frutes_app/core/widgets/custom_network_image.dart';
import 'package:frutes_app/features/home/presentation/cubits/cart_cubits/cart_cubit.dart';
import 'package:frutes_app/features/home/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:gap/gap.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode
        ? const Color(0xFF2A2A2A)
        : const Color(0xFFF3F5F7);
    final titleColor = isDarkMode ? Colors.grey[100] : null;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        'productDetailsView',
        arguments: ProductDetailsArgs(
          product: product,
          cubit: context.read<CartCubit>(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(4),
          shape: BoxShape.rectangle,
        ),
        child: Stack(
          children: [
         
            Positioned.fill(
              child: Column(
                children: [
                  Gap(20),
                  product.imageUrl != null
                      ? Flexible(
                          flex: 2,
                          child: CustomNetworkImage(
                            imageUrl: product.imageUrl!,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.grey[700] : Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 100,
                          width: 100,
                        ),
                  Gap(24),
                  ListTile(
                    title: Text(
                      product.name,
                      textAlign: TextAlign.right,
                      style: TextStyles.semiBold16.copyWith(color: titleColor),
                    ),
                    subtitle: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: product.price.toString(),
                            style: TextStyles.bold13.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: '/',
                            style: TextStyles.bold13.copyWith(
                              color: AppColors.lightSecondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyles.semiBold13.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: 'كيلو',
                            style: TextStyles.semiBold13.copyWith(
                              color: AppColors.lightSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: IconButton(
                        onPressed: () {
                          context.read<CartCubit>().addedCartItem(product);
                        },
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
               Positioned(
              top: 0,
              right: 0,
              child: Builder(
                builder: (context) {
                  final isFav = context.watch<FavoriteCubit>().isFavorite(
                    product,
                  );
                  return IconButton(
                    onPressed: () {
                      context.read<FavoriteCubit>().toggleFavorite(product);
                    },
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
