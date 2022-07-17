import 'package:flutter/material.dart';
import 'package:proximitystore/constant/constant_proprities/app_colors.dart';
import 'package:proximitystore/themes/app_text_theme.dart';

class AppThemes {
  AppThemes._();

  static ThemeData defaultAppTheme = ThemeData(
    primaryColor: AppColors.deepBlueColor,
    appBarTheme: const AppBarTheme(color: Colors.blue),
    bottomAppBarColor: Colors.red,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: const IconThemeData(),
    splashColor: Colors.white,
    textTheme: AppTextTheme.textThemeLight,
    disabledColor: AppColors.inactiveGreyColorLight,
  );
}
