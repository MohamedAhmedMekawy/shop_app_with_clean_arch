import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_cart_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_product.dart';

class AddOrRemoveCartUseCase extends BaseUseCase<CartProductEntities, AddOrRemoveCartParameter>{
  final BaseCartRepository baseCartRepository;

  AddOrRemoveCartUseCase(this.baseCartRepository);
  @override
  Future<Either<Failure, CartProductEntities>> call(AddOrRemoveCartParameter parameters)async {
    return await baseCartRepository.addOrRemoveCart(parameters);
  }

}

class AddOrRemoveCartParameter extends Equatable{
  final int id;

  const AddOrRemoveCartParameter({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}