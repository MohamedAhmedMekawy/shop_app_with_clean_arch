import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_data_entities.dart';

class AddAddressDataModel extends AddAddressEntitiesData {
  const AddAddressDataModel(
      {required super.name,
      required super.city,
      required super.region,
      required super.details,
      required super.notes,
      required super.id});

  factory AddAddressDataModel.fromJson(Map<String, dynamic> json) {
    return AddAddressDataModel(
      name: json['name'],
      city: json['city'],
      region: json['region'],
      details: json['details'],
      notes: json['notes'],
      id: json['id'],);
  }

}
