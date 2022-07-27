import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomCupertinoDialog extends StatelessWidget {
  bool? istilteStyleItalic;
  final String title;
  final String firstActionText;
  final String secondActionText;
  Color? secondTextColor;
  String? thirdActionText;
  final void Function()? firstOnPresssed;
  final void Function()? secondOnPresssed;
  void Function()? thirdOnPresssed;
  CustomCupertinoDialog({
    Key? key,
    this.istilteStyleItalic,
    required this.title,
    required this.firstActionText,
    required this.secondActionText,
    this.thirdActionText,
    required this.firstOnPresssed,
    required this.secondOnPresssed,
    this.thirdOnPresssed,
    this.secondTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.0394.sh),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoActionSheet(
            title: Text(
              title,
              style: TextStyle(
                fontStyle: (istilteStyleItalic ?? true) ? FontStyle.italic : null,
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: firstOnPresssed,
                child: Text(
                  firstActionText,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                onPressed: secondOnPresssed,
                child: Text(
                  secondActionText,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: secondTextColor,
                  ),
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {},
              isDefaultAction: false,
              child: Padding(
                padding: EdgeInsets.only(top: 0.0098.sh),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel'.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
