import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/config/colors/app_colors.dart';

var textInputDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: AppColors.blueGreyColor,
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
  ),
  fillColor: Colors.transparent,
  filled: true,
  errorStyle: TextStyle(
    color: AppColors.pinkColor,
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
  ),
  contentPadding: EdgeInsets.all(13.5.sm),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.sm),
    ),
    borderSide: BorderSide(
      color: AppColors.blueGreyColor,
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.deepBlueColor,
      width: 1,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.pinkColor,
      width: 1,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.pinkColor,
      width: 1,
    ),
  ),
);
