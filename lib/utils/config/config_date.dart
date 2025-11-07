import 'package:intl/intl.dart';

class ConfigDate {
  DateTime dateNow() {
    return DateTime.now();
  }

  String dateNowStringFormat() {
    DateTime date = DateTime.now();
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(date);
  }

  String dateToString(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(date);
  }

  DateTime stringToDate(String date) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').parse(date);
  }

  String dateCustomFromString(String date) {
    DateTime dateTime = DateFormat('dd/MM/yyyy HH:mm:ss').parse(date);
    String formatter = DateFormat('dd, MMMM yyyy').format(dateTime);
    return formatter;
  }

  String dateCustomFromDate(DateTime date) {
    String formatter = DateFormat('dd, MMMM yyyy').format(date);
    return formatter;
  }
}
