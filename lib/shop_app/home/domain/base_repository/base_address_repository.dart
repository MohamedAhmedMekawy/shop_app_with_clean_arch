import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_data_entities.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/address_entities/add_address_entities.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/add_address_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/delete_address.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/address_use_case/update_address.dart';

abstract class BaseAddressRepository{
  Future<Either<Failure, AddAddressEntities>> addAddress(AddAddressParameter parameter);
  Future<Either<Failure, List<AddAddressEntitiesData>>> getAddress();
  Future<Either<Failure, AddAddressEntities>> updateAddress(UpDateAddressParameter parameter);
  Future<Either<Failure, AddAddressEntities>> deleteAddress(DeleteAddressParameter parameter);
}