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

  String? validateTown() {
    int len = val?.length ?? 0;

    if (val == null) {
      return 'ce champ est obligatoire !';
    } else if (len <= 3) {
      return 'ville invalide';
    }
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
