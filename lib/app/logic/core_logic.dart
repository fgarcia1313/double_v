import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/global/global_routes.dart';

class CoreLogic extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxBool darkLight = true.obs;
  final RxBool isLoggedIn = false.obs;
  final RxBool emailVerified = false.obs;
  final RxBool initialAuthStateChecked = false.obs;

  StreamSubscription<User?>? _userSubscription;

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    darkLight.value = prefs.getBool('darkLightMode') ?? true;
    _checkAuthState();
  }

  @override
  void onClose() {
    _userSubscription?.cancel();
    super.onClose();
  }

  onDarkLight() async {
    darkLight.value = !darkLight.value;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('darkLightMode', darkLight.value);
  }

  onHomeScreen() async {
    Get.toNamed(homeScreen);
  }

  onMyProfileScreen() async {
    Get.toNamed(myProfileScreen);
  }

  onAddressScreen() async {
    Get.toNamed(addressScreen);
  }

  onAllProfilesScreen() async {
    Get.toNamed(allProfilesScreen);
  }

  onLogout() async {
    await _auth.signOut();
    Get.toNamed(splashScreen);
  }

  _checkAuthState() {
    _userSubscription = _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        isLoggedIn.value = true;
        emailVerified.value = user.emailVerified;
      } else {
        isLoggedIn.value = false;
      }
      initialAuthStateChecked.value = true;
    });
  }
}
