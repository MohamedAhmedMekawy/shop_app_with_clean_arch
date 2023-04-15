import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_item.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_product.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/update.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/cart_use_case/add_or_remove_cart.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/cart_use_case/update_cart.dart';

abstract class BaseCartRepository {
  Future<Either<Failure, List<CartItemEntities>>> getCart();

  Future<Either<Failure, CartProductEntities>> addOrRemoveCart(
      AddOrRemoveCartParameter addOrRemoveCartParameter);

  Future<Either<Failure, Update>> upDateCart(
      UpdateCartParameter updateCartParameter);
}
