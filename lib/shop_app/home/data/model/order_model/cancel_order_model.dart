

import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/cancel_orders.dart';

class CancelOrderModel extends CancelOrder {
  const CancelOrderModel({
    required super.status,
    required super.message,
  });

  factory CancelOrderModel.fromJson(Map<String, dynamic> json) {
    return CancelOrderModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
