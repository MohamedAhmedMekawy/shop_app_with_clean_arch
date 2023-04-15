import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/core/utils/enum.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class ChangePasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: BlocConsumer<HomeBloc, ShopState>(listener: (context, state) {
        if (state.changePasswordState == RequestState.loaded) {
          if (state.changePassword!.status) {
            currentPassController.clear();
            newPassController.clear();
            confirmPassController.clear();
            showToast(
                text: state.changePassword!.message, state: ToastState.SUCCESS);
          }
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(AppIcons.back),
            ),
          ),
          body: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!
                            .translate('changePass')!),
                        const SizedBox(height: 30),
                        defaultFormField(
                          controller: currentPassController,
                          type: TextInputType.visiblePassword,
                          borderRadius: 20,
                          text: AppLocalizations.of(context)!
                              .translate('currentPass')!,
                          validate: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .translate('pleaseEnterCurrentPass')!;
                            }
                          },
                          borderWidth: .8,
                          prefix: AppIcons.lock,
                        ),
                        const SizedBox(height: 16),
                        defaultFormField(
                          controller: newPassController,
                          type: TextInputType.visiblePassword,
                          borderRadius: 20,
                          text: AppLocalizations.of(context)!
                              .translate('newPass')!,
                          validate: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .translate('pleaseEnterNewPass')!;
                            }
                            if (value!.length < 8) {
                              return AppLocalizations.of(context)!
                                  .translate('passwordLengthValidator')!;
                            }
                          },
                          borderWidth: .8,
                          prefix: AppIcons.lock,
                        ),
                        const SizedBox(height: 16),
                        defaultFormField(
                          controller: confirmPassController,
                          type: TextInputType.visiblePassword,
                          borderRadius: 20,
                          text: AppLocalizations.of(context)!
                              .translate('confirmPass')!,
                          validate: (value) {
                            if (value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .translate('pleaseEnterConfirmPass')!;
                            }
                            if (value!.length < 8) {
                              return AppLocalizations.of(context)!
                                  .translate('passwordLengthValidator')!;
                            }
                          },
                          borderWidth: .8,
                          prefix: AppIcons.lock,
                        ),
                        const SizedBox(height: 24),
                        defaultMaterialButton(
                            text: AppLocalizations.of(context)!
                                .translate('changePass')!,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                context
                                    .read<HomeBloc>()
                                    .add(ChangePasswordEvent(
                                  currentPassword:
                                  currentPassController.text,
                                  newPassword: newPassController.text,
                                ));
                              }
                            },
                            textColor: Colors.white,
                            isUppercase: false,
                            background: AppColor.elevatedButtonColor,
                            width: double.infinity,
                            height: 40)
                      ]),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
