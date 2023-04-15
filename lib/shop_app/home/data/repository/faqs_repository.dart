import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/data/data_source/faqs_data_source.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/base_repository/base_faqs_repository.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/faqs_entities/faqs.dart';

class FaqsRepository extends BaseFaqsRepository {
  final BaseFaqsDataSource baseFaqsDataSource;

  FaqsRepository(this.baseFaqsDataSource);

  @override
  Future<Either<Failure, List<FaqsEntities>>> getFaqs() async {
    try {
      final result = await baseFaqsDataSource.getFaqs();
      return Right(result);
    } on ServiceExceptions catch (failure) {
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }
}
