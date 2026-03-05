import 'package:frutes_app/features/home/doamin/entites/cart_entity/cart_item_entity.dart';

import 'item.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});

  factory ItemList.fromEntity(List<CartItemEntity> cartItems) =>
      ItemList(items: cartItems.map((e) => ItemEntity.fromEntity(e)).toList());

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
