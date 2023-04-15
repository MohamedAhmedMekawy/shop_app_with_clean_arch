import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/domain/entities/faqs_entities/faqs.dart';

abstract class BaseFaqsRepository{
  Future<Either<Failure, List<FaqsEntities>>> getFaqs();
}