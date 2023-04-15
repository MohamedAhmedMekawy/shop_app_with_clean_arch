import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_address_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_entities.dart';

class DeleteAddressUseCase extends BaseUseCase<AddAddressEntities, DeleteAddressParameter>{
  final   BaseAddressRepository baseAddressRepository;

  DeleteAddressUseCase(this.baseAddressRepository);
  @override
  Future<Either<Failure, AddAddressEntities>> call(DeleteAddressParameter parameters)async {
    return await baseAddressRepository.deleteAddress(parameters);
  }

}

class DeleteAddressParameter extends Equatable{
  final int addressId;

  const DeleteAddressParameter(this.addressId);

  @override
  // TODO: implement props
  List<Object?> get props => [addressId];
}