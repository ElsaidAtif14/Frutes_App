import 'package:flutter/material.dart';
import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/core/utils/app_colors.dart';
import 'package:gap/gap.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[100]
                          : Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${product.price} جنية / الكيلو',
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              
              //  CounterWidget(product: product,),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '(${product.reviews.length}+) ${product.avgRating}',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[400]
                      : Colors.grey,
                ),
              ),
              const Icon(Icons.star, color: Colors.amber, size: 20),
              const Gap(8),
              Text(
                'المراجعه',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.green[400]
                      : Colors.green,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          const Gap(16),
          Text(
            'ينتمي إلى الفصيلة القرعية وثمرته لب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبية، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[400]
                  : Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
