import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/change_password.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/get_profile.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/sign_out.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/update_profile.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/change_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/sign_out_usecase.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/use_case/profile_use_case/update_profile_use_case.dart';

abstract class BaseProfileRepository {
  Future<Either<Failure, GetProfileEntities>> getProfile();

  Future<Either<Failure, UpDateProfileEntities>> updateProfile(
      UpDateProfileParameter parameter);

  Future<Either<Failure, ChangePassword>> changePassword(
      ChangePasswordParameter parameter);

  Future<Either<Failure, SignOut>> singOut(SignOutUseCaseParameters parameters);
}
