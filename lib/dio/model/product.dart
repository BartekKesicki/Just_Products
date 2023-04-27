import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "discountPercentage")
  final double discountPercentage;
  @JsonKey(name: "rating")
  final double rating;
  @JsonKey(name: "stock")
  final int stock;
  @JsonKey(name: "brand")
  final String brand;
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "thumbnail")
  final String thumbnail;
  @JsonKey(name: "images")
  final List<String> images;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
