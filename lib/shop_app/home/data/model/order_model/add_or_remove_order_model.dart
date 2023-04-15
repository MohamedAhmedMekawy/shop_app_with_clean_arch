
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/order_model/add_order_data_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/order_entities/add_order.dart';

class AddOrRemoveOrderModel extends AddOrderEntities {
  const AddOrRemoveOrderModel({required super.status,
    required super.message,
    required super.addOrderData});

  factory AddOrRemoveOrderModel.fromJson(Map<String, dynamic>json) =>
      AddOrRemoveOrderModel(
          status: json['status'],
        message: json['message'],
        addOrderData: AddOrderDataModel.fromJson(json['data']),
      );
}
