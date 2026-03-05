import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:frutes_app/core/repos/products_repo/products_repo.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import 'package:frutes_app/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best-selling';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getit.get<ProductsRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: 'الأكثر مبيعًا'),
        body: const BestSellingViewBody(),
      ),
    );
  }
}
