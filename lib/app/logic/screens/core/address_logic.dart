import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/address_model.dart';
import '../../../../utils/config/config_date.dart';
import '../../../../utils/config/config_other.dart';
import '../../../../utils/config/config_sort.dart';
import '../../../../utils/config/config_warning.dart';
import '../../../../utils/global/global_routes.dart';
import '../../../screens/dialog/address/edit_address_dialog.dart';
import '../../../screens/dialog/address/pick_country_dialog.dart';
import '../../../screens/dialog/basic/confirm_dialog.dart';
import '../../../screens/dialog/basic/entry_value_dialog.dart';
import '../../../screens/dialog/login/create_new_account_dialog.dart';

class AddressLogic extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  AddressModel addressModel = AddressModel(country: '', state: '', city: '', create: '', countryFlag: '');

  final RxList<AddressModel> allAddress = <AddressModel>[].obs;
  final RxString countryName = ''.obs;
  final RxString countryImage = ''.obs;
  final RxBool warningCountry = false.obs;
  final RxBool warningState = false.obs;
  final RxBool warningCity = false.obs;
  final RxBool validateChange = true.obs;

  RxInt rowsPerPage = 10.obs;
  RxInt columnIndex = 0.obs;
  RxBool sort = false.obs;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _allAddressSubscription;

  @override
  void onInit() {
    super.onInit();
    _setupAddressItemsSubscription();
  }

  @override
  void onClose() {
    stateController.dispose();
    cityController.dispose();
    _allAddressSubscription?.cancel();
    super.onClose();
  }

  Future onPickCountry() async {
    Map map = await PickCountryDialog().dialog();
    if (map.isNotEmpty) {
      countryName.value = map['name']['common'];
      countryImage.value = map['flags']['svg'];
    }
  }

  onStateChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningState.value = validate;
  }

  onCityChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningCity.value = validate;
  }

  Future onAddAddress() async {
    final user = _auth.currentUser;
    if (user == null) return;
    if (!_validate()) return;
    bool ok = await ConfirmDialog().dialog(content: 'confirm'.tr);
    if (!ok) return;
    String country = countryName.value.trim();
    String countryFlag = countryImage.value.trim();
    String state = stateController.text.trim();
    String city = cityController.text.trim();
    addressModel.create = ConfigDate().dateNowStringFormat();
    addressModel.country = country;
    addressModel.countryFlag = countryFlag;
    addressModel.state = state;
    addressModel.city = city;
    try {
      await _firestore.collection('Address').doc(user.uid).collection('List').add(addressModel.toJson());
      countryName.value = '';
      countryImage.value = '';
      stateController.text = '';
      cityController.text = '';
      warningCountry.value = false;
      warningState.value = false;
      warningCity.value = false;
      Get.snackbar('successful'.tr, 'address_sent'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
    } catch (e) {
      Get.snackbar('error'.tr, 'unexpected_error'.trParams({'error_message': e.toString()}), snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
    }
  }

  onRowsPerPageChanged(int? value) {
    rowsPerPage.value = value ?? 10;
  }

  onSortByCountry(index, ascending) {
    if (sort.value) {
      ConfigSort().sortAddressItemsByCountryDescending(allAddress);
    } else {
      ConfigSort().sortAddressItemsByCountryAscending(allAddress);
    }
    sort.value = !sort.value;
    columnIndex.value = index;
  }

  onSortByState(index, ascending) {
    if (sort.value) {
      ConfigSort().sortAddressItemsByStateDescending(allAddress);
    } else {
      ConfigSort().sortAddressItemsByStateAscending(allAddress);
    }
    sort.value = !sort.value;
    columnIndex.value = index;
  }

  onSortByCity(index, ascending) {
    if (sort.value) {
      ConfigSort().sortAddressItemsByCityDescending(allAddress);
    } else {
      ConfigSort().sortAddressItemsByCityAscending(allAddress);
    }
    sort.value = !sort.value;
    columnIndex.value = index;
  }

  onSortByDate(index, ascending) {
    if (sort.value) {
      ConfigSort().sortAddressItemsByDateDescending(allAddress);
    } else {
      ConfigSort().sortAddressItemsByDateAscending(allAddress);
    }
    sort.value = !sort.value;
    columnIndex.value = index;
  }

  Future onDataTableItemEdit({required AddressModel address}) async {
    await EditAddressDialog().dialog(address: address);
  }

  Future onDataTableItemDelete({required AddressModel address}) async {
    final user = _auth.currentUser;
    if (user == null) return;
    bool confirm = await ConfirmDialog().dialog(content: 'confirm');
    if (!confirm) return;
    String id = address.id!;
    await _firestore.collection('Address').doc(user.uid).collection('List').doc(id).delete();
    Get.snackbar('successful'.tr, 'address_removed'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
  }

  bool _validate() {
    bool validate = true;
    String country = countryName.value.trim();
    String state = stateController.text.trim();
    String city = cityController.text.trim();
    if (country.isEmpty) {
      warningCountry.value = true;
      validate = false;
    }
    if (state.isEmpty) {
      warningState.value = true;
      validate = false;
    }
    if (city.isEmpty) {
      warningCity.value = true;
      validate = false;
    }
    return validate;
  }

  Future _setupAddressItemsSubscription() async {
    final user = _auth.currentUser;
    if (user == null) {
      allAddress.clear();
      return;
    }
    final Query<Map<String, dynamic>> itemsCollectionRef = _firestore.collection('Address').doc(user.uid).collection('List');
    _allAddressSubscription = itemsCollectionRef.snapshots().listen((snapshot) {
      final List<AddressModel> newUsers = snapshot.docs.map((doc) {
        final Map<String, dynamic> data = doc.data();
        return AddressModel.fromJson(data, id: doc.id);
      }).toList();
      allAddress.assignAll(newUsers);
      try {
        ConfigSort().sortAddressItemsByDateDescending(allAddress);
        allAddress.refresh();
      } catch (e) {
        allAddress.clear();
        Get.snackbar('error'.tr, 'unexpected_error'.trParams({'error_message': e.toString()}), snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      }
    });
  }
}
