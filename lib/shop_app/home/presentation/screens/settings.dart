import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/presentation/controller/locale_cubit.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/cubit/cubit.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_strings.dart';
import 'package:shop_app_with_clean_arch/core/utils/component_in_general.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/screens/auth_screen/login.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/address_components/get_address.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/profile/change_password.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/components/profile/get_profile.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_bloc.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_event.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/bloc/shop_state.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/screens/order_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc, ShopState>(

        builder: (context, state) =>
            Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
                        ThemeCubit.get(context).changeAppTheme();
                      },
                      icon: const Icon(AppIcons.mode),
                    ),
                  ],
                  title: Text(
                    AppLocalizations.of(context)!.translate('setting')!,
                  ),
                  leading: IconButton(
                    onPressed: () {
                      if (AppLocalizations.of(context)!.isEnLocale) {
                        BlocProvider.of<LocaleCubit>(context).toArabic();
                      } else {
                        BlocProvider.of<LocaleCubit>(context).toEnglish();
                      }
                    },
                    icon: const Icon(AppIcons.translate),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      // mm
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Icon(AppIcons.name),
                                Text(
                                  AppLocalizations.of(context)!.translate(
                                      'account')!,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context, GetProfileScreen());
                              },
                              child: Row(
                                children: [

                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('profile')!,
                                  ),
                                  const Spacer(),
                                  Theme(
                                      data: ThemeData(
                                          iconTheme: const IconThemeData(
                                            size: 19,
                                          )
                                      ),
                                      child: Icon(
                                        AppIcons.arrowTo,
                                        color: Theme
                                            .of(context)
                                            .iconTheme
                                            .color,)),
                                ],
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                navigateTo(
                                    context, ChangePasswordScreen());
                              },
                              child: Row(
                                children: [

                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('changePass')!,
                                  ),
                                  const Spacer(),
                                  Theme(
                                      data: ThemeData(
                                          iconTheme: const IconThemeData(
                                              size: 19)),
                                      child: Icon(
                                        AppIcons.arrowTo,
                                        color: Theme
                                            .of(context)
                                            .iconTheme
                                            .color,)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context, GetAddressScreen());
                              },
                              child: Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('address')!,
                                  ),
                                  const Spacer(),
                                  Theme(
                                      data: ThemeData(
                                          iconTheme: const IconThemeData(
                                              size: 19)),
                                      child: Icon(
                                        AppIcons.arrowTo,
                                        color: Theme
                                            .of(context)
                                            .iconTheme
                                            .color,)),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context, const OrderScreen());
                              },
                              child: Row(
                                children: [

                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('order')!,
                                  ),
                                  const Spacer(),
                                  Theme(
                                      data: ThemeData(
                                          iconTheme: const IconThemeData(
                                              size: 19)),
                                      child: Icon(
                                        AppIcons.arrowTo,
                                        color: Theme
                                            .of(context)
                                            .iconTheme
                                            .color,)),
                                ],
                              ),
                            ), const SizedBox(
                              height: 14,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),



                          ]
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          context.read<HomeBloc>().add(
                            SignOutEvent(token: token!)
                          );
                          navigateAndFinish(context, LoginScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(AppIcons.logout),
                            Text(
                              AppLocalizations.of(context)!.translate(
                                  'logout')!,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
      ),
    );
  }
}
