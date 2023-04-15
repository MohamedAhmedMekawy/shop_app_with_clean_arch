

import 'package:shop_app_with_clean_arch/shop_app/auth/domain/entities/auth.dart';

abstract class LoginState {}

class LoginInitial extends LoginState{}


class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState
{
  final Auth login;

  LoginSuccessState(this.login);
}

class LoginErrorState extends LoginState{
  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordState extends LoginState{}

