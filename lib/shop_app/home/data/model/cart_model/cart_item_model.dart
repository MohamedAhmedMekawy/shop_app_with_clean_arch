
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/cart_model/cart_product_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_item.dart';

class CartItemModel extends CartItemEntities {
  const CartItemModel({required super.id,
    required super.quantity,
    required super.cartProductEntities});

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      CartItemModel(
          id: json['id'],
          quantity: json['quantity'],
          cartProductEntities: CartProductModel.fromJson(json['product']),
      );
}
