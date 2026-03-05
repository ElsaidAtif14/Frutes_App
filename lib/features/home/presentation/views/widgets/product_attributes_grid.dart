import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/core/utils/app_images.dart';

class ProductAttributesGrid extends StatelessWidget {
  const ProductAttributesGrid({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      childAspectRatio: 2.2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        _buildAttributeCard(
          'ـ${product.expirationsMonths} شهر',
          'الصلاحيه',
          Assets.assetsImagesCalendar,
          Colors.blue,
          isDarkMode,
        ),
        _buildAttributeCard(
          'ـ${product.isOrganic ? "100%" : "25%"} ',
          'أوجانيك',
          Assets.assetsImagesOrgnic,
          Colors.green,
          isDarkMode,
        ),
        _buildAttributeCard(
          'ـ${product.numberOfCalories} كالوري',
          'ـ${product.unitAmount} كيلو',
          Assets.assetsImagesFire,
          Colors.orange,
          isDarkMode,
        ),
        _buildAttributeCard(
          product.ratingCount > 0 ? 'ـ${product.avgRating.toStringAsFixed(1)} / 5' : 'لا يوجد تقييم',
          'Reviews',
          Assets.assetsImagesFavourites,
          Colors.amber,
          isDarkMode,
        ),
      ],
    );
  }

  Widget _buildAttributeCard(
    String title,
    String subtitle,
    String image,
    Color color,
    bool isDarkMode,
  ) {
    final borderColor = isDarkMode ? Colors.grey[700] : Colors.grey[200];
    final textColor = isDarkMode ? Colors.grey[300] : Colors.black;
    final subtitleColor = isDarkMode ? Colors.grey[500] : Colors.grey;
    
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.grey[200]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(color: subtitleColor, fontSize: 12),
              ),
            ],
          ),
          SvgPicture.asset(image),
        ],
      ),
    );
  }
}
