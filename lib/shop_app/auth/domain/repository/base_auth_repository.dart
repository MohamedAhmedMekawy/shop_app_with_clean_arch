

import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/entities/auth.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/use_case/login_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/use_case/register_use_case.dart';

abstract class BaseAuthRepository{
  Future<Either<Failure, Auth>> login(LoginParameter parameter);
  Future<Either<Failure, Auth>> register(RegisterParameter parameter);
}