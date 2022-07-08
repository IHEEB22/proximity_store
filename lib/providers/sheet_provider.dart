import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:proximitystore/models/sheet_inputs.dart';

class SheetProvider with ChangeNotifier {
  List<SheetInputs> _sheetInputsList = [];

  List<SheetInputs> get sheetInputsList => _sheetInputsList;

  Void? addsheetInputs({required String email, required String town}) {
    _sheetInputsList.add(SheetInputs(email: email, town: town));
    notifyListeners();
  }
}
