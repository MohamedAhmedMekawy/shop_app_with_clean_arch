import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_address_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_entities.dart';

class AddAddressUseCase
    extends BaseUseCase<AddAddressEntities, AddAddressParameter> {
  final BaseAddressRepository baseAddressRepository;

  AddAddressUseCase(this.baseAddressRepository);

  @override
  Future<Either<Failure, AddAddressEntities>> call(
      AddAddressParameter parameters) async {
    return await baseAddressRepository.addAddress(parameters);
  }
}

class AddAddressParameter extends Equatable {
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;

  const AddAddressParameter({
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
  });

  @override
  List<Object> get props {
    return [
      name,
      city,
      region,
      details,
      notes,
    ];
  }
}
