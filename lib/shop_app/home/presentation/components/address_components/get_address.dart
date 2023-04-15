import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color_dark.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color_light.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/core/utils/enum.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/address_components/add_addres_screen.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/address_components/empty_address.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';

class GetAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetAddressEvent()),
      child: BlocConsumer<HomeBloc, ShopState>(listener: (context, state) {
        state.deleteAddressState == RequestState.loaded
            ? customSnakeBar(
                context: context,
                widget: Text(state.deleteAddress?.message ?? ''),
                backgroundColor: AppColor.snackBarFailed)
            : Container();
      }, builder: (context, state) {
        return state.getAddressState == RequestState.loading
            ? const Center(child: CircularProgressIndicator()):
        state.getAddress.isEmpty
            ? const EmptyAddress()
            : Scaffold(
                body: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: state.getAddress.length,
                itemBuilder: (context, index) => Card(
                  elevation: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white54
                            : Colors.black54,
                      ),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColorDark.containerColor
                          : AppColorLight.containerColor,
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              AppIcons.location,
                              color: AppColor.defaultColor,
                            ),
                            Text(
                              state.getAddress[index].name,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () {
                                  navigateTo(
                                      context,
                                      AddAddressScreen(
                                        editAddress: true,
                                        addressId: state.getAddress[index].id,
                                        name: state.getAddress[index].name,
                                        details:
                                            state.getAddress[index].details,
                                        city: state.getAddress[index].city,
                                        notes: state.getAddress[index].notes,
                                        region: state.getAddress[index].region,
                                      ));
                                  context
                                      .read<HomeBloc>()
                                      .add(GetAddressEvent());
                                },
                                child: const Icon(AppIcons.edit)),
                            Container(
                              height: 20,
                              width: 1,
                              color: Colors.grey[300],
                            ),
                            TextButton(
                                onPressed: () {
                                  context.read<HomeBloc>().add(
                                      DeleteAddressEvent(
                                          state.getAddress[index].id));
                                  context
                                      .read<HomeBloc>()
                                      .add(GetAddressEvent());
                                },
                                child: const Icon(
                                  AppIcons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .translate('city')!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        AppLocalizations.of(context)!
                                            .translate('region')!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        AppLocalizations.of(context)!
                                            .translate('details')!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        AppLocalizations.of(context)!
                                            .translate('note')!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.getAddress[index].city,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(state.getAddress[index].region),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(state.getAddress[index].details),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(state.getAddress[index].notes),
                                  //
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
      }),
    );
  }
}
