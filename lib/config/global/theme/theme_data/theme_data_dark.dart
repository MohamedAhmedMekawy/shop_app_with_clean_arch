import 'package:flutter/material.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color_dark.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_size.dart';

ThemeData getThemeDataDark() => ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      titleTextStyle: const TextStyle(
        color: AppColorDark.textAppBar,
        fontFamily: 'Jannah',
      ),
      backgroundColor: AppColorDark.appBarColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColorDark.appBarIconColor),
    ),
    iconTheme: const IconThemeData(size: 30, color: Colors.white),
    cardTheme: CardTheme(
        color: Colors.grey[700],
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    textTheme: TextTheme(
      bodySmall: const TextStyle(
        fontSize: 14,
        fontFamily: 'Jannah',
        color: AppColorDark.bodyText,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        color: AppColorDark.bodyText,
        fontWeight: FontWeight.bold,
        fontFamily: 'Jannah',
      ),
      bodyLarge: const TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w700,
        color: AppColorDark.bodyText,
        fontFamily: 'Jannah',
      ),
      displayMedium: const TextStyle(
        fontSize: 16,
        fontFamily: 'Jannah',
        fontWeight: FontWeight.w600,
      ),
      displaySmall: const TextStyle(
        color: AppColorDark.bodyText,
        fontFamily: 'Jannah',
        fontSize: 16,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Jannah',
        fontSize: 14,
        color: Colors.grey[600],
        fontWeight: FontWeight.bold,
      ),
      titleSmall: const TextStyle(
        fontFamily: 'Jannah',
        fontSize: 8,
        overflow: TextOverflow.ellipsis,
        color: AppColorDark.bodyText,
        decoration: TextDecoration.lineThrough,
      ),
      labelSmall: const TextStyle(
        fontSize: 12,
        color: AppColorDark.bodyText,
        fontFamily: 'Jannah',
      ),
      labelLarge: const TextStyle(
        fontSize: 24,
        color: AppColorDark.bodyText,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
        fontFamily: 'Jannah',
      ),
      labelMedium: const TextStyle(
        fontSize: 20,
        color: AppColorDark.bodyText,
        fontWeight: FontWeight.bold,
        fontFamily: 'Jannah',
      ),
      titleMedium: TextStyle(
          fontFamily: 'Jannah',
          fontSize: AppSize.bodyTextThemeSize1,
          overflow: TextOverflow.ellipsis,
          color: AppColorDark.bodyText,
          height: 1.1),
      titleLarge: const TextStyle(
        fontSize: 18,
        height: 1.1,
        color: AppColorDark.bodyText,
        fontWeight: FontWeight.bold,
        fontFamily: 'Jannah',
      ),
      headlineSmall: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Jannah',
        color: Colors.blue,
      ),
      headlineLarge: const TextStyle(
        fontSize: 28,
        color: AppColorDark.bodyText,
        fontWeight: FontWeight.bold,
        fontFamily: 'Jannah',
      ),
      headlineMedium: const TextStyle(
        fontSize: 18,
        color: AppColorDark.bodyText,
        fontFamily: 'Jannah',
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStatePropertyAll(20),
            minimumSize: MaterialStatePropertyAll(Size(double.infinity, 40)),
            backgroundColor: MaterialStatePropertyAll(Colors.blue),
            overlayColor:
                MaterialStatePropertyAll(AppColor.elevatedButtonColor),
            textStyle: MaterialStatePropertyAll(TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                fontFamily: 'Jannah',
                color: AppColorDark.bodyText)))),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(TextStyle(
      color: AppColor.textButtonColor,
      fontSize: AppSize.textButtonSize,
      fontWeight: AppSize.textButtonWeight,
      overflow: TextOverflow.ellipsis,
    )))));
