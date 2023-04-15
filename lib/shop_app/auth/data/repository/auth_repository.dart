

import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/data/data_source/auth_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/entities/auth.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/repository/base_auth_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/use_case/login_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/use_case/register_use_case.dart';

class AuthRepository extends BaseAuthRepository{
  final BaseAuthDataSource baseAuthDataSource;
  AuthRepository(this.baseAuthDataSource);
  @override
  Future<Either<Failure, Auth>> login(LoginParameter parameter) async{
   final result = await baseAuthDataSource.getLogin(parameter);
   try{
     return Right(result);
   } on ServiceExceptions catch(failure){
     return Left(ServiceFailure(failure.errorMessageModel.message));
   }
  }

  @override
  Future<Either<Failure, Auth>> register(RegisterParameter parameter) async{
    final result = await baseAuthDataSource.getRegister(parameter);
    try{
      return Right(result);
    }on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }
}