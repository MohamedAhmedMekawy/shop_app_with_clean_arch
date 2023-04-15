
import 'package:shop_app_with_clean_arch/shop_app/home/data/model/address_moder/add_address_data_model.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_entities.dart';

class AddAddressModel extends AddAddressEntities {
  const AddAddressModel(
      {required super.data, required super.status, required super.message});

  factory AddAddressModel.fromJson(Map<String, dynamic> json) =>
      AddAddressModel(
          message: json['message'],
          status: json['status'],
          data:  AddAddressDataModel.fromJson(json['data']));
}
