import 'package:flutter/material.dart';
import 'package:proximitystore/pages/geolocation/add_localisation_address_page.dart';
import 'package:proximitystore/pages/geolocation/geolocation_outside_paris_page.dart';
import 'package:proximitystore/pages/home/search_product_page.dart';

import '../../pages/geolocation/geolocation_off_page.dart';

class AppRoutes {
  static const String geoLocationOffPage = '/geoLocationOffPage';
  static const String addLocalisationAddressPage = '/addLocalisationAddressPage';
  static const String geoLocationOutsideParisPage = '/geoLocationOutsideParisPage';
  static const String searchProductPage = '/searchProductPage';
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
      default:
        throw ('this route name does not exist');
    }
  }
}
