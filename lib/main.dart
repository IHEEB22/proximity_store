import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proximitystore/constant/ConstantWidgets/background_image.dart';
import 'package:proximitystore/constant/ProxColors.dart';

import 'package:proximitystore/proxstoretest.dart';
import 'package:proximitystore/widgets/geolocation_outside_paris.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ProxColors.transparentColor,
    statusBarIconBrightness: ProxColors.statusbarColor,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const SafeArea(child: GeolocationOutsideParis()),
  ));
}
