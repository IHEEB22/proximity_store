import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proximitystore/config/colors/app_colors.dart';

// ignore: must_be_immutable
class CustomWhiteButton extends StatefulWidget {
  final String textInput;
  final Function() onPressed;
  Widget? leading;

  CustomWhiteButton({
    Key? key,
    this.leading,
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
      height: 0.06.sh,
      child: OutlinedButton(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 0.048,
              ),
              child: SizedBox(
                height: 0.0295.sh,
                width: 0.064.sw,
                child: widget.leading ?? SizedBox.shrink(),
              ),
            ),
            0.143.sw.horizontalSpace,
            Text(
              widget.textInput,
              style: TextStyle(
                color: AppColors.deepBlueColor,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2,
            color: AppColors.darkBlueColor,
          ),
          backgroundColor: AppColors.whiteColor,
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
