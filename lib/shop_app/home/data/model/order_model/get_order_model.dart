import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/get_order_entities.dart';

class GetOrderModel extends GetOrderEntities {
  const GetOrderModel(
      {required super.id,
      required super.total,
      required super.date,
      required super.status});

  factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
      id: json['id'],
      total: json['total'],
      date: json['date'],
      status: json['status']);
}
