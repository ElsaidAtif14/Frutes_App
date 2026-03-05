import 'package:equatable/equatable.dart';
import 'package:frutes_app/core/entites/product_entity.dart';

class FavoriteItemEntity extends Equatable {
  final ProductEntity productEntity;

  const FavoriteItemEntity({required this.productEntity});

  @override
  List<Object?> get props => [productEntity];
}