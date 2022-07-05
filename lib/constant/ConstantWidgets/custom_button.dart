import 'package:flutter/material.dart';
import 'package:proximitystore/constant/ProxColors.dart';

class custom_button extends StatefulWidget {
  final String textInput;
  // final Color borderRadiusColor;

  custom_button({
    required this.textInput,
    // required this.borderRadiusColor,
  });
  @override
  State<custom_button> createState() => _custom_buttonState();
}

class _custom_buttonState extends State<custom_button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 80,
          width: 200,
          child: OutlinedButton(
            child: Text('howwwww',
                // Text(toString(${this.textInput}),
                style: TextStyle(
                  color: Colors.white,
                )),
            style: OutlinedButton.styleFrom(
              backgroundColor: ProxColors.deepblue,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
            ),
            onPressed: () {
              print('Pressed');
            },
          ),
        ),
      ),
    );
  }
}
