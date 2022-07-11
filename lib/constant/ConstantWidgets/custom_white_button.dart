import 'package:flutter/material.dart';
import 'package:proximitystore/constant/ProxColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWhiteButton extends StatefulWidget {
  final String textInput;
  final Function() onPressed;

  const CustomWhiteButton({
    Key? key,
    required this.textInput,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomWhiteButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomWhiteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      child: OutlinedButton(
        child: Text(
          widget.textInput,
          style: TextStyle(
            color: ProxColors.deepblue,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2,
            color: ProxColors.darkblue,
          ),
          backgroundColor: ProxColors.whiteColor,
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
