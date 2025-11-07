import 'package:diacritic/diacritic.dart';

class ValidatorString {
  String normalize(String string) {
    return removeDiacritics(string).trim().toLowerCase();
  }

  bool containString({required String str1, required String str2}) {
    return normalize(str1).contains(normalize(str2));
  }

  bool strictStringCompare({required String str1, required String str2}) {
    return normalize(str1) == normalize(str2);
  }
}
