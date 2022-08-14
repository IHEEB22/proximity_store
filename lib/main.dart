import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';
import 'package:proximitystore/config/constants/app_dimensions.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/pages/pages.dart';
import 'package:proximitystore/providers/authentification_provider.dart';
import 'package:proximitystore/providers/business_provider.dart';
import 'package:proximitystore/providers/client_provider.dart';
import 'package:proximitystore/providers/localistaion_controller_provider.dart';
import 'package:proximitystore/providers/sheet_provider.dart';
import 'package:proximitystore/themes/app_themes.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.transparentColor,
    statusBarIconBrightness: AppColors.statusbarColor,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'assets/l10',
      supportedLocales: [Locale('en', 'EN'), Locale('fr', 'FR')],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => SheetProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => LocalistaionControllerprovider(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthentificationProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => BusinessProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ClientProvider(),
          ),
        ],
        child: App(),
      ),
    ),
  );
}

Future initialization(BuildContext? context) async {
  await Future.any([
    Future.delayed(
      Duration(seconds: 3),
      //  () {
      //   return CircularProgressIndicator(
      //     color: Colors.black,
      //   );
      // }
    ),
  ]);
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(AppDimensions.screenwidht, AppDimensions.screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) => MaterialApp(
        onGenerateRoute: AppRoutes.routeController,
        initialRoute: AppRoutes.geoLocationOffPage,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.defaultAppTheme,
        darkTheme: AppThemes.defaultAppTheme,
        themeMode: ThemeMode.light,
        home: GeoLocationOffPage(),
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
