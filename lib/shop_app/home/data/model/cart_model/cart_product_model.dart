import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_product.dart';

class CartProductModel extends CartProductEntities {
  const CartProductModel(
      {required super.id,
      required super.price,
      required super.oldPrice,
      required super.discount,
      required super.image,
      required super.name,
      required super.description,
      required super.inFavorites,
      required super.inCart});

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description'],
        inFavorites: json['in_favorites'],
        inCart: json['in_cart'],
      );
}
