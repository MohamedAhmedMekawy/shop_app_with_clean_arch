

import 'package:shop_app_with_clean_arch/shop_app/auth/domain/entities/auth.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState{}


class RegisterLoadingState extends RegisterState{}

class RegisterSuccessState extends RegisterState
{
  final Auth register;

  RegisterSuccessState(this.register);
}

class RegisterErrorState extends RegisterState{
  final String error;

  RegisterErrorState(this.error);
}

class ChangePasswordState extends RegisterState{}

