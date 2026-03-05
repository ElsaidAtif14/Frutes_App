import 'package:equatable/equatable.dart';
import 'package:frutes_app/core/entites/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  // ignore: strict_top_level_inference
  increasQuantity() {
    quantity++;
  }

  // ignore: strict_top_level_inference
  decreasQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  @override
  List<Object?> get props => [productEntity];
}
