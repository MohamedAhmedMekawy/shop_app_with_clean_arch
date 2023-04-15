import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/add_favorite.dart';

class ProductItemFavoriteModel extends ProductItemFavorite
{
  const ProductItemFavoriteModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
  });

  factory ProductItemFavoriteModel.fromJson(Map<String, dynamic> json) =>
      ProductItemFavoriteModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'] ,
        description: json['description'],
      );
}
