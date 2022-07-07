import 'package:flutter/material.dart';
import 'package:proximitystore/constant/ProxColors.dart';

class CustomButton extends StatefulWidget {
  final String textInput;
  final Function() onPressed;

  const CustomButton({
    Key? key,
    required this.textInput,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      child: OutlinedButton(
        child: Text(
          widget.textInput,
          style: TextStyle(
            color: ProxColors.whiteColor,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2,
            color: ProxColors.deepblue,
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
