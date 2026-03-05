import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:frutes_app/core/repos/products_repo/products_repo.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getit.get<ProductsRepo>()),
      child: ProductsViewBody(),
    );
  }
}
