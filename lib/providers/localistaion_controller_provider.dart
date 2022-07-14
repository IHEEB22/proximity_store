import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;

import '../services/localisation_services.dart';

class LocalistaionControllerprovider with ChangeNotifier {
  bool _isTownEmpty = false;
  Placemark _pickPlaceMark = Placemark();
  Placemark get pickPlaceMark => _pickPlaceMark;
  bool get isTownEmpty => _isTownEmpty;
  List<Prediction> _predictionList = [];
  List<Prediction> get predictionList => _predictionList;
  Future<List<Prediction>> searchLocation(BuildContext context, String text) async {
    if (text.isNotEmpty) {
      http.Response response = await getLocationData(text);
      var data = jsonDecode(response.body.toString());
      print("my status is " + data["status"]);
      if (data['status'] == 'OK') {
        _predictionList = [];
        data['predictions'].forEach((prediction) => _predictionList.add(Prediction.fromJson(prediction)));
      }
    }
    notifyListeners();
    return _predictionList;
  }

  void setisTownEmpty(String val) {
    if (val.isNotEmpty)
      _isTownEmpty = true;
    else
      _isTownEmpty = false;
    notifyListeners();
  }
}
