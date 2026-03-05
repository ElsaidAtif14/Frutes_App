// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:frutes_app/core/entites/review_entity.dart';

// ignore: must_be_immutable
class ProductEntity extends Equatable {
  final String name;
  final String description;
  final String code;
  final num price;
  final bool isFeatured;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  String? imageUrl;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.description,
    required this.code,
    this.isOrganic = false,
    required this.price,
    required this.isFeatured,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.imageUrl,
    required this.reviews,
  });

  @override
  List<Object?> get props => [code];
}
