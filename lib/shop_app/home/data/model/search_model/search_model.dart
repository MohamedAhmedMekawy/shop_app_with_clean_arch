
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/search_entities/search.dart';

class SearchModel extends SearchEntities {
  const SearchModel(
      {required super.id,
        required super.price,
        required super.image,
        required super.name,
        required super.inCart,
        required super.inFavorite,
        required super.discount,
      });

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      SearchModel(
          id: json['id'],
          price: json['price'].toDouble(),
          image: json['image'],
          discount: json['discount'],
          name: json['name'],
          inFavorite: json['in_favorites'],
          inCart: json['in_cart']);
}

