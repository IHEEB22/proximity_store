import 'dart:convert';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proximitystore/models/product.dart';
import 'package:proximitystore/models/productList.dart';

import '../services/validation_items.dart';

class BusinessProvider with ChangeNotifier {
  Map<String, bool> _sectorsData = {
    'petShop'.tr(): false,
    'applications&VideoGames'.tr(): false,
    'autoAndMotorcycle'.tr(): false,
    'luggageStorage'.tr(): false,
    'baby&Childcar'.tr(): false,
    'diy'.tr(): false,
    'shoes'.tr(): false,
    'telephony'.tr(): false,
  };

  Future<List<Map<String, dynamic>>> readJson() async {
    final String response = await rootBundle.loadString('assets/fake_data/product.json');
    List<dynamic> data = await json.decode(response);
    return (data).map((e) => e as Map<String, dynamic>).toList();
  }

  final picker = ImagePicker();
  Future<PickedFile?> pickedFile = Future.value(null);

  List<String> _chekedsectorsList = [];

  bool _switchValue = false;
  bool _isPickedFileEmpty = true;
  bool _sectorHintVisible = true;
  bool _deleteEnabled = false;
  bool _deletPressed = false;
  bool _validateButtonPressed = false;
  bool _isReapetPasswordEqualpassword = false;
  bool _isPasswordValide = false;
  bool _isRepeatNewPasswordValide = false;
  bool _isNewPasswordValide = false;
  bool _isEmailValide = false;

  bool _isPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isRepeatNewPasswordVisible = false;
  int _temperLeft = 500;

  // List<String> chekedsectorList = _chekedsectorsList;

  // List<String> get chekedsectorsList => _chekedsectorsList;
  Map<String, bool> get sectorsData => _sectorsData;

  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();
  TextEditingController _newPasswordTextEditingController = TextEditingController();
  TextEditingController _repeatNewPasswordTextEditingController = TextEditingController();
  TextEditingController _businessName = TextEditingController();
  TextEditingController _adress = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _product = TextEditingController();
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isNewPasswordVisible => _isNewPasswordVisible;
  bool get isRepeatNewPasswordVisible => _isRepeatNewPasswordVisible;
  bool get isPasswordValide => _isPasswordValide;
  bool get isRepeatNewPasswordValide => _isRepeatNewPasswordValide;
  bool get isNewPasswordValide => _isNewPasswordValide;
  bool get isReapetPasswordEqualpassword => _isReapetPasswordEqualpassword;
  bool get isEmailValide => _isEmailValide;

  TextEditingController get emailTextEditingController => _emailTextEditingController;
  TextEditingController get repeatNewPasswordTextEditingController => _repeatNewPasswordTextEditingController;
  TextEditingController get passwordTextEditingController => _passwordTextEditingController;
  TextEditingController get newPasswordTextEditingController => _newPasswordTextEditingController;

  TextEditingController get businessName => _businessName;
  TextEditingController get adress => _adress;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get description => _description;
  TextEditingController get product => _product;

  List<String> get chekedsectorsList => _chekedsectorsList;
  bool get sectorHintVisible => _sectorHintVisible;
  int get temperLeft => _temperLeft;
  bool get switchValue => _switchValue;
  bool get validateButtonPressed => _validateButtonPressed;
  bool get deleteEnabled => _deleteEnabled;
  bool get deletePressed => _deletPressed;
  bool get isPickedFileEmpty => _isPickedFileEmpty;
  void setValidateButtonPressed() {
    _validateButtonPressed = !_validateButtonPressed;
    notifyListeners();
  }

  void setBusinessName(String? val) {
    _businessName.text = val ?? '';
  }

  void setAdress(String? val) {
    _adress.text = val ?? '';
  }

  void setPhoneNumber(String? val) {
    _phoneNumber.text = val ?? '';
  }

  void setIsPasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

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

