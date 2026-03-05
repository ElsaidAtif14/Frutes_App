import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/features/home/presentation/cubits/cart_cubits/cart_cubit.dart';

class ProductDetailsArgs {
  final ProductEntity product;
  final CartCubit cubit;

  ProductDetailsArgs({required this.product, required this.cubit});
}