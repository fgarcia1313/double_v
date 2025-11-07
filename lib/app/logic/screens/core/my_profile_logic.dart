import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/user_model.dart';
import '../../../../utils/config/config_date.dart';
import '../../../../utils/config/config_warning.dart';
import '../../../screens/dialog/basic/date_pick_dialog.dart';
import '../../../screens/dialog/basic/entry_value_dialog.dart';

class MyProfileLogic extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();

  final Rx<UserModel> userModel = UserModel(create: '', email: '', name: '', surName: '', born: '', uid: '').obs;
  final RxBool warningName = false.obs;
  final RxBool warningSurName = false.obs;
  final RxBool warningDateBorn = false.obs;
  final RxBool validateChange = true.obs;

  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _userSubscription;

  @override
  void onInit() {
    super.onInit();
    _setupUsersItemsSubscription();
  }

  @override
  void onClose() {
    _userSubscription?.cancel();
    super.onClose();
  }

  Future onPickDateBorn() async {
    Map map = await DatePickDialog().dialog();
    bool save = map['save'];
    if (!save) return;
    DateTime date = map['date'];
    userModel.value.born = ConfigDate().dateToString(date);
    warningDateBorn.value = false;
  }

  onNameChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningName.value = validate;
  }

  onSurNameChanged(String text) {
    bool validate = ConfigWarning().warningTextField(validateChange.value, text);
    warningSurName.value = validate;
  }

  Future onSave() async {
    final user = _auth.currentUser;
    if (user == null) return;
    if (!_validate()) return;
    Map map = await EntryValueDialog().dialog(title: 'password'.tr, typeEntry: 'P');
    bool save = map['save'];
    if (!save) {
      Get.snackbar('Error', 'user_creation_failed'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      return;
    }
    String password = map['text'];
    String email = user.email ?? '';
    try {
      final AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await user.reauthenticateWithCredential(credential);
      String name = nameController.text.trim();
      String surName = surNameController.text.trim();
      await user.updateDisplayName('$name $surName');
      userModel.value.name = name;
      userModel.value.surName = surName;
      await _firestore.collection('Users').doc(user.uid).set(userModel.value.toJson());
      Get.snackbar('successful'.tr, 'User_modified_successfully'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      userModel.refresh();
    } catch (e) {
      Get.snackbar('error'.tr, 'unexpected_error'.trParams({'error_message': e.toString()}), snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
    }
  }

  bool _validate() {
    bool validate = true;
    String name = nameController.text.trim();
    String surName = surNameController.text.trim();
    String born = userModel.value.born;
    if (name.isEmpty) {
      warningName.value = true;
      validate = false;
    }
    if (surName.isEmpty) {
      warningSurName.value = true;
      validate = false;
    }
    if (born.isEmpty) {
      warningDateBorn.value = true;
      validate = false;
    }
    return validate;
  }

  Future _setupUsersItemsSubscription() async {
    final user = _auth.currentUser;
    if (user == null) return;
    String uid = user.uid;
    final DocumentReference<Map<String, dynamic>> itemsCollectionRef = _firestore.collection('Users').doc(uid);
    _userSubscription = itemsCollectionRef.snapshots().listen((snapshot) {
      try {
        userModel.value = UserModel.fromJson(snapshot.data() ?? {});
        nameController.text = userModel.value.name;
        surNameController.text = userModel.value.surName;
      } catch (e) {
        Get.snackbar('error'.tr, 'unexpected_error'.trParams({'error_message': e.toString()}), snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      }
    });
  }
}
