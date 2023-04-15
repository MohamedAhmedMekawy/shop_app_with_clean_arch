
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/favorite_model/add_favorite_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/favorite.dart';

class GetFavoriteModel extends Favorite
{
  const GetFavoriteModel({
    required super.id,
    required super.productItemFavorite,

  });

  factory GetFavoriteModel.fromJson(Map<String, dynamic> json) =>
      GetFavoriteModel(
        id: json['id'],
        productItemFavorite: json['product'] != null ? ProductItemFavoriteModel.fromJson(json['product']) : null,

      );
}
