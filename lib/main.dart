import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/constant/constant_proprities/app_dimension.dart';
import 'package:proximitystore/constant/constant_proprities/prox_colors.dart';
import 'package:proximitystore/providers/localistaion_controller_provider.dart';
import 'package:proximitystore/providers/sheet_provider.dart';
import 'package:proximitystore/widgets/geolocation_outside_paris.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ProxColors.transparentColor,
    statusBarIconBrightness: ProxColors.statusbarColor,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SheetProvider()),
        ChangeNotifierProvider(create: (_) => LocalistaionControllerprovider()),
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
      designSize: Size(AppDimensions.screenwidht, AppDimensions.screenHeight),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GeolocationOutsideParis(),
      ),
    );
  }
}
