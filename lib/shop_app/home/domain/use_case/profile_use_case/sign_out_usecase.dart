import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_profile_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/sign_out.dart';

class SignOutUseCase extends BaseUseCase<SignOut, SignOutUseCaseParameters> {
  final BaseProfileRepository repository;

  SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, SignOut>> call(SignOutUseCaseParameters parameters) async {
    return await repository.singOut(parameters);
  }


}

class SignOutUseCaseParameters extends Equatable {
  final String token;
  const SignOutUseCaseParameters({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
