class ValidatorPassword {
  bool stringContainLowerCase({required String string}) {
    bool ok = false;
    for (int i = 0; i < string.length; i++) {
      if (string[i] == string[i].toLowerCase()) {
        ok = true;
        break;
      }
    }
    return ok;
  }

  bool stringContainUpperCase({required String string}) {
    bool ok = false;
    for (int i = 0; i < string.length; i++) {
      if (string[i] == string[i].toUpperCase()) {
        ok = true;
        break;
      }
    }
    return ok;
  }

  bool stringContainSpecialCharacter({required String string}) {
    String specialCharacter = '-*?!@#\$/(){}=.,;:';
    List listSpecialChar = specialCharacter.split('');
    bool ok = false;
    for (int i = 0; i < string.length; i++) {
      for (var specialChar in listSpecialChar) {
        if (string[i] == specialChar) {
          ok = true;
          break;
        }
      }
      if (ok) break;
    }
    return ok;
  }

  bool stringContainNumber({required String string}) {
    String specialCharacter = '0123456789';
    List listSpecialChar = specialCharacter.split('');
    bool ok = false;
    for (int i = 0; i < string.length; i++) {
      for (var specialChar in listSpecialChar) {
        if (string[i] == specialChar) {
          ok = true;
          break;
        }
      }
      if (ok) break;
    }
    return ok;
  }

  bool stringContainSpace({required String string}) {
    return string.contains(' ');
  }

  bool validatePassword({required String password}) {
    bool ok = false;
    if (password.length < 8) {
      ok = true;
    }
    if (!stringContainLowerCase(string: password)) {
      ok = true;
    }
    if (!stringContainUpperCase(string: password)) {
      ok = true;
    }
    if (!stringContainSpecialCharacter(string: password)) {
      ok = true;
    }
    if (!stringContainNumber(string: password)) {
      ok = true;
    }
    if (stringContainSpace(string: password)) {
      ok = true;
    }

    return ok;
  }
}
