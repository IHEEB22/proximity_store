import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/constant/AppDimension.dart';
import 'package:proximitystore/constant/ProxColors.dart';
import 'package:proximitystore/providers/sheet_provider.dart';

import 'package:proximitystore/widgets/geolocation_outside_paris.dart';
import 'package:proximitystore/widgets/home_page_if_geolo_off.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ProxColors.transparentColor,
    statusBarIconBrightness: ProxColors.statusbarColor,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SheetProvider()),
      ],
      child: proximitystore(),
    ),
  );
}

class proximitystore extends StatelessWidget {
  const proximitystore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(AppDimensions.screenHeight, AppDimensions.screenwidht),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GeolocationOutsideParis(),
      ),
    );
  }
}
