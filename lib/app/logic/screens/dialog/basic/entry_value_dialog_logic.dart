import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/config/config_warning.dart';

class EntryValueDialogLogic extends GetxController {
  final RxString text = "".obs;
  final RxBool validateValue = false.obs;
  final RxBool validateChange = false.obs;
  final RxBool save = false.obs;

  onTextChanged(String value) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, value);
    text.value = value;
    validateValue.value = validate;
  }

  onSave() {
    bool confirm = true;
    if (text.trim().isEmpty) {
      confirm = false;
    }
    if (!confirm) {
      validateChange.value = true;
      validateValue.value = true;
      Get.snackbar(
        'error'.tr,
        'enter_value'.tr,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),
      );
    } else {
      save.value = true;
      Get.back();
    }
  }

  onCancel() {
    Get.back();
  }
}
