import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proximitystore/models/product.dart';

import '../models/sector.dart';
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
    'shoesAndBags'.tr(): false,
    'computing'.tr(): false,
  };

  // Future<List<Map<String, dynamic>>> readJson() async {
  //   final String response = await rootBundle.loadString('assets/fake_data/product.json');
  //   List<dynamic> data = await json.decode(response);
  //   return (data).map((e) => e as Map<String, dynamic>).toList();
  // }
  bool hideSuggestionList = false;
  bool sectorNameSelected = false;
  String lastSectorNameSelected = '';

  ImagePicker picker = ImagePicker();
  Future<PickedFile?> pickedFile = Future.value(null);

  Map<String, bool> _chekedsectorsList = Map();

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
  int _temperLeftProduct = 150;

  bool _isProducFieldInFocus = false;

  // List<String> chekedsectorList = _chekedsectorsList;

  // List<String> get chekedsectorsList => _chekedsectorsList;
  Map<String, bool> get sectorsData => _sectorsData;

  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _productTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();
  TextEditingController _newPasswordTextEditingController = TextEditingController();
  TextEditingController _repeatNewPasswordTextEditingController = TextEditingController();
  TextEditingController _businessName = TextEditingController();
  TextEditingController _adress = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _storeDescription = TextEditingController();
  TextEditingController _productDescription = TextEditingController();
  TextEditingController _product = TextEditingController();
  TextEditingController _productPrice = TextEditingController();
  FocusNode serachProductFocusNode = FocusNode();
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
  TextEditingController get productTextEditingController => _productTextEditingController;

  TextEditingController get businessName => _businessName;
  TextEditingController get adress => _adress;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get storeDescription => _storeDescription;
  TextEditingController get productDescription => _productDescription;
  TextEditingController get product => _product;
  TextEditingController get productPrice => _productPrice;

  Map<String, bool> get chekedsectorsList => _chekedsectorsList;
  bool get sectorHintVisible => _sectorHintVisible;
  int get temperLeft => _temperLeft;
  int get temperLeftProduct => _temperLeftProduct;
  bool get switchValue => _switchValue;
  bool get validateButtonPressed => _validateButtonPressed;
  bool get deleteEnabled => _deleteEnabled;
  bool get deletePressed => _deletPressed;
  bool get isPickedFileEmpty => _isPickedFileEmpty;

  bool get isProducFieldInFocus => _isProducFieldInFocus;

  Product? newProduct;

  void setNewProduct({required Product product}) {
    newProduct = product;
    notifyListeners();
  }

  Future<List<Product>> getProductSuggestion(String query) async {
    final String response = await rootBundle.loadString('assets/fake_data/products.json');

    List data = await json.decode(response);

    List<Product> productList = data.map((json) => Product.fromJson(json)).toList();
    if (newProduct != null) productList.add(newProduct!);

    return productList.where((product) {
      final productNameLower = product.productName.toLowerCase();
      final queryLower = query.toLowerCase();
      return productNameLower.contains(queryLower);
    }).toList();
  }

  void disposeDescription() {
    _storeDescription.clear();
    notifyListeners();
  }

  Future<List<Sector>> getSectors() async {
    final String response = await rootBundle.loadString('assets/fake_data/sectorsList.json');
    List data = await json.decode(response);
    return data.map((json) => Sector.fromJson(json)).toList();
  }

  void setSectorCheked({required String sectorName}) {
    if (sectorNameSelected == false) {
      chekedsectorsList[sectorName] = !(chekedsectorsList[sectorName] ?? true);
      lastSectorNameSelected = sectorName;
      sectorNameSelected = true;
      notifyListeners();
    } else {
      if (sectorName == sectorNameSelected) {
        chekedsectorsList[lastSectorNameSelected] = !(chekedsectorsList[sectorName] ?? true);

        sectorNameSelected = false;
        notifyListeners();
      } else {
        chekedsectorsList[lastSectorNameSelected] = false;
        chekedsectorsList[sectorName] = !(chekedsectorsList[sectorName] ?? true);
        lastSectorNameSelected = sectorName;
        sectorNameSelected = true;
        lastSectorNameSelected = sectorName;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  void disposeChekedSector() {
    _chekedsectorsList.values.forEach((element) {
      element = false;
    });
    notifyListeners();
  }

  void setValidateButtonPressed() {
    _validateButtonPressed = !_validateButtonPressed;
    notifyListeners();
  }

  void setisProducFieldInFocus(context) {
    FocusScope.of(context).requestFocus(serachProductFocusNode);
    notifyListeners();

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
      notifyListeners();
    });
    notifyListeners();
  }

  void setPickedFileFromGalery() {
    pickedFile = picker.getImage(source: ImageSource.gallery).whenComplete(() {
      _isPickedFileEmpty = false;
      notifyListeners();
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

  void setTemperleft() {
    int temperWritten = storeDescription.text.length;
    _temperLeft = 500 - temperWritten;
    notifyListeners();
  }

  void setTemperleftProduct() {
    int temperWritten = productDescription.text.length;
    _temperLeftProduct = 150 - temperWritten;
    notifyListeners();
  }

  void setCheckBoxValue(String sactorName, bool? value) {
    if (_sectorsData.containsKey(sactorName)) {
      _sectorsData[sactorName] = value ?? false;
      if (value == false) {
        removeSector(sactorName);
      } else
        addChekedSector(sactorName);
    }

    notifyListeners();
  }

  void addChekedSector(String sectorName) {
    if (!_chekedsectorsList.keys.contains(sectorName) && (_sectorsData[sectorName] == true)) {
      _chekedsectorsList.addAll({sectorName: false});
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

  bool isDeleteEnabled() {
    return _sectorsData.values.contains(true);
  }

  void setHideSuggestionList() {
    hideSuggestionList = !hideSuggestionList;
    notifyListeners();
  }

  void disposestoreDescriptionControllers() {
    _switchValue = false;
    _isPickedFileEmpty = true;
    _sectorHintVisible = true;
    _deleteEnabled = false;
    _deletPressed = false;

    _temperLeft = 500;

    _businessName.clear();
    _adress.clear();
    _storeDescription.clear();
    _phoneNumber.clear();
  }

  void disposePickedFile() {
    Future<PickedFile?> pickedFile = Future.value(null);
    notifyListeners();
  }

  void disposeSettingsControllers() {
    _productPrice.clear();
    chekedsectorsList.forEach((key, value) {
      value = false;
    });

    _emailTextEditingController.clear();
    _passwordTextEditingController.clear();
    _newPasswordTextEditingController.clear();
    _repeatNewPasswordTextEditingController.clear();
    _businessName.clear();
    _phoneNumber.clear();
    _storeDescription.clear();
    _validateButtonPressed = false;
    _isReapetPasswordEqualpassword = false;
    _isPasswordValide = false;
    _isRepeatNewPasswordValide = false;
    _isNewPasswordValide = false;
    _isEmailValide = false;

    _isPasswordVisible = false;
    _isNewPasswordVisible = false;
    _isRepeatNewPasswordVisible = false;
    disposePickedFile();
  }

  void disposeSectors() {
    chekedsectorsList.clear();
  }
}
