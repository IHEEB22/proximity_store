import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:proximitystore/models/client_procduct.dart';
import 'package:proximitystore/models/product.dart';

class ClientProvider with ChangeNotifier {
  TextEditingController _labelTextController = TextEditingController();
  // List<ClientProduct> productList = [];
  TextEditingController get labelTextController => _labelTextController;

  setLabelValue(String productLabel) {
    _labelTextController.text = productLabel;
    notifyListeners();
  }

  Future<List<ClientProduct>> getAllClientProduct(String query) async {
    final String response = await rootBundle.loadString('assets/fake_data/clientproducts.json');

    List data = await json.decode(response);

    List<ClientProduct> productList = data.map((json) => ClientProduct.fromJson(json)).toList();
    return productList.where((product) => product.productLabel.toLowerCase().startsWith(query.toLowerCase())).toList();
  }
}
