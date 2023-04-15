import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class GetProfileScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
   GetProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetProfileEvent()),
      child: BlocBuilder<HomeBloc, ShopState>(
        builder: (context, state) {
          nameController.text = state.getProfile?.name??'';
          emailController.text = state.getProfile?.email??'';
          phoneController.text = state.getProfile?.phone??'';
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_outlined),
              ),
            ),
            body: (state.getProfile == null )? const Center(child: CircularProgressIndicator()) : Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      AppLocalizations.of(context)!.translate('informationUser')!, style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      defaultFormField(
                        controller: nameController,
                        text:  AppLocalizations.of(context)!.translate('personName')!,
                        type: TextInputType.text,
                        prefix: AppIcons.name,
                        borderRadius: 20,
                        validate: (value) {
                          if (value.isEmpty) {
                            return  AppLocalizations.of(context)!.translate('enterName')!;
                          }
                        },
                        borderWidth: .6,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      defaultFormField(
                        controller: emailController,
                        text:  AppLocalizations.of(context)!.translate('personEmail')!,
                        type: TextInputType.text,
                        prefix: AppIcons.email,
                        borderRadius: 20,
                        validate: (value) {
                          if (value.isEmpty) {
                            return  AppLocalizations.of(context)!.translate('enterEmail')!;
                          }
                        },
                        borderWidth: .6,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      defaultFormField(
                        controller: phoneController,
                        text:  AppLocalizations.of(context)!.translate('personPhone')!,
                        type: TextInputType.text,
                        prefix: AppIcons.phone,
                        borderRadius: 20,
                        validate: (value) {
                          if (value.isEmpty) {
                            return  AppLocalizations.of(context)!.translate('enterPhone')!;
                          }
                        },
                        borderWidth: .6,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      defaultMaterialButton(
                        text:  AppLocalizations.of(context)!.translate('updateProfile')!,
                        onPressed: (){
                          context.read<HomeBloc>().add(
                            UpDateProfileEvent(name: nameController.text, email:emailController.text, phone: phoneController.text)
                          );
                        },
                        background: Colors.blue,
                        height: 40,
                        width: double.infinity,
                        isUppercase: false,
                        fontSize: 12,
                        textColor: Colors.white
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
