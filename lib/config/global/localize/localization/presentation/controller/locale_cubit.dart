import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/domain/use_case/change_lang_use_case.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/domain/use_case/save_lang.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/presentation/controller/locale_state.dart';
import 'package:shop_app_with_clean_arch/core/use_case/base_use_case.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_strings.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;

  LocaleCubit(
      {required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(const ChangeLocaleState(Locale(AppStrings.englishCode)));

  String currentLangCode = AppStrings.englishCode;

  void getSavedLang() async {
    final response = await getSavedLangUseCase.call(const NoParameters());
    response.fold((failure) => debugPrint('cacheFailure'), (value) {
      currentLangCode = value;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    emit(LoadingChangeLocaleState(Locale(langCode)));
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint('cacheFailure'), (value) {
      currentLangCode = langCode;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);

  void toArabic() => _changeLang(AppStrings.arabicCode);
}
