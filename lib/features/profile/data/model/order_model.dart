import 'package:frutes_app/core/models/order_product_model.dart';
import 'package:frutes_app/features/profile/domain/entites/order_entity.dart';

import '../../../../core/enums/order_enum.dart';

class UserOrderModel {
  final double totalPrice;
  final String uId;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String? status;
  final String orderID;
  final String date;
  UserOrderModel({
    required this.totalPrice,
    required this.uId,
    required this.status,
    required this.orderID,
    required this.orderProducts,
    required this.paymentMethod,
    required this.date,
  });

  factory UserOrderModel.fromJson(Map<String, dynamic> json) => UserOrderModel(
    totalPrice: json['totalPrice'],
    uId: json['uId'],
    status: json['status'],
    orderID: json['orderId'],
    orderProducts: List<OrderProductModel>.from(
      json['orderProducts'].map((e) => OrderProductModel.fromJson(e)),
    ),
    paymentMethod: json['paymentMethod'],
    date: json['date'],
  );

  UserOrderEntity toEntity() => UserOrderEntity(
    orderID: orderID,
    totalPrice: totalPrice,
    status: fetchEnum(),
    uId: uId,
    orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
    paymentMethod: paymentMethod,
    date: date,
  );

  OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}

// payment method
