import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/config/config_other.dart';
import '../../../../utils/config/config_warning.dart';
import '../../../../utils/global/global_routes.dart';
import '../../../screens/dialog/basic/entry_value_dialog.dart';
import '../../../screens/dialog/login/create_new_account_dialog.dart';

class LoginLogic extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool obscureText = true.obs;
  final RxBool warningEmail = false.obs;
  final RxBool warningPassword = false.obs;
  final RxBool validateChange = false.obs;
  final RxBool load = false.obs;
  final RxString from = ''.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  onEmailChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningEmail.value = validate;
  }

  onPasswordChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningPassword.value = validate;
  }

  togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  Future login() async {
    validateChange.value = true;
    String email = emailController.text;
    String password = passwordController.text;
    load.value = true;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      warningEmail.value = false;
      warningPassword.value = false;
      await loginSuccessful();
    } on FirebaseAuthException catch (e) {
      warningEmail.value = true;
      warningPassword.value = true;
      if (e.code == 'user-not-found') {
        Get.snackbar('error'.tr, 'user_not_found'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      } else if (e.code == 'wrong-password') {
        Get.snackbar('error'.tr, 'incorrect_password'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      } else {
        Get.snackbar('error'.tr, 'login_error'.trParams({'error_message': e.message ?? e.toString()}), snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      }
    }
    ConfigOther().delay(action: () => load.value = false);
  }

  Future sendPasswordResetEmail() async {
    Map map = await EntryValueDialog().dialog(title: 'enter_email_prompt'.tr);
    bool confirm = map['save'];
    if (!confirm) return;
    String email = map['text'];
    if (email.trim().isEmpty) {
      Get.snackbar('error'.tr, 'enter_email_prompt'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      return;
    }
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('successful'.tr, 'reset_email_sent'.trParams({'email': email}), snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'reset_email_error'.trParams({'error_message': e.message ?? e.toString()});
      if (e.code == 'user-not-found') {
        errorMessage = 'user_not_found_check_email'.tr;
      }
      Get.snackbar('error'.tr, errorMessage, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
    } catch (e) {
      Get.snackbar('error'.tr, 'unexpected_error'.trParams({'error_message': e.toString()}), snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
    }
  }

  Future createNewAccount() async {
    await CreateNewAccountDialog().dialog();
  }

  Future loginSuccessful() async {
    if (_auth.currentUser!.emailVerified == false) {
      Get.offNamed(notVerifiedScreen);
      return;
    }
    if (from.value == myProfileScreen) {
      Get.offAllNamed(myProfileScreen);
    } else if (from.value == addressScreen) {
      Get.offAllNamed(addressScreen);
    }
  }
}
