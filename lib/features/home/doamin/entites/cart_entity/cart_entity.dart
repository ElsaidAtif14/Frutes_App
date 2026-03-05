// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/features/home/doamin/entites/cart_entity/cart_item_entity.dart';

class CartEntity {
  List<CartItemEntity> cartItems;
  CartEntity({required this.cartItems});
  // ignore: strict_top_level_inference
  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  // ignore: strict_top_level_inference
  removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  bool isExis(ProductEntity product) {
    for (var carItem in cartItems) {
      if (carItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var carItem in cartItems) {
      if (carItem.productEntity == product) {
        return carItem;
      }
    }
    return CartItemEntity(productEntity: product, quantity: 1);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }
}
