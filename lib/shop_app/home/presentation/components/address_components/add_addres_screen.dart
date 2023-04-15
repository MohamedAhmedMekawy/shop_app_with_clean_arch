import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/screens/button_nav_bar.dart';

class AddAddressScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  final bool? editAddress;
  final int? addressId;
  final String? name;
  final String? city;
  final String? region;
  final String? details;
  final String? notes;

  AddAddressScreen({
    Key? key,
    this.editAddress = false,
    this.addressId,
    this.name,
    this.city,
    this.region,
    this.details,
    this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: BlocConsumer<HomeBloc, ShopState>(listener: (context, state) {
        if (state.addAddressState == RequestState.loaded) {
          customSnakeBar(
              context: context,
              widget: Text(state.addAddress?.message ?? ''),
              backgroundColor: AppColor.snackBarSuccess);
          navigateAndFinish(
              context,
              const BottomNavScreen(
                currentIndex: null,
              ));
        }

        if (state.updateAddressState == RequestState.loaded) {
          customSnakeBar(
              context: context,
              widget: Text(state.updateAddress?.message ?? ''),
              backgroundColor: AppColor.snackBarSuccess);
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        if (editAddress!) {
          nameController.text = name!;
          cityController.text = city!;
          regionController.text = region!;
          detailsController.text = details!;
          notesController.text = notes!;
        }
        return Scaffold(
            body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                state.getAddressState != RequestState.loading
                    ? const LinearProgressIndicator()
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!
                      .translate('locationInformation')!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customFormField(
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
                          customFormField(
                              controller: cityController,
                              type: TextInputType.text,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .translate('enterCity')!;
                                }
                              },
                              prefix: AppIcons.city,
                              text: AppLocalizations.of(context)!
                                  .translate('city')!),
                          const SizedBox(
                            height: 20,
                          ),
                          customFormField(
                              controller: regionController,
                              type: TextInputType.text,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .translate('enterRegion')!;
                                }
                              },
                              prefix: AppIcons.region,
                              text: AppLocalizations.of(context)!
                                  .translate('region')!),
                          const SizedBox(
                            height: 20,
                          ),
                          customFormField(
                              controller: detailsController,
                              type: TextInputType.text,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .translate('enterDetails')!;
                                }
                              },
                              prefix: AppIcons.details,
                              text: AppLocalizations.of(context)!
                                  .translate('details')!),
                          const SizedBox(
                            height: 20,
                          ),
                          customFormField(
                              controller: notesController,
                              type: TextInputType.text,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return AppLocalizations.of(context)!
                                      .translate('enterNotes')!;
                                }
                              },
                              prefix: AppIcons.note,
                              text: AppLocalizations.of(context)!
                                  .translate('note')!),
                          const SizedBox(
                            height: 28,
                          ),
                          ConditionalBuilder(
                            condition:
                                state.addAddressState != RequestState.error,
                            builder: (context) => defaultMaterialButton(
                                text: AppLocalizations.of(context)!
                                    .translate('addAddress')!,
                                textColor: Colors.white,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    if (editAddress!) {
                                      context
                                          .read<HomeBloc>()
                                          .add(UpDateAddressEvent(
                                            addressId: addressId!,
                                            name: nameController.text,
                                            city: cityController.text,
                                            region: regionController.text,
                                            details: detailsController.text,
                                            notes: notesController.text,
                                          ));
                                    } else {
                                      context.read<HomeBloc>().add(
                                            AddAddressEvent(
                                              name: nameController.text,
                                              city: cityController.text,
                                              region: regionController.text,
                                              details: detailsController.text,
                                              notes: notesController.text,
                                            ),
                                          );
                                    }
                                  }
                                },
                                width: double.infinity,
                                height: 40),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
      }),
    );
  }
}
