import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;

class LocalistaionControllerprovider with ChangeNotifier {
  final TextEditingController townTextFormFieldController = TextEditingController();
  final TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController adress = TextEditingController();
  FocusNode townFocusNode = FocusNode();
  bool _searchSpace = false;

  bool isAddressNotSelected = true;
  bool _isTownHasFocus = false;
  bool get isTownHasFocus => _isTownHasFocus;
  bool get searchSpace => _searchSpace;

  Placemark _pickPlaceMark = Placemark();
  Placemark get pickPlaceMark => _pickPlaceMark;
  List<Prediction> _predictionList = [];
  List<Prediction> get predictionList => _predictionList;

  void setSearchSpace() {
    if (adress.text.isNotEmpty) {
      _searchSpace = true;
    } else {
      _searchSpace = false;
    }
    notifyListeners();
  }

  void setIsAdressSelected() {
    isAddressNotSelected = false;
    notifyListeners();
  }

  void setAdressController({required String val}) {
    adress.text = val;
    notifyListeners();
  }

  void disposeAdressListeners() {
    isAddressNotSelected = true;
    _searchSpace = false;
    notifyListeners();
  }

  void addressSelected({required Prediction suggestion}) {
    adress.text = suggestion.description.toString();
    notifyListeners();
  }

  Future<List<Prediction>> searchLocation(String pattern) async {
    _predictionList = [];

    http.Response response = await http.get(
      headers: {"Content-Type": "application/json"},
      Uri.parse("http://mvs.bslmeiyu.com/api/v1/config/place-api-autocomplete?search_text=${pattern}"),
    );

    Map<String, dynamic> data = jsonDecode(response.body);

    if (data['status'] == 'OK') {
      data['predictions'].forEach((prediction) => _predictionList.add(Prediction.fromJson(prediction)));
    }

    return _predictionList;
  }

  // Future<List<Product>> getProductSuggestion(String query) async {
  //   final String response = await rootBundle.loadString('assets/fake_data/products.json');
  //   List data = await json.decode(response);
  //   return data.map((json) => Product.fromJson(json)).where((product) {
  //     final productNameLower = product.productName.toLowerCase();
  //     final queryLower = query.toLowerCase();
  //     return productNameLower.contains(queryLower);
  //   }).toList();
  // }

  void setIsTownHasFocus(bool hasFocus) {
    _isTownHasFocus = hasFocus;
    notifyListeners();
  }
}
