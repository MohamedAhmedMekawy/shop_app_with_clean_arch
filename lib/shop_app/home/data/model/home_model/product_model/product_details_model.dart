
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product_details.dart';

class ProductDetailsModel extends ProductDetailsEntities {
  const ProductDetailsModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.name,
    required super.description,
    required super.inFavorite,
    required super.inCart,
    required super.images,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json['id'],
        price: json['price'].toDouble(),
        oldPrice: json['old_price'].toDouble(),
        discount: json['discount'].toDouble(),
        name: json['name'],
        description: json['description'],
        inFavorite: json['in_favorites'],
        inCart: json['in_cart'],
        images: List<String>.from(json['images'].map((e) => e)),
      );
}
