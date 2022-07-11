import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/constant/ProxColors.dart';

class CustomBlueButton extends StatefulWidget {
  final String textInput;
  final Function() onPressed;

  const CustomBlueButton({
    Key? key,
    required this.textInput,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomBlueButton> createState() => _CustomBlueButtonState();
}

class _CustomBlueButtonState extends State<CustomBlueButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      child: OutlinedButton(
        child: Text(
          widget.textInput,
          style: TextStyle(
            color: ProxColors.whiteColor,
            fontFamily: 'Poppins-Medium.ttf',
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2.w,
            color: ProxColors.whiteColor,
          ),
          backgroundColor: ProxColors.deepblue,
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