  void setNewPasswordValide(String password) {
    String aux = ValidationItem(val: password).validatePassword() ?? "";
    if (aux == "") {
      _isNewPasswordValide = true;
    } else {
      _isNewPasswordValide = false;
    }
    notifyListeners();
  }

  void setRepaetNewPasswordValide(String password) {
    String aux = ValidationItem(val: password).validatePassword() ?? "";
    if (aux == "") {
      _isRepeatNewPasswordValide = true;
    } else {
      _isRepeatNewPasswordValide = false;
    }
    notifyListeners();
  }

  void setIsNewPasswordVisible() {
    _isNewPasswordVisible = !_isNewPasswordVisible;
    notifyListeners();
  }

  void setIsRepeatNewPasswordVisible() {
    _isRepeatNewPasswordVisible = !_isRepeatNewPasswordVisible;
    notifyListeners();
  }

  void setIsReapetPasswordEqualNewPassword() {
    if (isNewPasswordValide && isRepeatNewPasswordValide) {
      _isReapetPasswordEqualpassword =
          _repeatNewPasswordTextEditingController.text == _newPasswordTextEditingController.text;
    } else {
      _isReapetPasswordEqualpassword = false;
    }
    notifyListeners();
  }

  void setPickedFileFromCamera() {
    pickedFile = picker.getImage(source: ImageSource.camera).whenComplete(() {
      _isPickedFileEmpty = false;
    });
    notifyListeners();
  }

  void setPickedFileFromGalery() {
    pickedFile = picker
        .getImage(
      source: ImageSource.gallery,
    )
        .whenComplete(() {
      _isPickedFileEmpty = false;
    });
    notifyListeners();
  }

  void setSwitchValue() {
    _switchValue = !_switchValue;
    notifyListeners();
  }

  void setSectorHintVisible() {
    _sectorHintVisible = !_sectorHintVisible;
    notifyListeners();
  }

  void setDeletePressed() {
    _deletPressed = !_deletPressed;
    _deleteEnabled = !_deleteEnabled;
    notifyListeners();
  }

  void setTemperleft() {
    int temperWritten = description.text.length;
    _temperLeft = 500 - temperWritten;
    notifyListeners();
  }

  void setCheckoxValue(String sactorName, value) {
    if (_sectorsData.containsKey(sactorName)) {
      _sectorsData[sactorName] = value;
    }
    notifyListeners();
  }

  void addChekedSector(String sectorName) {
    if (!_chekedsectorsList.contains(sectorName) && (_sectorsData[sectorName] == true)) {
      _chekedsectorsList.add(sectorName);
    }
    notifyListeners();
  }

  void removeSector(sectorName) {
    _chekedsectorsList.remove(sectorName);
    _sectorsData[sectorName] = false;
    notifyListeners();
  }

  void deletAllSectors() {
    for (String key in _sectorsData.keys) {
      sectorsData[key] = false;
      notifyListeners();
    }

    _chekedsectorsList.clear();
    notifyListeners();
  }

  void isDeleteEnabled() {
    _deleteEnabled = _sectorsData.values.contains(true);
    notifyListeners();
  }

  void disposeDescriptionControllers() {
    _switchValue = false;
    _isPickedFileEmpty = true;
    _sectorHintVisible = true;
    _deleteEnabled = false;
    _deletPressed = false;

    _temperLeft = 500;

    _chekedsectorsList.clear();
    _businessName.clear();
    _adress.clear();
    _description.clear();
    _phoneNumber.clear();
  }

  void disposeSettingsControllers() {
    _emailTextEditingController.clear();
    _passwordTextEditingController.clear();
    _newPasswordTextEditingController.clear();
    _repeatNewPasswordTextEditingController.clear();
    _validateButtonPressed = false;
    _isReapetPasswordEqualpassword = false;
    _isPasswordValide = false;
    _isRepeatNewPasswordValide = false;
    _isNewPasswordValide = false;
    _isEmailValide = false;

    _isPasswordVisible = false;
    _isNewPasswordVisible = false;
    _isRepeatNewPasswordVisible = false;
  }
}
