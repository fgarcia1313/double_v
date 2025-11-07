import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global/global_routes.dart';

class NotVerifiedLogic extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  onVerifyEmail() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      await _auth.signOut();
      Get.snackbar('successful'.tr, 'verification_email_sent_success'.tr, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
      Get.toNamed(splashScreen);
    } catch (e) {
      Get.snackbar('error'.tr, 'unexpected_error'.trParams({'error_message': e.toString()}), snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(20));
    }
  }
}
