// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/core/errors/failure.dart';
import 'package:frutes_app/core/models/product_model.dart';
import 'package:frutes_app/core/repos/products_repo/products_repo.dart';
import 'package:frutes_app/core/services/database_service.dart';
import 'package:frutes_app/core/utils/backend_endpoint.dart';

class ProductsRepoImpl implements ProductsRepo {
  DatabaseService databaseService;
  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> bestSellingProducts() async {
    try {
      var data =
          await databaseService.getData(
                path: BackendEndpoint.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductModel> products = data
          .map((e) => ProductModel.fromJson(e))
          .toList();
      List<ProductEntity> productEntity = products
          .map((e) => e.toEntity())
          .toList();
      return right(productEntity);
    } catch (e) {
      return left(ServerFailure('Faild to get Products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductModel> products = data
          .map((e) => ProductModel.fromJson(e))
          .toList();
      List<ProductEntity> productEntity = products
          .map((e) => e.toEntity())
          .toList();
      return right(productEntity);
    } catch (e) {
      return left(ServerFailure('Faild to get Products'));
    }
  }
}
