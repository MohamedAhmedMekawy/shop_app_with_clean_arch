
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product.dart';

class ProductModel extends ProductEntities {
  ProductModel(
      {required super.id,
      required super.price,
      required super.oldPrice,
      required super.discount,
      required super.image,
      required super.name,
      required super.inCart,
      required super.inFavorite});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
     ProductModel(
        id: json['id'],
        price: json['price'].toDouble(),
        oldPrice: json['old_price'].toDouble(),
        discount: json['discount'].toDouble(),
        image: json['image'],
        name: json['name'],
        inFavorite: json['in_favorites'],
        inCart: json['in_cart']);
  }

