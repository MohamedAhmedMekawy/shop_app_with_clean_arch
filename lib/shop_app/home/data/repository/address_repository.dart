import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/add_address_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_address_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_data_entities.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_entities.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/add_address_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/delete_address.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/update_address.dart';


class AddressRepository extends BaseAddressRepository{
  final BaseAddAddressDataSource baseAddAddressDataSource;

  AddressRepository(this.baseAddAddressDataSource);
  @override
  Future<Either<Failure, AddAddressEntities>> addAddress(AddAddressParameter parameter) async {
    try {
      final result = await baseAddAddressDataSource.addAddress(parameter);
      return Right(result);
    }on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<AddAddressEntitiesData>>> getAddress() async{
    try{
      final result = await baseAddAddressDataSource.getAddress();
      return Right(result);
    }on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, AddAddressEntities>> updateAddress(UpDateAddressParameter parameter)async {
    try{
      final result = await baseAddAddressDataSource.updateAddress(parameter);
      return Right(result);
    } on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, AddAddressEntities>> deleteAddress(DeleteAddressParameter parameter)async {
    try{
      final result = await baseAddAddressDataSource.deleteAddress(parameter);
      return Right(result);
    } on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

}