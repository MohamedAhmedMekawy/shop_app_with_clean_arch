import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_home_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/product_entities/product_details.dart';

class ProductDetailsUseCase
    extends BaseUseCase<ProductDetailsEntities, ProductDetailsParameters> {
  final BaseHomeRepository baseHomeRepository;

  ProductDetailsUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, ProductDetailsEntities>> call(
      ProductDetailsParameters parameters) async {
    return await baseHomeRepository.getProductDetails(parameters);
  }
}

class ProductDetailsParameters extends Equatable {
  final int id;

  const ProductDetailsParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
