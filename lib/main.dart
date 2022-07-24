import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/config/colors/app_colors.dart';

import 'package:proximitystore/config/constants/app_dimensions.dart';
import 'package:proximitystore/config/routes/routes.dart';
import 'package:proximitystore/pages/commerce/store_description_page.dart';
import 'package:proximitystore/pages/pages.dart';
import 'package:proximitystore/providers/authentification_provider.dart';
import 'package:proximitystore/providers/localistaion_controller_provider.dart';
import 'package:proximitystore/providers/sheet_provider.dart';
import 'package:proximitystore/themes/app_themes.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.transparentColor,
    statusBarIconBrightness: AppColors.statusbarColor,
  ));
  WidgetsFlutterBinding.ensureInitialized();
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
        ],
        child: App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(AppDimensions.screenwidht, AppDimensions.screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) => MaterialApp(
        onGenerateRoute: AppRoutes.routeController,
        initialRoute: AppRoutes.storeDescriptionPage,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.defaultAppTheme,
        darkTheme: AppThemes.defaultAppTheme,
        themeMode: ThemeMode.light,
        home: StoreDescriptionPage(),
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
