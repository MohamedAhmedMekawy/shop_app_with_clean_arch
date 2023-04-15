import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/data/data_source/lang_locale_data_source.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/domain/repository/base_lang_repository.dart';
import 'package:shop_app_with_clean_arch/core/error/exceptions.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
      await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode);
    } on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }
}