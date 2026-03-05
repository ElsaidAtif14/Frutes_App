import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/constants.dart';
import 'package:frutes_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import 'package:frutes_app/core/widgets/search_text_field.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/products_view_header.dart';
import 'package:gap/gap.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RefreshIndicator(
          onRefresh: () {
            return context.read<ProductsCubit>().getProducts();
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Gap(kTopPaddding),
                    customAppBar(
                      context,
                      title: 'المنتجات',
                      showBackButton: false,
                    ),
                    Gap(kTopPaddding),
                    SearchTextField(
                      onChanged: (value) {
                        context.read<ProductsCubit>().searchProducts(value);
                      },
                    ),
                    Gap(12),
                    ProductsViewHeader(
                      productsLength: context
                          .watch<ProductsCubit>()
                          .productsLength,
                    ),
                    Gap(8),
                  ],
                ),
              ),
              ProductsGridViewBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
