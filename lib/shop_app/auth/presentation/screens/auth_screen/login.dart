import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_size.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/controller/login_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/controller/login_state.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/screens/auth_screen/register.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/screens/button_nav_bar.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.login.status) {
              customSnakeBar(
                  context: context,
                  widget: Text(state.login.message),
                  backgroundColor: AppColor.snackBarSuccess);
              navigateAndFinish(
                  context,
                  const BottomNavScreen(
                    currentIndex: null,
                  ));
            } else {
              customSnakeBar(
                  context: context,
                  widget: Text(state.login.message),
                  backgroundColor: AppColor.snackBarFailed);
            }
          }
        }, builder: (context, state) {
          final cubit = LoginCubit.get(context);
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(AppSize.paddingAllLogin),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.translate('welcome')!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(AppLocalizations.of(context)!.translate('back')!),
                      const SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!
                            .translate('heyGoodToSeeYouAgain')!,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        AppLocalizations.of(context)!.translate('signIn')!,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          borderRadius: AppSize.borderRadiusFormField,
                          borderWidth: AppSize.borderWidthFormField,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .translate('enterEmail');
                            }
                            return null;
                          },
                          prefix: AppIcons.email,
                          text: AppLocalizations.of(context)!
                              .translate('email')!),
                      const SizedBox(
                        height: 8,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        borderRadius: AppSize.borderRadiusFormField,
                        borderWidth: AppSize.borderWidthFormField,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context)!
                                .translate('enterPassword');
                          }
                          return null;
                        },
                        prefix: AppIcons.lock,
                        text: AppLocalizations.of(context)!
                            .translate('password')!,
                        suffix: cubit.suffix,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        isPassword: cubit.isPassword,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.signIn(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          child: Text(AppLocalizations.of(context)!
                              .translate('login')!),
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .translate('donNotHaveAccount')!,
                          ),
                          Expanded(
                            child: defaultTextButton(
                              function: () {
                                navigateTo(context, RegisterScreen());
                              },
                              text: AppLocalizations.of(context)!
                                  .translate('signUp')!,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
        }));
  }
}
