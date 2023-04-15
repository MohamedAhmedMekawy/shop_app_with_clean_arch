
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/get_address_info.dart';

import 'get_address_data_model.dart';

class GetAddressInfoModel extends GetAddressInfo {
  const GetAddressInfoModel({required super.getAddressData});

  factory GetAddressInfoModel.fromJson(Map<String, dynamic> json) {
    return GetAddressInfoModel(
      getAddressData: List<GetAddressDataModel>.from(
        json['data'].map(
          (address) => GetAddressDataModel.fromJson(address),
        ),
      ),
    );
  }
}
