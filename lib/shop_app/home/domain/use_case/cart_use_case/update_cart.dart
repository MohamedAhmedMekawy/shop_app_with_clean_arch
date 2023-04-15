import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_cart_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/update.dart';

class UpDateCartUseCase extends BaseUseCase<Update, UpdateCartParameter>{
  final BaseCartRepository baseCartRepository;

  UpDateCartUseCase(this.baseCartRepository);
  @override
  Future<Either<Failure, Update>> call(UpdateCartParameter parameters)async {
    return await baseCartRepository.upDateCart(parameters);
  }

}
class UpdateCartParameter extends Equatable{
  final int cartId;
  final int quantity;
  const UpdateCartParameter({required this.cartId,required this.quantity});

  @override
  // TODO: implement props
  List<Object?> get props => [cartId,quantity];

}
