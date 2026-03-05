import 'package:frutes_app/features/checkout/domain/entites/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };

  factory PaypalPaymentEntity.fromEntity(OrderEntity entity) =>
      PaypalPaymentEntity(
        amount: Amount.fromEntity(entity),
        description: 'payment description',
        itemList: ItemList.fromEntity(entity.cartEntity.cartItems),
      );
}
