import 'package:frutes_app/core/helper/get_currency.dart';
import 'package:frutes_app/features/checkout/domain/entites/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

 
  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };

  factory Amount.fromEntity(OrderEntity order){
    return Amount(
      total: order.calculateTotalPriceAfterDiscountAndShipping().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(order),
    );
  }
}
