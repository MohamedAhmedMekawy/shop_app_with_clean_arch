import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/domain/repository/base_lang_repository.dart';
import 'package:shop_app_with_clean_arch/core/error/failure.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';

class ChangeLangUseCase implements BaseUseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, bool>> call(String langCode) async =>
      await langRepository.changeLang(langCode: langCode);
}