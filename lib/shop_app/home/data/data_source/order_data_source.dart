import 'package:shop_app_with_clean_arch/core/api/api_consumer.dart';
import 'package:shop_app_with_clean_arch/core/api/end_point.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/network/error_message_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/order_model/add_or_remove_order_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/order_model/cancel_order_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/order_model/get_order_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/order_use_case/add_or_cancel_order.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/order_use_case/cancel_order_use_case.dart';

abstract class BaseOrderDataSource{
  Future<AddOrRemoveOrderModel> addOrRemoveOrder(AddOrRemoveOrderUseCaseParameters parameters);
  Future<CancelOrderModel> cancelOrder(CancelOrderParameter parameters);
  Future<List<GetOrderModel>> getOrder();
}

class OrderDataSource extends BaseOrderDataSource{
  final ApiConsumer apiConsumer;

  OrderDataSource(this.apiConsumer);
  @override
  Future<AddOrRemoveOrderModel> addOrRemoveOrder(AddOrRemoveOrderUseCaseParameters parameters) async {
    final response = await apiConsumer.post(
      EndPoints.order,
      body: {
        'address_id': parameters.addressId,
        'payment_method': 1,
        'use_points': false,
      },
    );
    if (response['status']) {
      return AddOrRemoveOrderModel.fromJson(response);
    } else {
      throw ServiceExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }

  @override
  Future<List<GetOrderModel>> getOrder() async{
    final response = await apiConsumer.get(
      EndPoints.order
    );
    if(response['status']){
      return List<GetOrderModel>.from((response['data']['data']as List).map((e) => GetOrderModel.fromJson(e)));
    } else{
      throw ServiceExceptions(errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }

  @override
  Future<CancelOrderModel> cancelOrder(CancelOrderParameter parameters)async {
    final response = await apiConsumer.get(
      EndPoints.cancelOrder(parameters.orderId)
    );
    if(response['status']){
      return CancelOrderModel.fromJson(response);
    }else{
      throw ServiceExceptions(errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }
}