import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/locale/app_localizations_setup.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/presentation/controller/locale_cubit.dart';
import 'package:shop_app_with_clean_arch/config/global/localize/localization/presentation/controller/locale_state.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/cubit/cubit.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/cubit/state.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/theme_data/theme_data_dark.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/theme_data/theme_data_light.dart';
import 'package:shop_app_with_clean_arch/core/services/service_locator.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_strings.dart';
import 'package:shop_app_with_clean_arch/core/utils/cache_helper.dart';
import 'package:shop_app_with_clean_arch/shop_app/auth/presentation/screens/auth_screen/login.dart';
import 'package:shop_app_with_clean_arch/shop_app/home/presentation/screens/button_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator().init();
  await PreferenceUtils.init();
  await ScreenUtil.ensureScreenSize();
  Widget widget;
  token = PreferenceUtils.getString(SharedKeys.token);
  print(token);
  (token == '')
      ? widget = LoginScreen()
      : widget = const BottomNavScreen(
    currentIndex: null,
  );

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<LocaleCubit>()..getSavedLang(),
        ),
        BlocProvider(
          create: (context) => sl<ThemeCubit>()..saveTheme(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeStates>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          }, builder: (context, state) {
        return BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {
            return ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) {
                  return MaterialApp(
                    locale: state.locale,
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                    localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                    debugShowCheckedModeBanner: false,
                    theme: getThemeDataLight(),
                    darkTheme: getThemeDataDark(),
                    themeMode: ThemeCubit.get(context).isDark
                        ? ThemeMode.dark
                        : ThemeMode.light,
                    home: startWidget,
                  );
                });
          },
        );
      }),
    );
  }
}
