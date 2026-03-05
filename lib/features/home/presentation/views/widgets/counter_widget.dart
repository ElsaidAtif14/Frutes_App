import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/features/home/doamin/entites/cart_entity/cart_item_entity.dart';
import 'package:frutes_app/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, required this.product});
  final ProductEntity product;
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late CartItemEntity cartItemEntity;
  @override
  void initState() {
    cartItemEntity = CartItemEntity(productEntity: widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Builder(
          builder: (context) {
            return Row(
              children: [
                _buildCircleIcon(
                  Icons.add,
                  Colors.green,
                  isFill: true,
                  onTap: () {
                    cartItemEntity.increasQuantity();
                    context.read<CartItemCubit>().updateCartItem(cartItemEntity);
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "  ${cartItemEntity.quantity}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildCircleIcon(
                  Icons.remove,
                  Colors.grey,
                  onTap: () {
                    cartItemEntity.decreasQuantity();
                    context.read<CartItemCubit>().updateCartItem(cartItemEntity);
                  },
                ),
              ],
            );
          }
        );
      },
    );
  }

  Widget _buildCircleIcon(
    IconData icon,
    Color color, {
    bool isFill = false,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isFill ? const Color(0xFF1B5E20) : Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isFill ? Colors.white : Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
