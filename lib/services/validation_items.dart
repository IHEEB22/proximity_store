import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import '../providers/localistaion_controller_provider.dart';
import 'package:flutter/material.dart';

class ValidationItem {
  String? val;
  ValidationItem({this.val});

  String? validateEmail() {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val ?? "Not email");

    if ((val != null && val!.isEmpty)) {
      return 'ce champ est obligatoire !';
    } else if (!emailValid) {
      return 'email invalide';
    } else
      return null;
  }

  String? validateTown(BuildContext context) {
    List<Prediction> predictionList = context.read<LocalistaionControllerprovider>().predictionList;

    bool exist = predictionList.contains(Prediction(description: val));
    if ((val != null && val!.isEmpty)) {
      return 'ce champ est obligatoire !';
    } else if (!exist) {
      return "ville n'existe pas";
    } else
      return null;
  }

  bool isValid() {
    if (val != null) {
      return true;
    } else {
      return false;
    }
  }
}
