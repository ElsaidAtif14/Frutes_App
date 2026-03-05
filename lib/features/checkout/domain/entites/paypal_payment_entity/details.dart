import 'package:frutes_app/features/checkout/domain/entites/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});



  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
  factory DetailsEntity.fromEntity(OrderEntity order){
    return DetailsEntity(
      subtotal: order.cartEntity.calculateTotalPrice().toString(),
      shipping: order.calculateShippingCost().toString(),
      shippingDiscount: order.calcualteShippingDiscount(),
    );
  }
}
