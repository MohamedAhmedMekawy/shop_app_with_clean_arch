import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_size.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/controller/register_cubit.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/controller/register_state.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/screens/auth_screen/login.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/screens/button_nav_bar.dart';

class RegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<RegisterCubit>(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.register.status) {
              customSnakeBar(
                  context: context,
                  widget: Text(state.register.message),
                  backgroundColor: AppColor.snackBarSuccess);
              navigateTo(
                  context,
                  const BottomNavScreen(
                    currentIndex: null,
                  ));
            } else {
              customSnakeBar(
                  context: context,
                  widget: Text(state.register.message),
                  backgroundColor: AppColor.snackBarFailed);
            }
          }
        }, builder: (context, state) {
          final cubit = RegisterCubit.get(context);
          return Scaffold(
              body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.translate('signUp')!,
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                            borderRadius: AppSize.borderRadiusFormField,
                            borderWidth: AppSize.borderWidthFormField,
                            controller: nameController,
                            type: TextInputType.name,
                            validate: (value) {
                              if (value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .translate('enterName')!;
                              }
                            },
                            prefix: AppIcons.name,
                            text: AppLocalizations.of(context)!
                                .translate('name')!),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            borderRadius: AppSize.borderRadiusFormField,
                            borderWidth: AppSize.borderWidthFormField,
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .translate('enterEmail')!;
                              }
                            },
                            prefix: AppIcons.email,
                            text: AppLocalizations.of(context)!
                                .translate('email')!),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          borderRadius: AppSize.borderRadiusFormField,
                          borderWidth: AppSize.borderWidthFormField,
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .translate('enterPassword')!;
                            }
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
                          height: 20,
                        ),
                        defaultFormField(
                            borderRadius: AppSize.borderRadiusFormField,
                            borderWidth: AppSize.borderWidthFormField,
                            controller: phoneController,
                            type: TextInputType.phone,
                            validate: (value) {
                              if (value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .translate('enterPhone')!;
                              }
                            },
                            prefix: AppIcons.phone,
                            text: AppLocalizations.of(context)!
                                .translate('phone')!),
                        const SizedBox(
                          height: 28,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => ElevatedButton(
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: Text(
                              AppLocalizations.of(context)!
                                  .translate('signUp')!,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).signUp(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text);
                              }
                            },
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .translate('haveAccount')!,
                              ),
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(context, LoginScreen());
                              },
                              text: AppLocalizations.of(context)!
                                  .translate('login')!,
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
          ));
        }));
  }
}
