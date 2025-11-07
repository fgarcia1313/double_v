import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../utils/config/config_sort.dart';
import '../../../../../utils/validator/ValidatorString.dart';

class PickCountryDialogLogic extends GetxController {
  final TextEditingController searchController = TextEditingController(text: '');

  final RxList listCountries = [].obs;
  final RxList listCountriesFilter = [].obs;

  Map mapPickCountry = {};

  @override
  void onInit() async {
    super.onInit();
    await _onLoadCountries();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  onSearchCountries(String text) async {
    List list = listCountries.where((item) => ValidatorString().containString(str1: item?['name']['common'], str2: text)).toList();
    listCountriesFilter.value = list;
  }

  onPickCountry({required Map map}) {
    mapPickCountry = map;
    Get.back();
  }

  onCancel() {
    Get.back();
  }

  Future _onLoadCountries() async {
    List<Map?> list = await _fetchCountries();
    listCountries.value = list;
    listCountriesFilter.value = list;
  }

  Future<List<Map?>> _fetchCountries() async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all?fields=name,flags,idd'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List list = ConfigSort().sortDescendingByCountry(jsonData);
      List<Map?> mapList = list.map((dynamic item) => item as Map?).toList();
      return mapList;
    }
    return [];
  }
}
