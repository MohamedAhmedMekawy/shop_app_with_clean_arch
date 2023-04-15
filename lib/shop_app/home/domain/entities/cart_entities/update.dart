import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/update_cart.dart';

class Update extends Equatable {
  final UpdateCart updateCartData;
  final dynamic subTotal;
  final dynamic total;
  const Update({
    required this.updateCartData,
    required this.subTotal,
    required this.total,
  });

  @override
  List<Object?> get props => [subTotal, total];
}
