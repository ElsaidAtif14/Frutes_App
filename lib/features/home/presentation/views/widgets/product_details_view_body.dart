import 'package:flutter/material.dart';
import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/product_attributes_grid.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/product_header.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/product_info_section.dart';
import 'package:gap/gap.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductHeader(product: productEntity), // الجزء العلوي
           ProductInfoSection(product: productEntity,), // معلومات المنتج
           ProductAttributesGrid(product: productEntity,), // الشبكة (جرام، كالوري، الخ)
          const Gap(20),
        ],
      ),
    );
  }
}
