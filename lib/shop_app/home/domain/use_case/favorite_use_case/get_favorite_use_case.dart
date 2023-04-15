import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_favorite_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/favorite.dart';

class GetFavoriteUseCase extends BaseUseCase<List<Favorite> , NoParameters>
{
 final BaseFavoriteRepository baseFavoriteRepository;

 GetFavoriteUseCase(this.baseFavoriteRepository);

  @override
  Future<Either<Failure, List<Favorite>>> call(NoParameters parameters) async
  {
    return await baseFavoriteRepository.getFavorite();
  }

}


