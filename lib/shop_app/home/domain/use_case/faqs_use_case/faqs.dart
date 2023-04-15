import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_faqs_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/faqs_entities/faqs.dart';

class FaqsUseCase extends BaseUseCase<List<FaqsEntities>, NoParameters>{
  final BaseFaqsRepository baseFaqsRepository;

  FaqsUseCase(this.baseFaqsRepository);

  @override
  Future<Either<Failure, List<FaqsEntities>>> call(NoParameters parameters)async {
    return await baseFaqsRepository.getFaqs();

  }


}
class FaqsParameter extends Equatable{
  final int id;

  const FaqsParameter({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}