import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proximitystore/constant/ConstantWidgets/background_image.dart';
import 'package:proximitystore/constant/ProxColors.dart';

import 'package:proximitystore/proxstoretest.dart';
import 'package:proximitystore/widgets/geolocation_outside_paris.dart';
// "create: custom backgroundImage reusable widget && geolocation page && customButton reusable widget" -m "backgroundImage widget contains image which will be used in all screens && geolocation page is a screen where the users gets redirect when he is outside of paris && customButton widget is a button which will be paramatred more to be usable for  different button accros the application (more work to do on custom_button.dart file)"void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ProxColors.transparentColor,
    statusBarIconBrightness: ProxColors.statusbarColor,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const SafeArea(child: GeolocationOutsideParis()),
  ));
}
