import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/favorite_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_favorite_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/add_favorite.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/favorite.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/favorite_use_case/add_favorite_use_case.dart';

class FavoriteRepository extends BaseFavoriteRepository{
 final BaseFavoriteDataSource baseFavoriteDataSource;

  FavoriteRepository(this.baseFavoriteDataSource);

 @override
 Future<Either<Failure, ProductItemFavorite>> addFavorite(
     AddOrRemoveFavoriteParameter addOrRemoveFavoriteParameter) async {
   try {
     final result =
     await baseFavoriteDataSource.addFavorite(addOrRemoveFavoriteParameter);
     return Right(result);
   } on ServiceExceptions catch (failure) {
     return Left(ServiceFailure(failure.errorMessageModel.message));
   }
 }
 @override
 Future<Either<Failure, List<Favorite>>> getFavorite() async {
   try {
     final result = await baseFavoriteDataSource.getFavoriteItem();
     return Right(result);
   } on ServiceExceptions catch (failure) {
     return Left(ServiceFailure(failure.errorMessageModel.message));
   }
 }
}