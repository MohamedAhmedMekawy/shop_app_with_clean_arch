import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/entities/auth.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/repository/base_auth_repository.dart';

class LoginUseCase extends BaseUseCase<Auth, LoginParameter> {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, Auth>> call(LoginParameter parameters) async {
    return await baseAuthRepository.login(parameters);
  }
}

class LoginParameter extends Equatable {
  final Map<String, dynamic> data;

  const LoginParameter(this.data);

  @override
  List<Object?> get props => [data];
}
