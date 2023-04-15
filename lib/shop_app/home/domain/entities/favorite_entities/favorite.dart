import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/add_favorite.dart';

class Favorite extends Equatable {
  final int id;
  final ProductItemFavorite? productItemFavorite;


  const Favorite({
    required this.id,
    required this.productItemFavorite,

  });

  @override
  List<Object?> get props =>
      [
        id,
        productItemFavorite,
      ];
}
