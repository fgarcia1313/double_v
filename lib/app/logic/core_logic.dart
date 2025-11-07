import 'dart:async';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/global/global_routes.dart';
import '../screens/dialog/basic/language_dialog.dart';

class CoreLogic extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxBool darkLight = true.obs;
  final Rx<Locale> currentLocale = (Get.deviceLocale ?? Locale('en')).obs;
  final RxBool isLoggedIn = false.obs;
  final RxBool emailVerified = false.obs;
  final RxBool initialAuthStateChecked = false.obs;

  StreamSubscription<User?>? _userSubscription;

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    darkLight.value = prefs.getBool('darkLightMode') ?? true;
    String language = prefs.getString('language') ?? '';
    if (language.isNotEmpty) currentLocale.value = Locale(language);
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

  Future onLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map map = await LanguageDialog().dialog(language: currentLocale.value);
    bool confirm = map['save'];
    if (!confirm) return;
    String languageCode = map['languageCode'];
    currentLocale.value = Locale(languageCode);
    prefs.setString('language', languageCode);
    Get.updateLocale(currentLocale.value);
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
