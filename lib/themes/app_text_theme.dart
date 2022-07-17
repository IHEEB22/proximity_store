import 'package:flutter/material.dart';
import 'package:proximitystore/constant/constant_proprities/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static const _fontFamily = 'Poppins';

  //Font weights
  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _semiBold = FontWeight.w600;
  static const FontWeight _bold = FontWeight.w700;
  static const FontWeight _light = FontWeight.w300;

  static const TextTheme textThemeLight = TextTheme(
      headline1: _headline1Light,
      headline2: _headline2Light,
      headline3: _headline3Light,
      headline4: _headline4Light,
      headline5: _headline5Light,
      headline6: _headline6Light,
      subtitle1: _subTitle1Light,
      subtitle2: _subTitle2Light,
      bodyText1: _bodyText1Light,
      bodyText2: _bodyText2Light,
      button: _buttonLight);

  static const TextStyle _headline1Light = TextStyle(
    fontWeight: _bold,
    fontSize: 31,
    height: 1,
    color: AppColors.darkBlueColor,
    fontFamily: _fontFamily,
  );

  static const TextStyle _headline2Light = TextStyle(
    fontWeight: _bold,
    fontSize: 24,
    height: 1,
    color: AppColors.darkBlueColor,
    fontFamily: _fontFamily,
  );

  static const TextStyle _headline3Light = TextStyle(
    fontWeight: _semiBold,
    fontSize: 22,
    height: 1,
    color: AppColors.deepBlueColor,
    fontFamily: _fontFamily,
  );

  static const TextStyle _headline4Light = TextStyle(
    fontWeight: _medium,
    fontSize: 18,
    height: 1,
    color: AppColors.deepBlueColor,
    fontFamily: _fontFamily,
  );

  static const TextStyle _headline5Light = TextStyle(
    fontWeight: _light,
    fontSize: 14,
    height: 1,
    color: AppColors.blueGreyColor,
    fontFamily: _fontFamily,
  );

  static const TextStyle _headline6Light = TextStyle(
    fontWeight: _regular,
    fontSize: 12,
    height: 1,
    color: AppColors.lightPurpleColor,
    fontFamily: _fontFamily,
  );

  static const TextStyle _subTitle1Light = TextStyle(
    fontWeight: _semiBold,
    fontSize: 22,
    height: 1,
    color: AppColors.lightPurpleColor,
    fontFamily: _fontFamily,
  );

  static const TextStyle _subTitle2Light = TextStyle(
    fontWeight: _medium,
    fontSize: 18,
    height: 1,
    color: AppColors.deepBlueColor,
    fontFamily: _fontFamily,
  );

  static const TextStyle _buttonLight = TextStyle(
    fontWeight: _medium,
    fontSize: 14,
    height: 1,
    color: Colors.white,
    fontFamily: _fontFamily,
  );

  static const TextStyle _bodyText1Light = TextStyle(
    fontWeight: _medium,
    fontSize: 18,
    height: 1,
    color: AppColors.darkBlueColor,
    fontFamily: _fontFamily,
  );

  static const TextStyle _bodyText2Light = TextStyle(
    fontWeight: _light,
    fontSize: 16,
    height: 1,
    color: AppColors.darkBlueColor,
    fontFamily: _fontFamily,
  );

  // static final TextTheme textThemeDark = TextTheme(
  //     headline1: _headline1Dark,
  //     headline2: _headline2Dark,
  //     headline3: _headline3Dark,
  //     headline4: _headline4Dark,
  //     headline5: _headline5Dark,
  //     headline6: _headline6Dark,
  //     subtitle1: _subTitle1Dark,
  //     subtitle2: _subTitle2Dark,
  //     bodyText1: _bodyText1Dark,
  //     bodyText2: _bodyText2Dark,
  //     button: _buttonDark);
  // static final TextStyle _headline3Dark = _headline6Light.copyWith(color: AppColors.primayColorDark);

}
