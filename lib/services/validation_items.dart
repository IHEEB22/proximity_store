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

    if ((val == null || (val ?? "").isEmpty)) {
      return 'ce champ est obligatoire !';
    } else if (!emailValid) {
      return 'email invalide';
    } else
      return null;
  }

  String? validatePassword() {
    int len = (val ?? '').length;

    if ((val == null || (val ?? "").isEmpty)) {
      return 'ce champ est obligatoire !';
    } else if (len < 8) {
      return 'mot de passe court';
    } else
      return null;
  }

  String? validateBusinessName() {
    int len = (val ?? '').length;

    if ((val == null || (val ?? "").isEmpty)) {
      return 'ce champ est obligatoire !';
    } else if (len < 3) {
      return 'Nom de commerce invalide';
    } else
      return null;
  }

  String? validateProductPrice() {
    int len = (val ?? '').length;

    if ((val == null || (val ?? "").isEmpty)) {
      return 'ce champ est obligatoire !';
    } else if (len < 3) {
      return 'prix commerce invalide';
    } else
      return null;
  }

  String? validatePhoneNumber() {
    int len = (val ?? '').length;

    if ((val == null || (val ?? "").isEmpty)) {
      return 'ce champ est obligatoire !';
    } else if (len < 8) {
      return 'Téléphone Invalide';
    } else
      return null;
  }

  String? validateTown({required BuildContext context, required String town}) {
    List<Prediction> predictionList = context.read<LocalistaionControllerprovider>().predictionList;
    bool exist = false;
    bool townselected = context.read<LocalistaionControllerprovider>().isAddressNotSelected;
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
