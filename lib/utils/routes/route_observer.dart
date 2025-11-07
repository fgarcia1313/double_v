import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/logic/core_logic.dart';

class MyRouteObserver extends GetObserver {
  static final CoreLogic logic = Get.find<CoreLogic>();

  final bool isAuthenticated = logic.isLoggedIn.value;
  final bool emailVerified = logic.emailVerified.value;

  @override
  void didPush(Route route, Route? previousRoute) {}

  @override
  void didPop(Route? route, Route? previousRoute) {
    final String? fullPreviousRoute = previousRoute?.settings.name;
    final Uri previousDeepLink = Uri.parse(fullPreviousRoute ?? '/');
    final String previousRouteName = previousDeepLink.path;

    print('//////////////////////////////');
    print('[GETX] CLOSE TO ROUTE: ${route?.settings.name}');
    print('[GETX] CLOSE PREVIOUS ROUTE: $previousRouteName');
    print('//////////////////////////////');
  }
}
