import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proximitystore/constant/ConstantWidgets/custom_button.dart';
import 'package:proximitystore/constant/ProxColors.dart';
import 'package:proximitystore/proxstoretest.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ProxColors.transparentColor,
    statusBarIconBrightness: ProxColors.statusbarColor,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: custom_button(
      textInput: 'aaaa',
    ),
  ));
}
