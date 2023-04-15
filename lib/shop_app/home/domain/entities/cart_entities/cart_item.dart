import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/cart_product.dart';

 class CartItemEntities extends Equatable {
  final int id;
  final int quantity;
  final CartProductEntities cartProductEntities;

  const CartItemEntities(
      {required this.id,
      required this.quantity,
      required this.cartProductEntities});

  @override
  List<Object?> get props => [id, quantity, cartProductEntities];
}
