import 'package:dartz/dartz.dart';
import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/core/errors/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> bestSellingProducts();
}
