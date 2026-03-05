import 'package:frutes_app/core/helper/get_currency.dart';
import 'package:frutes_app/features/home/doamin/entites/cart_entity/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  factory ItemEntity.fromEntity(CartItemEntity entity) => ItemEntity(
    name: entity.productEntity.name,
    quantity: entity.quantity,
    price: entity.productEntity.price.toString(),
    currency: getCurrency(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': getCurrency(),
  };
}
