import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LocaleState extends Equatable {
  final Locale locale;
  const LocaleState(this.locale);

  @override
  List<Object> get props => [locale];
}

class ChangeLocaleState extends LocaleState {
  const ChangeLocaleState(Locale selectedLocale) : super(selectedLocale);
}
class LoadingChangeLocaleState extends LocaleState{
  const LoadingChangeLocaleState(super.locale);
}