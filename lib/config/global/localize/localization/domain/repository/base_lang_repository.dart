import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';

abstract class LangRepository {
  Future<Either<Failure, bool>> changeLang({required String langCode});

  Future<Either<Failure, String>> getSavedLang();
}
