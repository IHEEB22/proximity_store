import 'package:flutter/material.dart';

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
  static const String registerPage = '/registerPage';
  static const String emailVerificationPage = '/emailVerificationPage';

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
      case emailVerificationPage:
        return CustomPageRoute(Route: EmailVerificationPage(), settings: settings);
      case registerPage:
        return CustomPageRoute(Route: RegisterPage(), settings: settings);

      default:
        throw ('this route name does not exist');
    }
  }
}
