import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/config/colors/app_colors.dart';

class CustomGreyButton extends StatefulWidget {
  final String textInput;
  final Function()? onPressed;

  const CustomGreyButton({
    Key? key,
    required this.textInput,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomGreyButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomGreyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.06.sh,
      child: OutlinedButton(
        child: Text(
          widget.textInput,
          style: TextStyle(
            color: AppColors.blueGreyColor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        style: OutlinedButton.styleFrom(
          // foregroundColor: AppColors.inactiveGreyColorLight,
          // disabledForegroundColor: AppColors.inactiveGreyColorLight,
          side: BorderSide(
            width: 2,
            color: AppColors.inactiveGreyColorLight,
          ),
          backgroundColor: AppColors.inactiveGreyColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
