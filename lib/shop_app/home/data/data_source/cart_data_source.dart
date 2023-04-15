import 'package:shop_app_with_clean_arch/core/api/api_consumer.dart';
import 'package:shop_app_with_clean_arch/core/api/end_point.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/network/error_message_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/cart_model/cart_item_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/cart_model/cart_product_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/cart_model/update.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_product.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/cart_use_case/add_or_remove_cart.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/cart_use_case/update_cart.dart';

abstract class BaseCartDataSource {
  Future<List<CartItemModel>> getCart();
  Future<CartProductEntities> addOrRemoveCart(AddOrRemoveCartParameter parameter);
  Future<UpdateModel> updateCartProducts(
      UpdateCartParameter parameters);
}

class CartDataSource extends BaseCartDataSource {
  final ApiConsumer apiConsumer;

  CartDataSource(this.apiConsumer);

  @override
  Future<List<CartItemModel>> getCart() async {
    final response = await apiConsumer.get(EndPoints.cart);
    if (response['status']) {
      return List<CartItemModel>.from((response['data']['cart_items']as List).map((e) => CartItemModel.fromJson(e)));
    } else {
      throw ServiceExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }

  @override
  Future<CartProductEntities> addOrRemoveCart(AddOrRemoveCartParameter parameter) async {
    final response = await apiConsumer.post(
      EndPoints.cart,
        body: {'product_id': parameter.id});
    if (response['status']) {
      return CartProductModel.fromJson(response['data']);
    }
    else {
      throw ServiceExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }

  @override
  Future<UpdateModel> updateCartProducts(UpdateCartParameter parameters) async{
    final response = await apiConsumer.put(
        EndPoints.updateCartProductsPath(parameters.cartId),
        body: {'quantity': parameters.quantity});
    if (response['status']) {
      return UpdateModel.fromJson(response['data']);
    }else
    {
      throw ServiceExceptions(errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }


}