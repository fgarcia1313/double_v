import 'dart:collection';

import '../../models/address_model.dart';
import 'config_date.dart';
import '/utils/validator/ValidatorString.dart';

class ConfigSort {
  static final ConfigDate _configDate = ConfigDate();
  static final ValidatorString _validatorString = ValidatorString();

  Map sortAscendantByKey(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      return a.compareTo(b);
    });
    return Map.of(sorted);
  }

  Map sortDescendingByKey(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      return -a.compareTo(b);
    });
    return Map.of(sorted);
  }

  Map sortAscendantByNumber(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      int aNumber = map[a]['number'];
      int bNumber = map[b]['number'];
      return aNumber.compareTo(bNumber);
    });
    return Map.of(sorted);
  }

  Map sortDescendingByNumber(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      int aNumber = map[a]['number'];
      int bNumber = map[b]['number'];
      return -aNumber.compareTo(bNumber);
    });
    return Map.of(sorted);
  }

  Map sortAscendantByDate(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      DateTime aDate = _configDate.stringToDate(map[a]['date']);
      DateTime bDate = _configDate.stringToDate(map[b]['date']);
      return aDate.compareTo(bDate);
    });
    return Map.of(sorted);
  }

  Map sortDescendingByDate(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      DateTime aDate = _configDate.stringToDate(map[a]['date']);
      DateTime bDate = _configDate.stringToDate(map[b]['date']);
      return -aDate.compareTo(bDate);
    });
    return Map.of(sorted);
  }

  Map sortAscendantByCreateDate(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      DateTime aDate = _configDate.stringToDate(map[a]['create']['date']);
      DateTime bDate = _configDate.stringToDate(map[b]['create']['date']);
      if (aDate == bDate) {
        return a.compareTo(b);
      } else {
        return aDate.compareTo(bDate);
      }
    });
    return Map.of(sorted);
  }

  Map sortDescendingByCreateDate(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      DateTime aDate = _configDate.stringToDate(map[a]['create']['date']);
      DateTime bDate = _configDate.stringToDate(map[b]['create']['date']);
      if (aDate == bDate) {
        return -a.compareTo(b);
      } else {
        return -aDate.compareTo(bDate);
      }
    });
    return Map.of(sorted);
  }

  Map sortAscendantByCreateName(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      String aName = map[a]['create']['name'];
      String bName = map[b]['create']['name'];
      if (_validatorString.strictStringCompare(str1: aName, str2: bName)) {
        return a.compareTo(b);
      } else {
        return aName.compareTo(bName);
      }
    });
    return Map.of(sorted);
  }

  Map sortDescendingByCreateName(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      String aName = map[a]['create']['name'];
      String bName = map[b]['create']['name'];
      if (_validatorString.strictStringCompare(str1: aName, str2: bName)) {
        return -a.compareTo(b);
      } else {
        return -aName.compareTo(bName);
      }
    });
    return Map.of(sorted);
  }

  Map sortAscendantByCreateEmail(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      String aEmail = map[a]['create']['email'];
      String bEmail = map[b]['create']['email'];
      if (_validatorString.strictStringCompare(str1: aEmail, str2: bEmail)) {
        return a.compareTo(b);
      } else {
        return aEmail.compareTo(bEmail);
      }
    });
    return Map.of(sorted);
  }

  Map sortDescendingByCreateEmail(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      String aEmail = map[a]['create']['email'];
      String bEmail = map[b]['create']['email'];
      if (_validatorString.strictStringCompare(str1: aEmail, str2: bEmail)) {
        return -a.compareTo(b);
      } else {
        return -aEmail.compareTo(bEmail);
      }
    });
    return Map.of(sorted);
  }

  Map sortAscendantByValueInvoiceNo(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      double aInvoiceNo = map[a]['value']['quoteNumber'] ?? 0;
      double bInvoiceNo = map[b]['value']['quoteNumber'] ?? 0;
      if (aInvoiceNo == bInvoiceNo) {
        return a.compareTo(b);
      } else {
        return aInvoiceNo.compareTo(bInvoiceNo);
      }
    });
    return Map.of(sorted);
  }

  Map sortDescendingByValueInvoiceNo(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      double aInvoiceNo = map[a]['value']['quoteNumber'] ?? 0;
      double bInvoiceNo = map[b]['value']['quoteNumber'] ?? 0;
      if (aInvoiceNo == bInvoiceNo) {
        return -a.compareTo(b);
      } else {
        return -aInvoiceNo.compareTo(bInvoiceNo);
      }
    });
    return Map.of(sorted);
  }

  Map sortAscendantByValueName(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      String aName = map[a]['value']['name'];
      String bName = map[b]['value']['name'];
      if (_validatorString.strictStringCompare(str1: aName, str2: bName)) {
        return a.compareTo(b);
      } else {
        return aName.compareTo(bName);
      }
    });
    return Map.of(sorted);
  }

  Map sortDescendingByValueName(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      String aName = map[a]['value']['name'];
      String bName = map[b]['value']['name'];
      if (_validatorString.strictStringCompare(str1: aName, str2: bName)) {
        return -a.compareTo(b);
      } else {
        return -aName.compareTo(bName);
      }
    });
    return Map.of(sorted);
  }

  Map sortAscendantByValueSurname(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      String aSurName = map[a]['value']['surName'];
      String bSurName = map[b]['value']['surName'];
      if (_validatorString.strictStringCompare(str1: aSurName, str2: bSurName)) {
        return a.compareTo(b);
      } else {
        return aSurName.compareTo(bSurName);
      }
    });
    return Map.of(sorted);
  }

  Map sortDescendingByValueSurname(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      String aSurName = map[a]['value']['surName'];
      String bSurName = map[b]['value']['surName'];
      if (_validatorString.strictStringCompare(str1: aSurName, str2: bSurName)) {
        return -a.compareTo(b);
      } else {
        return -bSurName.compareTo(aSurName);
      }
    });
    return Map.of(sorted);
  }

  Map sortAscendantByValueEmail(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      String aEmail = map[a]['value']['email'];
      String bEmail = map[b]['value']['email'];
      if (_validatorString.strictStringCompare(str1: aEmail, str2: bEmail)) {
        return a.compareTo(b);
      } else {
        return aEmail.compareTo(bEmail);
      }
    });
    return Map.of(sorted);
  }

  Map sortDescendingByValueEmail(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      String aEmail = map[a]['value']['email'];
      String bEmail = map[b]['value']['email'];
      if (_validatorString.strictStringCompare(str1: aEmail, str2: bEmail)) {
        return -a.compareTo(b);
      } else {
        return -aEmail.compareTo(bEmail);
      }
    });
    return Map.of(sorted);
  }

  Map sortAscendantByValueQuoteState(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      int aState = map[a]['value']['quoteState']['state'];
      int bState = map[b]['value']['quoteState']['state'];
      if (aState == bState) {
        return a.compareTo(b);
      } else {
        return aState.compareTo(bState);
      }
    });
    return Map.of(sorted);
  }

  Map sortDescendingByValueQuoteState(Map map) {
    SplayTreeMap sorted = SplayTreeMap<String, dynamic>.from(map, (a, b) {
      int aState = map[a]['value']['quoteState']['state'];
      int bState = map[b]['value']['quoteState']['state'];
      if (aState == bState) {
        return -a.compareTo(b);
      } else {
        return -aState.compareTo(bState);
      }
    });
    return Map.of(sorted);
  }

  List sortAscendantByCountry(List list) {
    list.sort((a, b) => a['name']['common'].compareTo(b['name']['common']));
    return list;
  }

  List sortDescendingByCountry(List list) {
    list.sort((a, b) => a['name']['common'].compareTo(b['name']['common']));
    return list;
  }

  List<AddressModel> sortAddressItemsByCountryDescending(List<AddressModel> quoteItems) {
    quoteItems.sort((a, b) {
      try {
        String nameA = a.country;
        String nameB = b.country;
        return nameB.compareTo(nameA);
      } catch (e) {
        return 0;
      }
    });
    return quoteItems;
  }

  List<AddressModel> sortAddressItemsByCountryAscending(List<AddressModel> quoteItems) {
    quoteItems.sort((a, b) {
      try {
        String nameA = a.country;
        String nameB = b.country;
        return nameA.compareTo(nameB);
      } catch (e) {
        return 0;
      }
    });
    return quoteItems;
  }

  List<AddressModel> sortAddressItemsByStateDescending(List<AddressModel> quoteItems) {
    quoteItems.sort((a, b) {
      try {
        String nameA = a.state;
        String nameB = b.state;
        return nameB.compareTo(nameA);
      } catch (e) {
        return 0;
      }
    });
    return quoteItems;
  }

  List<AddressModel> sortAddressItemsByStateAscending(List<AddressModel> quoteItems) {
    quoteItems.sort((a, b) {
      try {
        String nameA = a.state;
        String nameB = b.state;
        return nameA.compareTo(nameB);
      } catch (e) {
        return 0;
      }
    });
    return quoteItems;
  }

  List<AddressModel> sortAddressItemsByCityDescending(List<AddressModel> quoteItems) {
    quoteItems.sort((a, b) {
      try {
        String nameA = a.city;
        String nameB = b.city;
        return nameB.compareTo(nameA);
      } catch (e) {
        return 0;
      }
    });
    return quoteItems;
  }

  List<AddressModel> sortAddressItemsByCityAscending(List<AddressModel> quoteItems) {
    quoteItems.sort((a, b) {
      try {
        String nameA = a.city;
        String nameB = b.city;
        return nameA.compareTo(nameB);
      } catch (e) {
        return 0;
      }
    });
    return quoteItems;
  }

  List<AddressModel> sortAddressItemsByDateDescending(List<AddressModel> quoteItems) {
    quoteItems.sort((a, b) {
      try {
        DateTime dateA = _configDate.stringToDate(a.create);
        DateTime dateB = _configDate.stringToDate(b.create);
        return dateB.compareTo(dateA);
      } catch (e) {
        return 0;
      }
    });
    return quoteItems;
  }

  List<AddressModel> sortAddressItemsByDateAscending(List<AddressModel> quoteItems) {
    quoteItems.sort((a, b) {
      try {
        DateTime dateA = _configDate.stringToDate(a.create);
        DateTime dateB = _configDate.stringToDate(b.create);
        return dateA.compareTo(dateB);
      } catch (e) {
        return 0;
      }
    });
    return quoteItems;
  }
}
