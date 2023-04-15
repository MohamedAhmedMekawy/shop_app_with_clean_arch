import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_favorite_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/favorite_entities/add_favorite.dart';

class AddOrRemoveFavoriteUseCase extends BaseUseCase<ProductItemFavorite, AddOrRemoveFavoriteParameter>{
  final BaseFavoriteRepository baseFavoriteRepository;

  AddOrRemoveFavoriteUseCase(this.baseFavoriteRepository);
  @override
  Future<Either<Failure, ProductItemFavorite>> call(AddOrRemoveFavoriteParameter parameters) async{
    return await baseFavoriteRepository.addFavorite(parameters);
  }

}

 class AddOrRemoveFavoriteParameter extends Equatable{

  final int id;

  const AddOrRemoveFavoriteParameter({required this.id});

  @override
  List<Object> get props => [
    id
  ];



}