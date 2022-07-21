import 'package:flutter/material.dart';
import 'package:proximitystore/pages/authentification/forgot_password_page.dart';
import 'package:proximitystore/pages/authentification/login_page.dart';
import 'package:proximitystore/pages/authentification/reset_password.dart';
import 'package:proximitystore/pages/authentification/welcome_page.dart';
import 'package:proximitystore/pages/pages.dart';
import 'package:proximitystore/widgets/custom_page_route.dart';

class AppRoutes {
  static const String geoLocationOffPage = '/geoLocationOffPage';
  static const String addLocalisationAddressPage = '/addLocalisationAddressPage';
  static const String geoLocationOutsideParisPage = '/geoLocationOutsideParisPage';
  static const String searchProductPage = '/searchProductPage';
  static const String loginPage = '/loginPage';
  static const String welcomePage = '/welcomePage';
  static const String forgetPassword = '/forgetPassword';
  static const String resetPassword = '/resetPassword';

  static Route<dynamic> routeController(RouteSettings settings) {
    switch (settings.name) {
      case geoLocationOffPage:
        return CustomPageRoute(Route: GeoLocationOffPage(), settings: settings);
      case addLocalisationAddressPage:
        return CustomPageRoute(Route: AddLocalisationAddressPage(), settings: settings);
      case geoLocationOutsideParisPage:
        return CustomPageRoute(Route: GeolocationOutsideParisPage(), settings: settings);
      case searchProductPage:
        return CustomPageRoute(Route: SearchProductPage(), settings: settings);
      case loginPage:
        return CustomPageRoute(Route: LoginPage(), settings: settings);
      case welcomePage:
        return CustomPageRoute(Route: WelcomePage(), settings: settings);
      case forgetPassword:
        return CustomPageRoute(Route: ForgetPassword(), settings: settings);
      case resetPassword:
        return CustomPageRoute(Route: ResetPassword(), settings: settings);
      default:
        throw ('this route name does not exist');
    }
  }
}
