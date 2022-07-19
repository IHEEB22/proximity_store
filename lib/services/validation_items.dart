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

  String? validatePassword() {
    int len = (val ?? '').length;

    if ((val != null && val!.isEmpty)) {
      return 'ce champ est obligatoire !';
    } else if (len < 8) {
      return 'mot de passe court';
    } else
      return null;
  }

  String? validateTown({required BuildContext context, required String town}) {
    List<Prediction> predictionList = context.read<LocalistaionControllerprovider>().predictionList;
    bool exist = false;
    predictionList.forEach((Prediction element) {
      if (element.description == town) exist = true;
    });
    if (town.isEmpty) {
      return 'ce champ est obligatoire !';
    } else if (!exist) {
      return "ville n'existe pas";
    } else
      return null;
  }
}
