

import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/add_order_data.dart';

class AddOrderDataModel extends AddOrderData {
  const AddOrderDataModel({
    required super.paymentMethod,
    required super.date,
    required super.cost,
    required super.vat,
    required super.discount,
    required super.total,
    required super.id,
  });

  factory AddOrderDataModel.fromJson(Map<String, dynamic> json) {
    return AddOrderDataModel(
      paymentMethod: json['payment_method'],
      date: json['date'],
      cost: json['cost'],
      vat: json['vat'],
      discount: json['discount'],
      total: json['total'],
      id: json['id'],
    );
  }
}
