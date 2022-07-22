import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/colors/app_colors.dart';

// ignore: must_be_immutable
class TextInputField extends StatelessWidget {
  final String inputLabel;
  bool? obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final AutovalidateMode autovalidateMode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  Widget? suffixIcon;
  Widget? prefixIcon;
  final String hintText;

  TextInputField({
    Key? key,
    required this.inputLabel,
    this.obscureText,
    required this.keyboardType,
    required this.controller,
    required this.autovalidateMode,
    required this.validator,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.082.sw,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 0.0055.sh,
            ),
            child: Text(
              inputLabel,
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
            ),
          ),
          TextFormField(
            obscureText: obscureText ?? false,
            keyboardType: keyboardType,
            controller: controller,
            autovalidateMode: autovalidateMode,
            validator: validator,
            onChanged: onChanged,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  height: 1.2,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                RegExp(
                    '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
              ),
            ],
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefix: prefixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.blueGreyColor,
                fontFamily: 'Montserrat',
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
              ),
              fillColor: Colors.white,
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
            ),
          )
        ],
      ),
    );
  }
}
