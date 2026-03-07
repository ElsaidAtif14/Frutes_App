import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import 'package:frutes_app/features/profile/domain/repos/user_orders_repo.dart';
import 'package:frutes_app/features/profile/presentation/cubit/user_orders_cubit/user_orders_cubit.dart';
import 'package:frutes_app/features/profile/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = 'Ordersview';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserOrdersCubit(getit.get<UserOrdersRepo>()),
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: 'طلباتي ',
          showNotification: false,
        ),
        body: OrdersViewBodyBuilder(),
      ),
    );
  }
}

class OrdersViewBodyBuilder extends StatefulWidget {
  const OrdersViewBodyBuilder({super.key});

  @override
  State<OrdersViewBodyBuilder> createState() => _OrdersViewBodyBuilderState();
}

class _OrdersViewBodyBuilderState extends State<OrdersViewBodyBuilder> {
  @override
  void initState() {
    context.read<UserOrdersCubit>().getUserOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserOrdersCubit, UserOrdersState>(
      builder: (context, state) {
        if (state is UserOrdersSuccess) {
          return OrdersViewBody(
            orders: context.read<UserOrdersCubit>().userOrdersList,
          );
        } else if (state is UserOrdersLoading) {
          return Center(child: CupertinoActivityIndicator());
        } else if (state is UserOrdersFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Center(child: Text('No ordere put yet'));
        }
      },
    );
  }
}
