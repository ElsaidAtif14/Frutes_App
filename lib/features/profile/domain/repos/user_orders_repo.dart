import 'package:dartz/dartz.dart';
import 'package:frutes_app/core/errors/failure.dart';
import 'package:frutes_app/features/profile/domain/entites/order_entity.dart';

 abstract class UserOrdersRepo {
 Future< Either<Failure,List<UserOrderEntity>>> fetchUserOrder();
}