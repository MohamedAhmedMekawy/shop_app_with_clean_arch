import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_icons.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/controller/cubit/state.dart';

class BottomNavScreen extends StatelessWidget {
  final int? currentIndex;

  const BottomNavScreen({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (currentIndex != null) {
            cubit.currentIndex = currentIndex!;
          }

          return SafeArea(
            child: Scaffold(
              body: cubit.screen[cubit.currentIndex],
              bottomNavigationBar: BottomNavyBar(
                selectedIndex: cubit.currentIndex,
                animationDuration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                showElevation: true,
                onItemSelected: (int value) {
                  cubit.changeBottom(value);
                },
                items: [
                  BottomNavyBarItem(
                    icon: Icon(
                      AppIcons.home,
                      size: Theme.of(context).iconTheme.size,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.translate('home')!,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    activeColor: AppColor.activeColor,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(
                      AppIcons.favorite,
                      size: Theme.of(context).iconTheme.size,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.translate('favorites')!,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    activeColor: AppColor.activeColor,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(
                      AppIcons.cart,
                      size: Theme.of(context).iconTheme.size,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.translate('cart')!,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    activeColor: AppColor.activeColor,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(
                      AppIcons.setting,
                      size: Theme.of(context).iconTheme.size,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.translate('settings')!,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    activeColor: AppColor.activeColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
