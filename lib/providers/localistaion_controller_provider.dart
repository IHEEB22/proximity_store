import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;

class LocalistaionControllerprovider with ChangeNotifier {
  bool _isTownEmpty = false;
  Placemark _pickPlaceMark = Placemark();
  TextEditingController townTextFormFieldController = TextEditingController();
  Placemark get pickPlaceMark => _pickPlaceMark;
  bool get isTownEmpty => _isTownEmpty;
  List<Prediction> _predictionList = [];
  List<Prediction> get predictionList => _predictionList;

  Future<List<Prediction>> searchLocation({required String text}) async {
    _predictionList = [];
    if (text.isNotEmpty) {
      http.Response response = await http.get(
        headers: {"Content-Type": "application/json"},
        Uri.parse("http://mvs.bslmeiyu.com/api/v1/config/place-api-autocomplete?search_text=$text"),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['status'] == 'OK') {
        data['predictions'].forEach((prediction) => _predictionList.add(Prediction.fromJson(prediction)));
      }
    }
    return _predictionList;
  }

  void setIsTownEmpty(String val) {
    if (val.isNotEmpty)
      _isTownEmpty = true;
    else
      _isTownEmpty = false;
    notifyListeners();
  }
}
