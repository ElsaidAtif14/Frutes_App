import 'package:bloc/bloc.dart';
import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/features/home/doamin/entites/cart_entity/cart_entity.dart';
import 'package:frutes_app/features/home/doamin/entites/cart_entity/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartItems: []);
  void addedCartItem(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExis(productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      //increse count
      cartItem.increasQuantity();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }

  void removeCartItem(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }
}
