import 'package:flutter/material.dart';
import 'package:proximitystore/pages/commerce/terms_of_service_page.dart';
import 'package:proximitystore/pages/pages.dart';
import 'package:proximitystore/widgets/custom_page_route.dart';

class AppRoutes {
  static const String geoLocationOffPage = '/geoLocationOffPage';
  static const String addLocalisationAddressPage = '/addLocalisationAddressPage';
  static const String geoLocationOutsideParisPage = '/geoLocationOutsideParisPage';
  static const String geolocationSearchProductPage = '/geolocationSearchProductPage';
  static const String searchFiltredProductPage = '/searchFiltredProductPage';
  static const String geolocationEditAdressePage = '/geolocationEditAdressePage';

  static const String loginPage = '/loginPage';
  static const String welcomePage = '/welcomePage';
  static const String forgetPassword = '/forgetPassword';
  static const String resetPassword = '/resetPassword';
  static const String registerPage = '/registerPage';
  static const String emailVerificationPage = '/emailVerificationPage';
  static const String storeDescriptionPage = '/storeDescriptionPage';
  static const String settingsPage = '/settingsPage';
  static const String termOfServicePage = '/termOfServicePage';
  static const String searchProductPage = '/searchProductPage';
  static const String addNewProductPage = '/addNewProductPage';
  static const String productDescriptionPage = '/productDescriptionPage';

  static Route<dynamic> routeController(RouteSettings settings) {
    switch (settings.name) {
      case geoLocationOffPage:
        return CustomPageRoute(Route: GeoLocationOffPage(), settings: settings);
      case addLocalisationAddressPage:
        return CustomPageRoute(Route: AddLocalisationAddressPage(), settings: settings);
      case geoLocationOutsideParisPage:
        return CustomPageRoute(Route: GeolocationOutsideParisPage(), settings: settings);
      case geolocationSearchProductPage:
        return CustomPageRoute(Route: GeolocationSearchProductPage(), settings: settings);
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
      case resetPassword:
        return CustomPageRoute(Route: ResetPassword(), settings: settings);
      case storeDescriptionPage:
        return CustomPageRoute(Route: StoreDescriptionPage(), settings: settings);
      case settingsPage:
        return CustomPageRoute(Route: SettingsPage(), settings: settings);
      case termOfServicePage:
        return CustomPageRoute(Route: TermsOfServicePage(), settings: settings);

      case searchProductPage:
        return CustomPageRoute(Route: SearchProductPage(), settings: settings);
      case addNewProductPage:
        return CustomPageRoute(Route: AddNewProductPage(), settings: settings);
      case searchFiltredProductPage:
        return CustomPageRoute(Route: SearchFiltredProductPage(), settings: settings);
      case productDescriptionPage:
        return CustomPageRoute(Route: ProductDescriptionPage(), settings: settings);
      case geolocationEditAdressePage:
        return CustomPageRoute(Route: GeolocationEditAdressePage(), settings: settings);
      default:
        throw ('this route name does not exist');
    }
  }
}
