import 'package:flutter/material.dart';
import 'package:proximitystore/models/validation_items.dart';

class SheetValidation with ChangeNotifier {
  ValidationItem _email = ValidationItem(
    value: '',
    error: '',
  );
  ValidationItem _ville = ValidationItem(
    value: '',
    error: '',
  );

  //Getters
  ValidationItem get email => _email;
  ValidationItem get ville => _ville;

  bool get isValid {
    if (_email.value != null && _ville.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void changeemail(String value) {
    if (value.length >= 3) {
      _email = ValidationItem(
        value: value,
        error: '',
      );
    } else {
      _email = ValidationItem(
        value: '',
        error: 'Must be at least 3 characters',
      );
    }
    notifyListeners();
  }

  void changeville(String value) {
    if (value.length >= 3 && value.isNotEmpty) {
      _ville = ValidationItem(
        value: value,
        error: '',
      );
    } else {
      _ville = ValidationItem(
        value: value,
        error: 'Must be at least 3 characters',
      );
    }
    notifyListeners();
  }
}
