import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color.dart';
import 'package:shop_app_with_clean_arch/config/global/theme/app_color/app_color_light.dart';
import 'package:shop_app_with_clean_arch/core/utils/app_size.dart';

ThemeData getThemeDataLight() => ThemeData(
      scaffoldBackgroundColor: AppColorLight.scaffoldColor,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: AppColorLight.titleTextColor,
            fontFamily: 'Jannah',
            fontWeight: FontWeight.w800),
        iconTheme: IconThemeData(color: AppColorLight.appBarIconColor),
        elevation: 0,
        backgroundColor: AppColorLight.appBarColor,
      ),
      iconTheme: const IconThemeData(size: 30),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(Colors.blue),
              iconSize: MaterialStatePropertyAll(30))),
      textTheme: TextTheme(
        bodySmall: const TextStyle(
          fontSize: 14,
          color: AppColorLight.bodyTextColor,
          fontFamily: 'Jannah',
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          color: AppColorLight.bodyTextColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Jannah',
        ),
        bodyLarge: const TextStyle(
          fontSize: 40,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w700,
          color: AppColorLight.bodyTextColor,
          fontFamily: 'Jannah',
        ),
        displayMedium: const TextStyle(
          fontFamily: 'Jannah',
          fontSize: 16,
          color: AppColorLight.bodyTextColor,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: const TextStyle(
          fontFamily: 'Jannah',
          color: AppColorLight.bodyTextColor,
          fontSize: 14,
        ),
        displayLarge: TextStyle(
          fontFamily: 'Jannah',
          fontSize: 14,
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
        ),
        titleSmall: const TextStyle(
          fontFamily: 'Jannah',
          fontSize: 8,
          overflow: TextOverflow.ellipsis,
          color: Colors.grey,
          decoration: TextDecoration.lineThrough,
        ),
        labelSmall: const TextStyle(
          fontFamily: 'Jannah',
          fontSize: 12,
          color: AppColorLight.bodyTextColor,
        ),
        labelLarge: const TextStyle(
          fontFamily: 'Jannah',
          fontSize: 24,
          color: AppColorLight.bodyTextColor,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
        labelMedium: const TextStyle(
          fontFamily: 'Jannah',
          fontSize: 20,
          color: AppColorLight.bodyTextColor,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
            fontFamily: 'Jannah',
            fontSize: AppSize.bodyTextThemeSize1,
            overflow: TextOverflow.ellipsis,
            color: AppColorLight.bodyTextColor,
            height: 1.1),
        titleLarge: const TextStyle(
          fontFamily: 'Jannah',
          fontSize: 18,
          color: AppColorLight.bodyTextColor,
          height: 1,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: const TextStyle(
          fontFamily: 'Jannah',
          fontSize: 16,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: const TextStyle(
          fontFamily: 'Jannah',
          fontSize: 28,
          color: AppColorLight.bodyTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: const TextStyle(
          fontFamily: 'Jannah',
          fontSize: 18,
          color: AppColorLight.bodyTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      cardTheme: CardTheme(
          elevation: 8,
          shadowColor: Colors.black45,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStatePropertyAll(20),
              minimumSize: MaterialStatePropertyAll(Size(double.infinity,20)),
              backgroundColor:
                  MaterialStatePropertyAll(AppColor.elevatedButtonColor),
              textStyle: MaterialStatePropertyAll(TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Jannah',
                  color: AppColorLight.bodyTextColor)))),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(TextStyle(
        color: AppColor.textButtonColor,
        fontSize: AppSize.textButtonSize,
        fontWeight: AppSize.textButtonWeight,
        overflow: TextOverflow.ellipsis,
      )))),
    );
