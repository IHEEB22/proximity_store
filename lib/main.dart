import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';

import 'package:proximitystore/config/constants/app_dimensions.dart';
import 'package:proximitystore/providers/localistaion_controller_provider.dart';
import 'package:proximitystore/providers/sheet_provider.dart';
import 'package:proximitystore/pages/geolocation/geolocation_outside_paris_page.dart';
import 'package:proximitystore/themes/app_themes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.transparentColor,
    statusBarIconBrightness: AppColors.statusbarColor,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SheetProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocalistaionControllerprovider(),
        ),
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
      designSize: Size(AppDimensions.screenwidht, AppDimensions.screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.defaultAppTheme,
        darkTheme: AppThemes.defaultAppTheme,
        themeMode: ThemeMode.light,
        home: GeolocationOutsideParisPage(),
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
      ),
    );
  }
}
