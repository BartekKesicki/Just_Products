import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_ui.g.dart';
part 'product_ui.freezed.dart';

@freezed
class ProductUi with _$ProductUi {
  @JsonSerializable(explicitToJson: true)
  const factory ProductUi({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "price") required int price,
    @JsonKey(name: "discountPercentage") required double discountPercentage,
    @JsonKey(name: "rating") required double rating,
    @JsonKey(name: "stock") required int stock,
    @JsonKey(name: "brand") required String brand,
    @JsonKey(name: "category") required String category,
    @JsonKey(name: "thumbnail") required String thumbnail,
    @JsonKey(name: "images") required List<String> images,
  }) = _ProductUi;

  factory ProductUi.fromJson(Map<String, dynamic> json) =>
      _$ProductUiFromJson(json);
}
