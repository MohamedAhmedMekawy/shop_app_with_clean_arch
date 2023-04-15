import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/profile_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_profile_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/change_password.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/get_profile.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/sign_out.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/update_profile.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/change_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/sign_out_usecase.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/update_profile_use_case.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseProfileDataSource baseProfileDataSource;

  ProfileRepository(this.baseProfileDataSource);

  @override
  Future<Either<Failure, GetProfileEntities>> getProfile() async {
    try {
      final result = await baseProfileDataSource.getProfile();
      return Right(result);
    } on ServiceExceptions catch (failure) {
      return left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UpDateProfileEntities>> updateProfile(UpDateProfileParameter parameter)async {
    try{
      final result = await baseProfileDataSource.updateProfile(parameter);
      return Right(result);
    }on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ChangePassword>> changePassword(ChangePasswordParameter parameter)async {
    try{
      final result = await baseProfileDataSource.changePassword(parameter);
      return Right(result);
    } on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, SignOut>> singOut(SignOutUseCaseParameters parameters)async {
    try{
      final result = await baseProfileDataSource.signOut(parameters);
      return Right(result);
    }on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }
}
