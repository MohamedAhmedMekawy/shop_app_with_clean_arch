
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/cart_model/update_cart.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/update.dart';

class UpdateModel extends Update {
  const UpdateModel(
      {required super.updateCartData,
      required super.subTotal,
      required super.total});

  factory UpdateModel.fromJson(Map<String, dynamic> json) => UpdateModel(
        updateCartData: UpDateCartModel.fromJson(json['cart']),
        subTotal: json['sub_total'],
        total: json['total'],
      );
}
