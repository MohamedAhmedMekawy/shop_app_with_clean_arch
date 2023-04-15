import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_strings.dart';
import 'package:shop_app_with_clean_arch/core/utils/cache_helper.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/use_case/register_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/controller/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.signUpUseCase) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(ChangePasswordState());
  }

  RegisterUseCase signUpUseCase;
  dynamic registerCubit;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    final result = await signUpUseCase(RegisterParameter({
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    }));

    result.fold((l) {
      emit(RegisterErrorState(l.message));
    }, (r) {
      registerCubit = r;
      print(registerCubit);
      PreferenceUtils.setString(SharedKeys.token, r.data!.token);
      token = r.data!.token;
      emit(RegisterSuccessState(r));
    });
  }
}
