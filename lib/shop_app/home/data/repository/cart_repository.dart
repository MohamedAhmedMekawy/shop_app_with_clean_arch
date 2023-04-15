

import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/cart_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_cart_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_item.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_product.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/update.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/cart_use_case/add_or_remove_cart.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/cart_use_case/update_cart.dart';

class CartRepository extends BaseCartRepository {
  final BaseCartDataSource baseCartDataSource;

  CartRepository(this.baseCartDataSource);

  @override
  Future<Either<Failure, List<CartItemEntities>>> getCart() async{
    try {
      final result = await baseCartDataSource.getCart();
      return Right(result);
    } on ServiceExceptions catch (failure) {
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, CartProductEntities>> addOrRemoveCart(AddOrRemoveCartParameter addOrRemoveCartParameter)async {
    try{
   final result = await baseCartDataSource.addOrRemoveCart(addOrRemoveCartParameter);
   return Right(result);
  } on ServiceExceptions catch(failure){
     return Left(ServiceFailure(failure.errorMessageModel.message)) ;
    }

  }

  @override
  Future<Either<Failure, Update>> upDateCart(UpdateCartParameter updateCartParameter) async{
    try
    {
      final result = await baseCartDataSource.updateCartProducts(updateCartParameter);
      print(result);
      print(result.total);
      return Right(result);
    }on ServiceExceptions catch(failure)
    {
      print('errrrrrrorrrrrrrrrrr');
      return Left(ServiceFailure(failure.errorMessageModel.message));

    }
  }






}
