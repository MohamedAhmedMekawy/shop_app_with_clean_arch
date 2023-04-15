import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_profile_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/change_password.dart';

class ChangePasswordUseCase extends BaseUseCase<ChangePassword, ChangePasswordParameter >{
  final BaseProfileRepository baseProfileRepository;

  ChangePasswordUseCase(this.baseProfileRepository);

  @override
  Future<Either<Failure, ChangePassword>> call(ChangePasswordParameter parameters) async{
    return await baseProfileRepository.changePassword(parameters);
  }

}
class ChangePasswordParameter extends Equatable {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordParameter({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [currentPassword, newPassword];
}