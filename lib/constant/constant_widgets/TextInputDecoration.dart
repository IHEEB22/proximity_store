import 'package:flutter/material.dart';
import 'package:proximitystore/constant/constant_proprities/prox_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var textInputDecoration = InputDecoration(
  hintStyle: TextStyle(
    color: ProxColors.bluegrey,
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
  ),
  fillColor: Colors.transparent,
  filled: true,
  errorStyle: TextStyle(
    color: ProxColors.pink,
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
  ),
  contentPadding: EdgeInsets.only(
    top: 15.h,
    bottom: 15.h,
    left: 17.w,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ProxColors.bluegrey,
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ProxColors.deepblue,
      width: 1,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ProxColors.pink,
      width: 1,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ProxColors.pink,
      width: 1,
    ),
  ),
);
