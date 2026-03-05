import 'package:frutes_app/core/entites/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String comment;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.comment,
  });

  /// from Entity
  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      rating: entity.rating,
      date: entity.date,
      comment: entity.comment,
    );
  }

  /// from JSON (Firestore / API)
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      rating: json['rating'] ?? 0,
      date: json['date'] ?? '',
      comment: json['comment'] ?? '',
    );
  }
  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      rating: rating,
      date: date,
      comment: comment,
    );
  }

  /// to JSON (Firestore / API)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'date': date,
      'comment': comment,
    };
  }
}
