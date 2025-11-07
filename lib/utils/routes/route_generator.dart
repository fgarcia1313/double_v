import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/logic/core_logic.dart';
import '../../app/screens/core/address_screen.dart';
import '../../app/screens/core/all_profiles_screen.dart';
import '../../app/screens/core/home_screen.dart';
import '../../app/screens/core/my_profile_screen.dart';
import '../../app/screens/login/login_screen.dart';
import '../../app/screens/login/not_verified_screen.dart';
import '../../app/screens/login/validate_screen.dart';
import '../../app/screens/others/splash_screen.dart';
import '../global/global_routes.dart';
import 'animation_routes.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final Uri deepLink = Uri.parse(settings.name ?? '');

    final CoreLogic logic = Get.find<CoreLogic>();

    final bool isLoggedIn = logic.isLoggedIn.value;
    final bool emailVerified = logic.emailVerified.value;

    if (deepLink.path == splashScreen) {
      return AnimationRoutes.animationTranslation(child: const SplashScreen(), settings: settings);
    } else if (deepLink.path == homeScreen) {
      return AnimationRoutes.animationTranslation(child: const HomeScreen(), settings: settings);
    } else if (deepLink.path == myProfileScreen && !isLoggedIn) {
      return AnimationRoutes.animationTranslation(
        child: const LoginScreen(from: myProfileScreen),
        settings: settings,
      );
    } else if (deepLink.path == myProfileScreen && isLoggedIn && !emailVerified) {
      return AnimationRoutes.animationTranslation(child: const NotVerifiedScreen(), settings: settings);
    } else if (deepLink.path == myProfileScreen && isLoggedIn && emailVerified) {
      return AnimationRoutes.animationTranslation(child: const MyProfileScreen(), settings: settings);
    } else if (deepLink.path == addressScreen && !isLoggedIn) {
      return AnimationRoutes.animationTranslation(
        child: const LoginScreen(from: addressScreen),
        settings: settings,
      );
    } else if (deepLink.path == addressScreen && isLoggedIn && !emailVerified) {
      return AnimationRoutes.animationTranslation(child: const NotVerifiedScreen(), settings: settings);
    } else if (deepLink.path == addressScreen && isLoggedIn && emailVerified) {
      return AnimationRoutes.animationTranslation(child: const AddressScreen(), settings: settings);
    } else if (deepLink.path == allProfilesScreen && !isLoggedIn) {
      return AnimationRoutes.animationTranslation(
        child: const LoginScreen(from: allProfilesScreen),
        settings: settings,
      );
    } else if (deepLink.path == allProfilesScreen && isLoggedIn && !emailVerified) {
      return AnimationRoutes.animationTranslation(child: const NotVerifiedScreen(), settings: settings);
    } else if (deepLink.path == allProfilesScreen && isLoggedIn && emailVerified) {
      return AnimationRoutes.animationTranslation(child: const AllProfilesScreen(), settings: settings);
    } else if (deepLink.path == userValidateScreen) {
      return AnimationRoutes.animationTranslation(
        child: ValidateScreen(oobCode: deepLink.queryParameters['oobCode'], mode: deepLink.queryParameters['mode']),
        settings: settings,
      );
    } else if (deepLink.path == '/') {
      return null;
    } else {
      return AnimationRoutes.animationTranslation(child: const SplashScreen(), settings: settings);
    }
  }
}
