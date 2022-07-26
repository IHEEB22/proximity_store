import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

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

  final picker = ImagePicker();
  Future<PickedFile?> pickedFile = Future.value(null);

  List<String> _chekedsectorsList = [];

  bool _switchValue = false;
  bool _isPickedFileEmpty = true;
  bool _sectorHintVisible = true;
  bool _deleteEnabled = false;
  bool _deletPressed = false;
  bool _validateButtonPressed = false;
  int _temperLeft = 500;

  // List<String> chekedsectorList = _chekedsectorsList;

  Map<String, bool> get sectorsData => _sectorsData;
  // List<String> get chekedsectorsList => _chekedsectorsList;

  TextEditingController _businessName = TextEditingController();
  TextEditingController _adress = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _description = TextEditingController();

  TextEditingController get businessName => _businessName;
  TextEditingController get adress => _adress;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get description => _description;

  List<String> get chekedsectorsList => _chekedsectorsList;
  bool get sectorHintVisible => _sectorHintVisible;
  int get temperLeft => _temperLeft;
  bool get switchValue => _switchValue;
  bool get validateButtonPressed => _validateButtonPressed;
  bool get deleteEnabled => _deleteEnabled;
  bool get deletePressed => _deletPressed;
  bool get isPickedFileEmpty => _isPickedFileEmpty;

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

  void setValidateButtonPressed() {
    _validateButtonPressed = !_validateButtonPressed;
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
}
