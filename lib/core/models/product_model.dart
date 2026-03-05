import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/core/helper/get_avg_rating.dart';
import 'package:frutes_app/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final String code;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final num sellingCount;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews; // ✅ Model مش Entity

  ProductModel({
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
    this.isOrganic = false,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.avgRating,
    this.ratingCount = 0,
    required this.reviews,
    required this.sellingCount,
  });

  /// from JSON (Firestore)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      description: json['description'],
      code: json['code'],
      price: json['price'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationsMonths: json['expirationsMonths'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      isOrganic: json['isOrganic'],
      avgRating: getAvgRating(
        json['reviews'] != null
            ? List<ReviewModel>.from(
                json['reviews'].map((e) => ReviewModel.fromJson(e)),
              )
            : [],
      ),
      ratingCount: json['ratingCount'],
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
      sellingCount: json['sellingCount'],
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      description: description,
      code: code,
      price: price,
      imageUrl: imageUrl,
      isOrganic: isOrganic,
      isFeatured: isFeatured,
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  /// to JSON (Firestore)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'code': code,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
