import 'package:dartz/dartz.dart';
import 'package:frutes_app/core/errors/failure.dart';
import 'package:frutes_app/core/repos/orders_repo/orders_repo.dart';
import 'package:frutes_app/core/services/database_service.dart';
import 'package:frutes_app/core/utils/backend_endpoint.dart';
import 'package:frutes_app/features/checkout/data/models/order_model.dart';
import 'package:frutes_app/features/checkout/domain/entites/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService dataBaseService;

  OrdersRepoImpl(this.dataBaseService);
  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity order}) async {
    try {
      dataBaseService.addData(
        path: BackendEndpoint.addOrders,
        data: OrderModel.fromEntity(order).toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add order'));
    }
  }
}
