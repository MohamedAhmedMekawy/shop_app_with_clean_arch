import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_cart_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_item.dart';

class GetCartUseCase extends BaseUseCase<List<CartItemEntities> ,NoParameters>{
  final BaseCartRepository baseCartRepository;

  GetCartUseCase(this.baseCartRepository);
  @override
  Future<Either<Failure, List<CartItemEntities>>> call(NoParameters parameters) async {
     return await baseCartRepository.getCart();
  }

}
