import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  final int? no;
  final String? productId;
  final String? productName;
  final String? productDescription;
  final String? productValue;
  final String? productType;
  final String? productPhoto;

  Products({
    this.no,
    this.productId,
    this.productName,
    this.productDescription,
    this.productValue,
    this.productType,
    this.productPhoto,
  });

  // Map -> Model
  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  // Model -> Map
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
