import 'package:flutter/material.dart';

import '../services/validation_items.dart';

class AuthentificationProvider with ChangeNotifier {
  bool _isButtonDisabled = true;
  bool _isEmailValide = false;
  bool _isPasswordValide = false;
  bool _isPasswordVisible = false;
  bool _isRepeatPasswordVisible = false;
  bool _isReapetPasswordEqualpassword = false;

  TextEditingController _repeatPasswordTextEditingController = TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();

  TextEditingController get emailTextEditingController => _emailTextEditingController;
  TextEditingController get passwordTextEditingController => _passwordTextEditingController;
  TextEditingController get repeatPasswordTextEditingController => _repeatPasswordTextEditingController;

  bool get isButtonDisabled => _isButtonDisabled;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isRepeatPasswordVisible => _isRepeatPasswordVisible;
  bool get isEmailValide => _isEmailValide;
  bool get isPasswordValide => _isPasswordValide;
  bool get isReapetPasswordEqualpassword => _isReapetPasswordEqualpassword;

  void setEmailValide(String email) {
    String aux = ValidationItem(val: email).validateEmail() ?? "";
    if (aux == "") {
      _isEmailValide = true;
    } else {
      _isEmailValide = false;
    }
    notifyListeners();
  }

  void setPasswordValide(String password) {
    String aux = ValidationItem(val: password).validatePassword() ?? "";
    if (aux == "") {
      _isPasswordValide = true;
    } else {
      _isPasswordValide = false;
    }
    notifyListeners();
  }

  void setIsButtonDisabled() {
    _isButtonDisabled = !(_isEmailValide && _isPasswordValide);
    notifyListeners();
  }

  void setIsPasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void setIsRepeatPasswordVisible() {
    _isRepeatPasswordVisible = !_isRepeatPasswordVisible;
    notifyListeners();
  }

  void setIsReapetPasswordEqualpassword() {
    _isReapetPasswordEqualpassword = _repeatPasswordTextEditingController.text == passwordTextEditingController.text;
    notifyListeners();
  }

  void disposeControllersLoginPage() {
    _emailTextEditingController.clear();
    _passwordTextEditingController.clear();
  }

  void disposeControllersResetpasswordppage() {
    _repeatPasswordTextEditingController.clear();
    _passwordTextEditingController.clear();
    _isReapetPasswordEqualpassword = false;
  }

  void disposeIsButtonDisabled() => _isButtonDisabled = true;
}