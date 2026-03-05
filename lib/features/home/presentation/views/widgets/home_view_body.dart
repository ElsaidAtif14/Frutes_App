import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/constants.dart';
import 'package:frutes_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:frutes_app/core/widgets/search_text_field.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellinproducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final appBarBackgroundColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RefreshIndicator(
        onRefresh: () {
          return context.read<ProductsCubit>().getBestSellinproducts();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 0,
              floating: false,
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              backgroundColor: appBarBackgroundColor,
              toolbarHeight: 180,
              flexibleSpace: Column(
                children: [
                  Gap(kTopPaddding),
                  CustomHomeAppBar(),
                  Gap(kTopPaddding),
                  SearchTextField(
                    onChanged: (value) {
                      context.read<ProductsCubit>().searchProducts(value);
                    },
                  ),
                  Gap(12),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  FeaturedList(),
                  Gap(12),
                  BestSellingHeader(),
                  Gap(8),
                ],
              ),
            ),
            ProductsGridViewBlocBuilder(),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}
