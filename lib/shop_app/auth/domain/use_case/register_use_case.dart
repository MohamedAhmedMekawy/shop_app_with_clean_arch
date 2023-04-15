import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/entities/auth.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/repository/base_auth_repository.dart';

class RegisterUseCase extends BaseUseCase<Auth, RegisterParameter>{
  final BaseAuthRepository baseAuthRepository;

  RegisterUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, Auth>> call(RegisterParameter parameters) async{
   return await baseAuthRepository.register(parameters);
  }
}
class RegisterParameter extends Equatable {
  final Map<String, dynamic> data;

  const RegisterParameter(this.data);

  @override
  List<Object?> get props => [data];
}