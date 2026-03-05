import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/helper/get_user.dart';
import 'package:frutes_app/core/repos/orders_repo/orders_repo.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import 'package:frutes_app/features/checkout/domain/entites/order_entity.dart';
import 'package:frutes_app/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:frutes_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:frutes_app/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:frutes_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:frutes_app/features/home/doamin/entites/cart_entity/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const routeName = 'checkoutView';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(
      uID: getUser().uId,
      cartEntity: widget.cartEntity,
      shippingAddressEntity: ShippingAddressEntity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getit.get<OrdersRepo>()),
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: 'الشحن',
          showNotification: false,
        ),
        body: Provider.value(
          value: orderEntity,
          child: AddOrderCubitBlocBuilder(child: const CheckoutViewBody()),
        ),
      ),
    );
  }
}
