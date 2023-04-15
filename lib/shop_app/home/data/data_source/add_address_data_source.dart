
import 'package:shop_app_with_clean_arch/core/api/api_consumer.dart';
import 'package:shop_app_with_clean_arch/core/api/end_point.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/network/error_message_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/address_moder/add_address_data_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/address_moder/add_address_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/add_address_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/delete_address.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/update_address.dart';

abstract class BaseAddAddressDataSource {
  Future<AddAddressModel> addAddress(AddAddressParameter parameter);

  Future<List<AddAddressDataModel>> getAddress();

  Future<AddAddressModel> updateAddress(UpDateAddressParameter parameter);

  Future<AddAddressModel> deleteAddress(DeleteAddressParameter parameter);
}

class AddAddressDataSource extends BaseAddAddressDataSource {
  final ApiConsumer apiConsumer;

  AddAddressDataSource(this.apiConsumer);

  @override
  Future<AddAddressModel> addAddress(AddAddressParameter parameter) async {
    final response = await apiConsumer.post(EndPoints.address, body: {
      'name': parameter.name,
      'city': parameter.city,
      'region': parameter.region,
      'details': parameter.details,
      'notes': parameter.notes,
      'latitude': 31.4175,
      'longitude': 31.8144,
    });
    if (response['status']) {
      return AddAddressModel.fromJson(response);
    } else {
      throw ServiceExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }

  @override
  Future<List<AddAddressDataModel>> getAddress() async {
    final response = await apiConsumer.get(EndPoints.address);
    if (response['status']) {
      return List<AddAddressDataModel>.from((response['data']['data'] as List)
          .map((e) => AddAddressDataModel.fromJson(e)));
    } else {
      throw ServiceExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }

  @override
  Future<AddAddressModel> updateAddress(
      UpDateAddressParameter parameter) async {
    final response = await apiConsumer
        .put(EndPoints.updateAddress(parameter.addressId), body: {
      'name': parameter.name,
      'city': parameter.city,
      'region': parameter.region,
      'details': parameter.details,
      'notes': parameter.notes,
      'latitude': 31.4175,
      'longitude': 31.8144,
    });
    if (response['status']) {
      return AddAddressModel.fromJson(response);
    } else {
      throw ServiceExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response));
    }
  }

  @override
  Future<AddAddressModel> deleteAddress(DeleteAddressParameter parameter)async {
    final response = await apiConsumer.delete(
      EndPoints.deleteAddress(parameter.addressId)
    );
    if (response['status']) {
      return AddAddressModel.fromJson(response);
    } else {
      throw ServiceExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response));
    }

  }
}
