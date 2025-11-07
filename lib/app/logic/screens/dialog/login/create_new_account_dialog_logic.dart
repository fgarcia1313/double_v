import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../models/user_model.dart';
import '../../../../../utils/config/config_date.dart';
import '../../../../../utils/config/config_warning.dart';
import '../../../../../utils/validator/ValidatorPassword.dart';
import '../../../../screens/dialog/basic/confirm_dialog.dart';
import '../../../../screens/dialog/basic/date_pick_dialog.dart';

class CreateNewAccountDialogLogic extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final RxString dateBorn = ''.obs;
  final RxBool obscurePassword = true.obs;
  final RxBool obscureConfirmPassword = true.obs;
  final RxBool warningName = false.obs;
  final RxBool warningSurName = false.obs;
  final RxBool warningDateBorn = false.obs;
  final RxBool warningEmail = false.obs;
  final RxBool warningPassword = false.obs;
  final RxBool warningConfirmPassword = false.obs;
  final RxBool validateChange = false.obs;
  final RxBool load = false.obs;

  late FirebaseApp _app;
  late FirebaseAuth _auth;
  late FirebaseFirestore _firestore;

  @override
  void onInit() async {
    _app = await Firebase.initializeApp(name: 'Secondary', options: Firebase.app().options);
    _firestore = FirebaseFirestore.instanceFor(app: _app);
    _auth = FirebaseAuth.instanceFor(app: _app);
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    surNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  onNameChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningName.value = validate;
  }

  onSurNameChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningSurName.value = validate;
  }

  onEmailChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningEmail.value = validate;
  }

  onPasswordChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningPassword.value = validate;
  }

  onConfirmPasswordChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningConfirmPassword.value = validate;
  }

  togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  Future onPickDateBorn() async {
    Map map = await DatePickDialog().dialog();
    bool save = map['save'];
    if (!save) return;
    DateTime date = map['date'];
    dateBorn.value = ConfigDate().dateToString(date);
    warningDateBorn.value = false;
  }

  onCancel() {
    if (load.value) return;
    Get.back();
  }

  Future onSave() async {
    if (load.value) return;
    bool ok = await _createUser(
      txtUserName: nameController.text,
      txtUserSurName: surNameController.text,
      dateBorn: dateBorn.value,
      txtEmail: emailController.text,
      txtPassword: passwordController.text,
      txtConfirmPassword: confirmPasswordController.text,
    );
    if (ok) {
      Get.back();
      Get.snackbar('user_created_successfully'.tr, 'verification_email_sent_success'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
    } else {
      validateChange.value = true;
    }
  }

  Future<bool> _createUser({
    required String txtUserName,
    required String txtUserSurName,
    required String dateBorn,
    required String txtEmail,
    required String txtPassword,
    required String txtConfirmPassword,
  }) async {
    bool ok = _validate(txtUserName: txtUserName, txtUserSurName: txtUserSurName, dateBorn: dateBorn, txtEmail: txtEmail, txtPassword: txtPassword, txtConfirmPassword: txtConfirmPassword);
    if (ok) {
      bool confirm = await ConfirmDialog().dialog(content: 'confirm_add_user'.tr);
      if (confirm) {
        load.value = true;
        bool user = await _createUserWithEmailAndPassword(
          userName: txtUserName.trim(),
          userSurName: txtUserSurName,
          dateBorn: dateBorn,
          email: txtEmail.trim().toLowerCase(),
          password: txtPassword,
          create: ConfigDate().dateNowStringFormat(),
        );
        if (!user) {
          ok = false;
          load.value = false;
          user = false;
          Get.snackbar('error'.tr, 'user_creation_failed'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
          warningName.value = true;
          warningEmail.value = true;
          warningPassword.value = true;
          warningConfirmPassword.value = true;
        }
      } else {
        ok = false;
      }
    } else {
      Get.snackbar('Error', 'user_creation_failed'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      warningName.value = true;
      warningEmail.value = true;
      warningPassword.value = true;
      warningConfirmPassword.value = true;
    }
    return ok;
  }

  bool _validate({required String txtUserName, required String txtUserSurName, required String dateBorn, required String txtEmail, required String txtPassword, required String txtConfirmPassword}) {
    bool ok = true;
    if (txtUserName.trim().isEmpty) {
      warningName.value = true;
      ok = false;
    }
    if (txtUserSurName.trim().isEmpty) {
      warningSurName.value = true;
      ok = false;
    }
    if (dateBorn.trim().isEmpty) {
      warningDateBorn.value = true;
      ok = false;
    }
    if (txtEmail.toLowerCase().trim().isEmpty) {
      warningEmail.value = true;
      ok = false;
    }
    if (txtPassword.trim().isEmpty) {
      warningPassword.value = true;
      ok = false;
    }
    if (txtConfirmPassword.trim().isEmpty) {
      warningConfirmPassword.value = true;
      ok = false;
    }
    if (txtPassword != txtConfirmPassword) {
      warningPassword.value = true;
      warningConfirmPassword.value = true;
      ok = false;
    }
    if (ValidatorPassword().validatePassword(password: txtPassword)) {
      warningPassword.value = true;
      warningConfirmPassword.value = true;
      ok = false;
    }
    return ok;
  }

  Future<bool> _createUserWithEmailAndPassword({
    required String userName,
    required String userSurName,
    required String dateBorn,
    required String email,
    required String password,
    required String create,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.updateDisplayName('$userName $userSurName');
      await userCredential.user?.sendEmailVerification();
      UserModel user = UserModel(create: create, email: email, name: userName, surName: userSurName, born: dateBorn, uid: userCredential.user!.uid);
      await _firestore.collection('Users').doc(user.uid).set(user.toJson());
      return true;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'user_creation_error'.trParams({'error_message': e.message ?? e.toString()});
      if (e.code == 'weak-password') {
        errorMessage = 'password_too_weak'.tr;
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'email_already_exists'.tr;
      }
      Get.snackbar('error'.tr, errorMessage, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      return false;
    } catch (e) {
      Get.snackbar('error'.tr, 'unexpected_error'.trParams({'error_message': e.toString()}), snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      return false;
    }
  }
}
