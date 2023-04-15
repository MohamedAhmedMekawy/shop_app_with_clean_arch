import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/cart_entities/update_cart.dart';

class UpDateCartModel extends UpdateCart {
  const UpDateCartModel({required super.id, required super.quantity});

  factory UpDateCartModel.fromJson(Map<String, dynamic> json) =>
      UpDateCartModel(id: json['id'], quantity: json['quantity']);
}
