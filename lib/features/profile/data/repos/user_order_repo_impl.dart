// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:frutes_app/core/errors/failure.dart';
import 'package:frutes_app/core/services/database_service.dart';
import 'package:frutes_app/core/utils/backend_endpoint.dart';
import 'package:frutes_app/features/profile/data/model/order_model.dart';
import 'package:frutes_app/features/profile/domain/entites/order_entity.dart';
import 'package:frutes_app/features/profile/domain/repos/user_orders_repo.dart';

class UserOrderRepoImpl implements UserOrdersRepo {
  DatabaseService databaseService;
  UserOrderRepoImpl(
     this.databaseService,
  );


  @override
  Future<Either<Failure, List<UserOrderEntity>>> fetchUserOrder() async{
    try {
      var data=await databaseService.getData(path: BackendEndpoint.getOrders) as List<Map<String ,dynamic>>;
      List<UserOrderModel> userOrdersModel=data.map((e)=>UserOrderModel.fromJson(e)).toList();
      List<UserOrderEntity> userOrdersEntity=userOrdersModel.map((e)=>e.toEntity()).toList();
      return right(userOrdersEntity);
    } catch (e) {
      return left(ServerFailure('faild to fecth orders'));
    }
  }}
