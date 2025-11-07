class ConfigWarning {
  bool warningTextField(bool validateChange, String text) {
    bool validate = false;
    if (validateChange && (text.trim() == '')) {
      validate = true;
    } else if (validateChange && (text.trim() != '')) {
      validate = false;
    }
    return validate;
  }

  bool warningTextFieldNumbers(bool validateChange, String text) {
    bool validate = false;
    if (validateChange && (text.trim() == '' || double.parse(text.trim()) == 0)) {
      validate = true;
    } else if (validateChange && (text.trim() != '' || double.parse(text.trim()) != 0)) {
      validate = false;
    }
    return validate;
  }

  bool warningPhoneTextField({required bool validateChange, required String text, required int minLength, required int maxLength}) {
    bool validate = false;
    if (validateChange && (text.trim() == '')) {
      validate = true;
    } else if (validateChange && (text.trim() != '')) {
      validate = false;
    }
    if (validateChange && !(minLength <= text.length && text.length <= maxLength)) {
      validate = true;
    }
    return validate;
  }

  bool warningDropDownButton(bool validateChange, List<String> options) {
    bool validate = false;
    if (validateChange && options.isEmpty) {
      validate = true;
    } else if (validateChange && options.isNotEmpty) {
      validate = false;
    }
    return validate;
  }
}
