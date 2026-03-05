import 'package:dartz/dartz.dart';
import 'package:frutes_app/core/errors/failure.dart';
import 'package:frutes_app/features/checkout/domain/entites/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrder({required OrderEntity order});
}
