import 'package:flutter/material.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/colors.style.dart';

class AppThemeData {
  static final light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundLIGHT,
    primarySwatch: AppColors.primarySwatch,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      color: AppColors.backgroundLIGHT,
      iconTheme: IconThemeData(color: AppColors.black),
      centerTitle: false,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColors.black,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      ),
    ),
    textTheme: textTheme(dark: AppColors.black, light: AppColors.grey),
    chipTheme: const ChipThemeData(
      backgroundColor: AppColors.backgroundLIGHT,
      disabledColor: AppColors.backgroundGREY,
    ),
    listTileTheme: const ListTileThemeData(textColor: AppColors.black),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.backgroundLIGHT,
      shape: RoundedRectangleBorder(borderRadius: topOnly16),
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundDARK,
    primarySwatch: AppColors.primarySwatch,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      color: AppColors.backgroundDARK,
      iconTheme: IconThemeData(color: AppColors.white),
      centerTitle: false,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      ),
    ),
    textTheme: textTheme(dark: AppColors.white, light: AppColors.grey300),
    chipTheme: const ChipThemeData(
      backgroundColor: AppColors.backgroundDARK,
      disabledColor: AppColors.backgroundDARK,
    ),
    listTileTheme: const ListTileThemeData(textColor: AppColors.white),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll<Color>(AppColors.grey300),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.backgroundDARK,
      shape: RoundedRectangleBorder(borderRadius: topOnly16),
    ),
  );

  static TextTheme textTheme({Color? dark, Color? light}) {
    return TextTheme(
      displaySmall: TextStyle(color: dark, fontSize: 24),
      headlineSmall: TextStyle(color: dark, fontSize: 20),
      //
      titleLarge: TextStyle(color: dark),
      titleMedium: TextStyle(color: dark, fontSize: 14),
      titleSmall: TextStyle(color: light),
      //
      bodyLarge: TextStyle(color: dark),
      bodyMedium: TextStyle(color: dark),
      bodySmall: TextStyle(color: light, fontSize: 10),
      //
      labelLarge: TextStyle(color: dark),
      labelMedium: TextStyle(color: light),
      labelSmall: TextStyle(color: light),
    );
  }
}
