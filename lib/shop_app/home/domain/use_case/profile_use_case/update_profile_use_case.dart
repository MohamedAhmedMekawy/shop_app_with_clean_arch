import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_profile_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/update_profile.dart';

class UpDateProfileUseCase extends BaseUseCase<UpDateProfileEntities, UpDateProfileParameter>{
  final BaseProfileRepository baseProfileRepository;

  UpDateProfileUseCase(this.baseProfileRepository);
  @override
  Future<Either<Failure, UpDateProfileEntities>> call(UpDateProfileParameter parameters) async{
    return await baseProfileRepository.updateProfile(parameters);
  }

}

class UpDateProfileParameter extends Equatable{
  final String name;
  final String email;
  final String phone;

  const UpDateProfileParameter({required this.name, required this.email, required this.phone});

  @override
  // TODO: implement props
  List<Object?> get props => [name,email,phone];
}