import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:proximitystore/models/client_procduct.dart';
import 'package:proximitystore/models/product.dart';
import 'package:proximitystore/providers/business_provider.dart';

class ClientProvider with ChangeNotifier {
  // Completer<GoogleMapController> mapController = Completer();

  TextEditingController _labelTextController = TextEditingController();
  // List<ClientProduct> productList = [];
  TextEditingController get labelTextController => _labelTextController;
  bool hideSuggestion = false;
  ClientProduct? productSelected;
  bool hideKeyBord = true;

  setLabelValue(String productLabel) {
    _labelTextController.text = productLabel;
    notifyListeners();
  }

  setProductSelected({required ClientProduct product}) {
    productSelected = product;
    notifyListeners();
  }

  setHideSuggestion() {
    hideSuggestion = false;
    notifyListeners();
  }

  void hidekeyBord() {
    hideKeyBord = !hideKeyBord;
    notifyListeners();
  }

  Future<List<ClientProduct>> getLabelList(String query) async {
    final String response = await rootBundle.loadString('assets/fake_data/clientproducts.json');

    List data = await json.decode(response);

    List<ClientProduct> productList = data.map((json) => ClientProduct.fromJson(json)).toList();
    return productList.where((product) => product.productLabel.toLowerCase().startsWith(query.toLowerCase())).toList();
  }

  Future<List<ClientProduct>> getProductSuggestion({required String query, required BuildContext context}) async {
    final String response = await rootBundle.loadString('assets/fake_data/clientproducts.json');

    List data = await json.decode(response);

    List<ClientProduct> productList = data.map((json) => ClientProduct.fromJson(json)).toList();

    notifyListeners();

    return productList.where((product) {
      final productNameLower = product.productName.toLowerCase();
      final queryLower = query.toLowerCase();

      Map<String, bool> filterSelected = context.read<BusinessProvider>().chekedsectorsList;
      if (filterSelected.isEmpty)
        return productNameLower.contains(queryLower);
      else
        return productNameLower.contains(queryLower) && filterSelected.containsKey(product.productsector);
    }).toList();
  }
}
