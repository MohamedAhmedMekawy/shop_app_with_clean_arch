import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_address_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_data_entities.dart';

class GetAddressUseCase extends BaseUseCase<List<AddAddressEntitiesData>, NoParameters>{
  final BaseAddressRepository baseAddressRepository;

  GetAddressUseCase(this.baseAddressRepository);
  @override
  Future<Either<Failure, List<AddAddressEntitiesData>>> call(NoParameters parameters) async {
    return baseAddressRepository.getAddress();
  }

}