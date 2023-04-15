import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_data_entities.dart';

abstract class AddAddressEntities extends Equatable{
  final bool? status;
  final String? message;
  final AddAddressEntitiesData? data;

  const AddAddressEntities({required this.data, required this.status, required this.message});

  @override
  List<Object?> get props =>[status,message];
}