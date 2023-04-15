import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_home_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product.dart';

class CategoriesDetailsUseCase extends BaseUseCase<List<ProductEntities>, CategoriesDetailsParameters>{
  final BaseHomeRepository baseHomeRepository;

  CategoriesDetailsUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, List<ProductEntities>>> call(CategoriesDetailsParameters parameters) async{
   return await baseHomeRepository.getDetailsCategories(parameters);
  }

}

class CategoriesDetailsParameters extends Equatable{
  final int id;

  const CategoriesDetailsParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}