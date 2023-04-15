

import 'package:shop_app_with_clean_arch/shop_app/home/data/model/address_moder/get_address_info_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/get_address.dart';

class GetAddressModel extends GetAddress {
   const GetAddressModel({
    required super.status,
    required super.message,
    required super.getAddressInfo,
  });

  factory GetAddressModel.fromJson(Map<String, dynamic> json) {
    return GetAddressModel(
      status: json['status'],
      message: json['message'],
      getAddressInfo: GetAddressInfoModel.fromJson(json['data']),
    );
  }
}
