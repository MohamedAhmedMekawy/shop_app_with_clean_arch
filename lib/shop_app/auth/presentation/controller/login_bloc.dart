import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_strings.dart';
import 'package:shop_app_with_clean_arch/core/utils/cache_helper.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/domain/use_case/login_use_case.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/controller/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.signInUseCase) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(ChangePasswordState());
  }

  LoginUseCase signInUseCase;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final result = await signInUseCase(LoginParameter({
      'email': email,
      'password': password,
    }));

    result.fold((l) {
      emit(LoginErrorState(l.message));
    }, (r) {
       r;
      PreferenceUtils.setString(SharedKeys.token, r.data!.token);
      token = r.data!.token;
      emit(LoginSuccessState(r));
    });
  }
}
