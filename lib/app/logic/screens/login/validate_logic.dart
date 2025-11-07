import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/config/config_warning.dart';
import '../../../../utils/global/global_routes.dart';
import '../../../../utils/validator/ValidatorPassword.dart';
import '../../../screens/dialog/basic/confirm_dialog.dart';

class ValidateLogic extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = TextEditingController();

  final RxBool warningPassword = false.obs;
  final RxBool obscurePassword = true.obs;
  final RxString validateEmail = ''.obs;
  final RxBool validateChange = false.obs;
  final RxString passwordText = ''.obs;

  String oobCode = '';
  String mode = '';

  onPasswordChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningPassword.value = validate;
  }

  togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future validateEmailOobCode() async {
    try {
      await _auth.checkActionCode(oobCode);
      await _auth.applyActionCode(oobCode);
      validateEmail.value = 'OK';
    } catch (_) {}
  }

  Future resetPassword() async {
    String password = passwordController.text;

    bool error = false;
    validateChange.value = true;
    if (ValidatorPassword().validatePassword(password: password)) {
      warningPassword.value = true;
      error = true;
    }

    if (error) {
      Get.snackbar('error'.tr, 'an_error_occurred'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10));
    } else {
      bool? confirm = await ConfirmDialog().dialog(content: 'reset_password'.tr);
      if (confirm == true) {
        try {
          await _auth.confirmPasswordReset(code: oobCode, newPassword: password);
          Get.snackbar('successful'.tr, 'password_reset_successfully'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10));
          Get.toNamed(splashScreen);
        } catch (e) {
          Get.snackbar('error'.tr, 'unexpected_error'.trParams({'error_message': e.toString()}), snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10));
        }
      }
    }
  }
}
