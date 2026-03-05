import 'package:bloc/bloc.dart';
import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/core/repos/products_repo/products_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;
  int productsLength = 0;
  List<ProductEntity> productList = [];
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold((failure) => emit(ProductsFailure(failure.message)), (
      products,
    ) {
      emit(ProductsSuccess(products));
      productList = products;
    });
  }

  Future<void> getBestSellinproducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.bestSellingProducts();
    result.fold((failure) => emit(ProductsFailure(failure.message)), (
      products,
    ) {
      productsLength = products.length;
      emit(ProductsSuccess(products));
      productList = products;
    });
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(ProductsSuccess(productList));
    } else {
      final searchedList = productList
          .where(
            (product) =>
                product.name.toLowerCase().contains(query.toLowerCase()) ||
                product.description.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      productsLength = searchedList.length;
      emit(ProductsSuccess(searchedList));
    }
  }
}
