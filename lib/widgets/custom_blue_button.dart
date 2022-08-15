import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomBlueButton extends StatelessWidget {
  final String textInput;
  final void Function()? onPressed;

  const CustomBlueButton({
    Key? key,
    required this.textInput,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.06.sh,
      child: OutlinedButton(
        child: Text(
          textInput.tr(),
          style: TextStyle(
            color: AppColors.whiteColor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2.w,
            color: AppColors.deepBlueColor,
          ),
          backgroundColor: AppColors.deepBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.r),
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
