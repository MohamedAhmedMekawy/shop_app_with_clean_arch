import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_profile_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/profile_entities/get_profile.dart';

class GetProfileUseCase extends BaseUseCase<GetProfileEntities, NoParameters>{
  final BaseProfileRepository baseProfileRepository;

  GetProfileUseCase(this.baseProfileRepository);
  @override
  Future<Either<Failure, GetProfileEntities>> call(NoParameters parameters)async {
    return await baseProfileRepository.getProfile();
  }

}

