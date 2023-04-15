import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/add_favorite.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/favorite.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/favorite_use_case/add_favorite_use_case.dart';

abstract class BaseFavoriteRepository {
  Future<Either<Failure, List<Favorite>>> getFavorite();

  Future<Either<Failure, ProductItemFavorite>> addFavorite(
      AddOrRemoveFavoriteParameter addOrRemoveFavoriteParameter);
}
