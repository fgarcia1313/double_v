import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/address_model.dart';
import '../../../../../utils/config/config_warning.dart';
import '../../../../screens/dialog/address/pick_country_dialog.dart';
import '../../../../screens/dialog/basic/confirm_dialog.dart';

class EditAddressDialogLogic extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  AddressModel addressModel = AddressModel(country: '', state: '', city: '', create: '', countryFlag: '');

  final RxString countryName = ''.obs;
  final RxString countryImage = ''.obs;
  final RxBool warningCountry = false.obs;
  final RxBool warningState = false.obs;
  final RxBool warningCity = false.obs;
  final RxBool validateChange = true.obs;

  @override
  void onInit() {
    countryName.value = addressModel.country;
    countryImage.value = addressModel.countryFlag;
    stateController.text = addressModel.state;
    cityController.text = addressModel.city;
    super.onInit();
  }

  @override
  void onClose() {
    stateController.dispose();
    cityController.dispose();
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

  Future onSave() async {
    final user = _auth.currentUser;
    if (user == null) return;
    if (!_validate()) return;
    bool ok = await ConfirmDialog().dialog(content: 'confirm'.tr);
    if (!ok) return;
    String id = addressModel.id ?? '';
    String country = countryName.value.trim();
    String countryFlag = countryImage.value.trim();
    String state = stateController.text.trim();
    String city = cityController.text.trim();
    addressModel.country = country;
    addressModel.countryFlag = countryFlag;
    addressModel.state = state;
    addressModel.city = city;
    try {
      await _firestore.collection('Address').doc(user.uid).collection('List').doc(id).set(addressModel.toJson());
      countryName.value = '';
      countryImage.value = '';
      stateController.text = '';
      cityController.text = '';
      warningCountry.value = false;
      warningState.value = false;
      warningCity.value = false;
      Get.back();
      Get.snackbar('successful'.tr, 'address_sent'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
    } catch (e) {
      Get.snackbar('error'.tr, 'unexpected_error'.trParams({'error_message': e.toString()}), snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
    }
  }

  onCancel() {
    Get.back();
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
}
