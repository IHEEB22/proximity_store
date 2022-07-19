import 'package:flutter/material.dart';
import 'package:proximitystore/pages/authentification/login_page.dart';
import 'package:proximitystore/pages/authentification/welcome_page.dart';
import 'package:proximitystore/pages/pages.dart';

class AppRoutes {
  static const String geoLocationOffPage = '/geoLocationOffPage';
  static const String addLocalisationAddressPage = '/addLocalisationAddressPage';
  static const String geoLocationOutsideParisPage = '/geoLocationOutsideParisPage';
  static const String searchProductPage = '/searchProductPage';
  static const String loginPage = '/loginPage';
  static const String welcomePage = '/welcomePage';

  static Route<dynamic> routeController(RouteSettings settings) {
    switch (settings.name) {
      case geoLocationOffPage:
        return MaterialPageRoute(builder: (BuildContext context) => GeoLocationOffPage());
      case addLocalisationAddressPage:
        return MaterialPageRoute(builder: (BuildContext context) => AddLocalisationAddressPage());
      case geoLocationOutsideParisPage:
        return MaterialPageRoute(builder: (BuildContext context) => GeolocationOutsideParisPage());
      case searchProductPage:
        return MaterialPageRoute(builder: (BuildContext context) => SearchProductPage());
      case loginPage:
        return MaterialPageRoute(builder: (BuildContext context) => LoginPage());
      case welcomePage:
        return MaterialPageRoute(builder: (BuildContext context) => WelcomePage());
      default:
        throw ('this route name does not exist');
    }
  }
}
