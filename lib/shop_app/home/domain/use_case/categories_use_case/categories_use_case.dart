import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_home_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/categories_entities/categories.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product.dart';

class CategoriesUseCase extends BaseUseCase<List<CategoriesEntities>, NoParameters>{
  final BaseHomeRepository baseHomeRepository;

  CategoriesUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, List<CategoriesEntities>>> call(NoParameters parameters) async {
    return await baseHomeRepository.getCategories();
  }
  
}