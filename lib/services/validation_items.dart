class ValidationItem {
  String? val;
  ValidationItem({this.val});

  String? validateEmail() {
    int len = val?.length ?? 0;

    if ((val == null) || (len <= 3)) {
      return 'Must be at least 3 characters';
    } else
      return null;
  }

  String? validateTown() {
    int len = val?.length ?? 0;

    if ((val == null) || (len <= 3)) {
      return 'Must be at least 3 characters';
    } else
      return null;
  }

  bool isValid(val) {
    if (val != null) {
      return true;
    } else {
      return false;
    }
  }
}
