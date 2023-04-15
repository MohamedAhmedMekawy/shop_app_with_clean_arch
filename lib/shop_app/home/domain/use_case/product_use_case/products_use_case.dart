import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_home_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product.dart';

class ProductUseCase extends BaseUseCase<List<ProductEntities>, NoParameters> {
  final BaseHomeRepository baseHomeRepository;

  ProductUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<ProductEntities>>> call(
      NoParameters parameters) async {
    return await baseHomeRepository.getProducts();
  }
}
